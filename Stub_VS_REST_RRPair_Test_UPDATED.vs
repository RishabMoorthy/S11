<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<vs:stubVirtualService xmlns:vs="http://wu.com/stubio/config" environment="QA" lastUpdated="2026-09-10" name="REST_RRPair_Matching_Test">
    <vs:Properties>
        <vs:Variable>
            <vs:Key>Message</vs:Key>
            <vs:Value>Success</vs:Value>
        </vs:Variable>
    </vs:Properties>
    <vs:DataSources/>
    <vs:ExecutionMode>
        <vs:ExecutionModeValue>Live Invocation</vs:ExecutionModeValue>
        <vs:LiveURLs>
            <vs:LiveURL active="true">
                <vs:EnvType>QA</vs:EnvType>
                <vs:TransType>http</vs:TransType>
                <vs:Host>localhost</vs:Host>
                <vs:Port>8099</vs:Port>
                <vs:BasePath>/service</vs:BasePath>
            </vs:LiveURL>
        </vs:LiveURLs>
    </vs:ExecutionMode>
    <vs:DefaultError>
        <vs:Response contentType="application/json" responseDelay="0" statusCode="500" statusMsg="ERROR">
            <vs:Headers>
                <vs:Header>
                    <vs:Key>Content-Type</vs:Key>
                    <vs:Value>application/json</vs:Value>
                </vs:Header>
            </vs:Headers>
            <vs:body><![CDATA[{"result":"DEFAULT_ERROR"}]]></vs:body>
        </vs:Response>
    </vs:DefaultError>
    <vs:RestService allowFallback="false" autoRestart="true" contextPath="/" host="localhost" isSecured="false" port="8089">
        <vs:SecuritySettings>
            <vs:Keystore>
                <vs:Path/>
                <vs:Type>JKS</vs:Type>
                <vs:Password/>
                <vs:KeyAlias/>
            </vs:Keystore>
            <vs:TrustStore>
                <vs:Path/>
                <vs:Type>JKS</vs:Type>
                <vs:Password/>
            </vs:TrustStore>
            <vs:ClientAuth>false</vs:ClientAuth>
            <vs:ServerAuth>false</vs:ServerAuth>
        </vs:SecuritySettings>
        <vs:Endpoints>

            <!--
              RRPair execution tests for:
                1) Body + Header + QueryParam together
                2) Header-only selective matching
                3) Query-only selective matching
                4) selected="false" ignored
                5) Script true + selected response
                6) Script false -> next RRPair
                7) Script true without response -> decline
                8) Endpoint defaultRR fallback

              IMPORTANT:
                - No RRPair has defaultResponse.
                - defaultRR is at Endpoint level only.
                - RRPair order below is intentional.
            -->
            <vs:Endpoint method="POST" name="RRPairMatchingEndpoint" path="/rrpair/test" defaultRR="RR_DEFAULT">
                <vs:DataSourceSelect>
                    <vs:Database/>
                    <vs:File>
                        <vs:RequestColumnMappings/>
                    </vs:File>
                </vs:DataSourceSelect>
                <vs:DataGenerators/>
                <vs:Filters/>
                <vs:RequestData>
                    <vs:Request>
                        <vs:ContentType>application/json</vs:ContentType>
                        <vs:Body><![CDATA[{
  "account": "12345",
  "amount": 250,
  "customerType": "RETAIL"
}]]></vs:Body>
                        <vs:Name>Request1</vs:Name>
                    </vs:Request>
                </vs:RequestData>

                <!-- TEST 1: body + header + query must ALL match -->
                <vs:RRPair id="RR_BODY_HEADER_QUERY">
                    <vs:Request contentType="application/json">
                        <vs:RequestData><![CDATA[{
  "account": "12345",
  "amount": 250,
  "customerType": "RETAIL"
}]]></vs:RequestData>
                        <vs:RequestParameters>
                            <vs:arg case="true" echoValue="true" matchType="Equals" name="account" selected="true">12345</vs:arg>
                            <vs:arg case="true" echoValue="false" matchType="Greater Than" name="amount" selected="true">100</vs:arg>
                            <vs:arg case="true" echoValue="false" matchType="Equals" name="customerType" selected="false">THIS_VALUE_MUST_BE_IGNORED</vs:arg>
                        </vs:RequestParameters>
                        <vs:Headers>
                            <vs:arg case="false" echoValue="true" matchType="Equals" name="X-Channel" selected="true">WEB</vs:arg>
                        </vs:Headers>
                        <vs:QueryParams>
                            <vs:arg case="false" echoValue="true" matchType="Equals" name="region" selected="true">IN</vs:arg>
                        </vs:QueryParams>
                    </vs:Request>
                    <vs:ResponseSelection>
                        <vs:MatchStyle>Selective</vs:MatchStyle>
                        <vs:MatchScript>
                            <vs:ScriptLang>Groovy</vs:ScriptLang>
                            <vs:Script/>
                        </vs:MatchScript>
                    </vs:ResponseSelection>
                    <vs:ResponseSet>
                        <vs:Response contentType="application/json" httpMsg="OK" name="BodyHeaderQueryMatched" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[{"matched":"BODY_HEADER_QUERY","response":"BodyHeaderQueryMatched"}]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>X-RRPair</vs:Key>
                                    <vs:Value>RR_BODY_HEADER_QUERY</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                    </vs:ResponseSet>
                </vs:RRPair>

                <!-- TEST 2: header-only Selective RRPair -->
                <vs:RRPair id="RR_HEADER_ONLY">
                    <vs:Request contentType="application/json">
                        <vs:RequestData><![CDATA[{}]]></vs:RequestData>
                        <vs:RequestParameters/>
                        <vs:Headers>
                            <vs:arg case="false" echoValue="false" matchType="Equals" name="X-Test-Mode" selected="true">HEADER_ONLY</vs:arg>
                        </vs:Headers>
                        <vs:QueryParams/>
                    </vs:Request>
                    <vs:ResponseSelection>
                        <vs:MatchStyle>Selective</vs:MatchStyle>
                        <vs:MatchScript>
                            <vs:ScriptLang>Groovy</vs:ScriptLang>
                            <vs:Script/>
                        </vs:MatchScript>
                    </vs:ResponseSelection>
                    <vs:ResponseSet>
                        <vs:Response contentType="application/json" httpMsg="OK" name="HeaderOnlyMatched" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[{"matched":"HEADER_ONLY","response":"HeaderOnlyMatched"}]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>X-RRPair</vs:Key>
                                    <vs:Value>RR_HEADER_ONLY</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                    </vs:ResponseSet>
                </vs:RRPair>

                <!-- TEST 3: query-only Selective RRPair -->
                <vs:RRPair id="RR_QUERY_ONLY">
                    <vs:Request contentType="application/json">
                        <vs:RequestData><![CDATA[{}]]></vs:RequestData>
                        <vs:RequestParameters/>
                        <vs:Headers/>
                        <vs:QueryParams>
                            <vs:arg case="false" echoValue="false" matchType="Equals" name="mode" selected="true">QUERY_ONLY</vs:arg>
                        </vs:QueryParams>
                    </vs:Request>
                    <vs:ResponseSelection>
                        <vs:MatchStyle>Selective</vs:MatchStyle>
                        <vs:MatchScript>
                            <vs:ScriptLang>Groovy</vs:ScriptLang>
                            <vs:Script/>
                        </vs:MatchScript>
                    </vs:ResponseSelection>
                    <vs:ResponseSet>
                        <vs:Response contentType="application/json" httpMsg="OK" name="QueryOnlyMatched" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[{"matched":"QUERY_ONLY","response":"QueryOnlyMatched"}]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>X-RRPair</vs:Key>
                                    <vs:Value>RR_QUERY_ONLY</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                    </vs:ResponseSet>
                </vs:RRPair>

                <!-- TEST 4/5: script selects response and returns true; otherwise false -->
                <vs:RRPair id="RR_SCRIPT">
                    <vs:Request contentType="application/json">
                        <vs:RequestData><![CDATA[{"tier":"GOLD"}]]></vs:RequestData>
                        <vs:RequestParameters/>
                        <vs:Headers/>
                        <vs:QueryParams/>
                    </vs:Request>
                    <vs:ResponseSelection>
                        <vs:MatchStyle>Script</vs:MatchStyle>
                        <vs:MatchScript>
                            <vs:ScriptLang>Groovy</vs:ScriptLang>
                            <vs:Script><![CDATA[
def body = mockRequest.getRequestContent()

if (body != null && body.contains('"tier":"GOLD"')) {
    matchContext.setResponse("GoldResponse")
    return true
}

if (body != null && body.contains('"tier":"SILVER"')) {
    matchContext.setResponse("SilverResponse")
    return true
}

return false
]]></vs:Script>
                        </vs:MatchScript>
                    </vs:ResponseSelection>
                    <vs:ResponseSet>
                        <vs:Response contentType="application/json" httpMsg="OK" name="GoldResponse" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[{"matched":"SCRIPT","tier":"GOLD"}]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>X-RRPair</vs:Key>
                                    <vs:Value>RR_SCRIPT</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                        <vs:Response contentType="application/json" httpMsg="OK" name="SilverResponse" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[{"matched":"SCRIPT","tier":"SILVER"}]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>X-RRPair</vs:Key>
                                    <vs:Value>RR_SCRIPT</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                    </vs:ResponseSet>
                </vs:RRPair>

                <!-- TEST 6: bad script returns true without selecting a response.
                     Updated Java must DECLINE this RRPair and continue. -->
                <vs:RRPair id="RR_SCRIPT_TRUE_NO_RESPONSE">
                    <vs:Request contentType="application/json">
                        <vs:RequestData><![CDATA[{"scriptCase":"NO_RESPONSE"}]]></vs:RequestData>
                        <vs:RequestParameters/>
                        <vs:Headers/>
                        <vs:QueryParams/>
                    </vs:Request>
                    <vs:ResponseSelection>
                        <vs:MatchStyle>Script</vs:MatchStyle>
                        <vs:MatchScript>
                            <vs:ScriptLang>Groovy</vs:ScriptLang>
                            <vs:Script><![CDATA[
def body = mockRequest.getRequestContent()
if (body != null && body.contains('"scriptCase":"NO_RESPONSE"')) {
    return true
}
return false
]]></vs:Script>
                        </vs:MatchScript>
                    </vs:ResponseSelection>
                    <vs:ResponseSet>
                        <vs:Response contentType="application/json" httpMsg="OK" name="MUST_NOT_BE_IMPLICIT_DEFAULT" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[{"ERROR":"THIS_RESPONSE_MUST_NOT_BE_RETURNED_IMPLICITLY"}]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>X-RRPair</vs:Key>
                                    <vs:Value>RR_SCRIPT_TRUE_NO_RESPONSE</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                    </vs:ResponseSet>
                </vs:RRPair>

                <!-- TEST 7: endpoint-level fallback only. Held out by defaultRR. -->
                <vs:RRPair id="RR_DEFAULT">
                    <vs:Request contentType="application/json">
                        <vs:RequestData><![CDATA[{}]]></vs:RequestData>
                        <vs:RequestParameters/>
                        <vs:Headers/>
                        <vs:QueryParams/>
                    </vs:Request>
                    <vs:ResponseSelection>
                        <vs:MatchStyle>Operation</vs:MatchStyle>
                        <vs:MatchScript>
                            <vs:ScriptLang>Groovy</vs:ScriptLang>
                            <vs:Script/>
                        </vs:MatchScript>
                    </vs:ResponseSelection>
                    <vs:ResponseSet>
                        <vs:Response contentType="application/json" httpMsg="OK" name="EndpointDefaultResponse" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[{"matched":"DEFAULT_RR","response":"EndpointDefaultResponse"}]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>X-RRPair</vs:Key>
                                    <vs:Value>RR_DEFAULT</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                    </vs:ResponseSet>
                </vs:RRPair>
            </vs:Endpoint>
        </vs:Endpoints>
    </vs:RestService>
    <vs:CustomScripts>
        <vs:CustomScript>
            <vs:ScriptLang>Groovy</vs:ScriptLang>
            <vs:ExecutionType>VS Start</vs:ExecutionType>
            <vs:Script/>
        </vs:CustomScript>
        <vs:CustomScript>
            <vs:ScriptLang>Groovy</vs:ScriptLang>
            <vs:ExecutionType>VS Stop</vs:ExecutionType>
            <vs:Script/>
        </vs:CustomScript>
        <vs:CustomScript>
            <vs:ScriptLang>Groovy</vs:ScriptLang>
            <vs:ExecutionType>On Request</vs:ExecutionType>
            <vs:Script/>
        </vs:CustomScript>
        <vs:CustomScript>
            <vs:ScriptLang>Groovy</vs:ScriptLang>
            <vs:ExecutionType>On Response</vs:ExecutionType>
            <vs:Script/>
        </vs:CustomScript>
    </vs:CustomScripts>
    <vs:Config>
        <vs:ThreadPool coreThreads="2" maxThreads="2"/>
        <vs:ResponseDelay>0</vs:ResponseDelay>
    </vs:Config>
    <vs:Metadata/>
</vs:stubVirtualService>
