<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<vs:stubVirtualService xmlns:vs="http://wu.com/stubio/config" environment="UAT" lastUpdated="2026-09-15" name="RRPairTestSoapService">
    <vs:Properties>
        <vs:Variable>
            <vs:Key>Message</vs:Key>
            <vs:Value>Success</vs:Value>
        </vs:Variable>
        <vs:Variable>
            <vs:Key>Key</vs:Key>
            <vs:Value>Val</vs:Value>
        </vs:Variable>
        <vs:Variable>
            <vs:Key>cvgh</vs:Key>
            <vs:Value>cx</vs:Value>
        </vs:Variable>
    </vs:Properties>
    <vs:DataSources>
        <vs:DataSource>
            <vs:ConnectionName>SV DB</vs:ConnectionName>
            <vs:Driver>Cloudscape/COM.cloudscape.core.JDBCDriver</vs:Driver>
            <vs:Host>10.29.29.33</vs:Host>
            <vs:Port>8080</vs:Port>
            <vs:SID>1236yh</vs:SID>
            <vs:User>sv user</vs:User>
            <vs:Password>Password</vs:Password>
            <vs:ConProperty/>
        </vs:DataSource>
    </vs:DataSources>
    <vs:ExecutionMode>
        <vs:ExecutionModeValue/>
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
        <vs:Response contentType="application/xml" responseDelay="10" statusCode="200" statusMsg="OK">
            <vs:Headers>
                <vs:Header>
                    <vs:Key>Custom</vs:Key>
                    <vs:Value>value</vs:Value>
                </vs:Header>
            </vs:Headers>
            <vs:body><![CDATA[{
    "error": "Error Message"
}]]></vs:body>
        </vs:Response>
    </vs:DefaultError>
    <vs:ServiceDefinition>
        <vs:WSDLMetadata rootPart="file:/E:/hello_service.wsdl" type="TEXT">
            <vs:WSDLPart>
                <vs:WSDLURL>file:/E:/hello_service.wsdl</vs:WSDLURL>
                <vs:WSDLText>WSDL CONTENT</vs:WSDLText>
            </vs:WSDLPart>
        </vs:WSDLMetadata>
    </vs:ServiceDefinition>
    <vs:SOAPService allowFallback="false" autoRestart="true" contextPath="/" host="localhost" isSecured="false" port="8989">
        <vs:SecuritySettings>
            <vs:Keystore>
                <vs:Path>/opt/certs/server-keystore.jks</vs:Path>
                <vs:Type>JKS</vs:Type>
                <vs:Password>changeit</vs:Password>
                <vs:KeyAlias>server-cert</vs:KeyAlias>
            </vs:Keystore>
            <vs:TrustStore>
                <vs:Path>/opt/certs/client-truststore.jks</vs:Path>
                <vs:Type>JKS</vs:Type>
                <vs:Password>changeit</vs:Password>
            </vs:TrustStore>
            <vs:ClientAuth>true</vs:ClientAuth>
        </vs:SecuritySettings>
        <vs:headerValidator type="NONE"/>
        <vs:StubOperations>
            <!--
                Operation 1 : sayHello
                Mirrors the REST "GET /admin/service" endpoint of New_REST_Latest_v1.vs.
                Header-driven and script-driven pairs only - no request body matching.
                Chain order: 43657843 (Script) -> 43657844 (Selective/Header),
                             with 74657435 held back as defaultRR.
                SOAP carries no query string, so no pair matches on QueryParams.
            -->
            <vs:StubOperation bindingstubOperationName="sayHello" defaultRR="74657435" name="sayHello">
                <vs:DataSourceSelect>
                    <vs:Database>
                        <vs:ConnectionName>SV DB</vs:ConnectionName>
                        <vs:DataSourceName>SV DataSource Name</vs:DataSourceName>
                        <vs:Query><![CDATA[Query,mkjnhb]]></vs:Query>
                        <vs:ResultProperties>
                            <vs:ResultProperty>
                                <vs:Name>DataSource.METID</vs:Name>
                                <vs:ColumnName/>
                            </vs:ResultProperty>
                        </vs:ResultProperties>
                    </vs:Database>
                    <vs:Database>
                        <vs:ConnectionName>SV DB</vs:ConnectionName>
                        <vs:DataSourceName>mnn</vs:DataSourceName>
                        <vs:Query><![CDATA[nmm m m m mm nm]]></vs:Query>
                        <vs:ResultProperties/>
                    </vs:Database>
                    <vs:File>
                        <vs:DataSourceName>SV File</vs:DataSourceName>
                        <vs:FileLocation>C:\Users\329232\Downloads\Report_InactiveServices.xlsx</vs:FileLocation>
                        <vs:FileType>Random</vs:FileType>
                        <vs:Sheet>3 Months - 0 Txns</vs:Sheet>
                        <vs:MappingType>Request Parameters</vs:MappingType>
                        <vs:RandomCount>9</vs:RandomCount>
                        <vs:RequestName/>
                        <vs:RequestColumnMappings>
                            <vs:RequestColumnMapping>
                                <vs:RequestMapping>Sample.Request.field1</vs:RequestMapping>
                                <vs:ComparisonType>Equals</vs:ComparisonType>
                                <vs:ColumnName>Account</vs:ColumnName>
                            </vs:RequestColumnMapping>
                            <vs:RequestColumnMapping>
                                <vs:RequestMapping>Sample.Request.field2</vs:RequestMapping>
                                <vs:ComparisonType>Equals</vs:ComparisonType>
                                <vs:ColumnName>Name</vs:ColumnName>
                            </vs:RequestColumnMapping>
                        </vs:RequestColumnMappings>
                    </vs:File>
                    <vs:File>
                        <vs:DataSourceName>SV File1</vs:DataSourceName>
                        <vs:FileLocation>C://Users//Sample.xlsx</vs:FileLocation>
                        <vs:FileType>Excel</vs:FileType>
                        <vs:Sheet>Sheet 1</vs:Sheet>
                        <vs:MappingType>Random</vs:MappingType>
                        <vs:RandomCount>10</vs:RandomCount>
                        <vs:RequestName/>
                        <vs:RequestColumnMappings/>
                    </vs:File>
                </vs:DataSourceSelect>
                <vs:DataGenerators>
                    <vs:DataGenerator>
                        <vs:Type>Random Number</vs:Type>
                        <vs:StartNumber>1000000000</vs:StartNumber>
                        <vs:EndNumber>9999999999</vs:EndNumber>
                        <vs:Variable>RandomNum</vs:Variable>
                    </vs:DataGenerator>
                    <vs:DataGenerator>
                        <vs:Type>Sequential Number</vs:Type>
                        <vs:StartNumber>1000000000</vs:StartNumber>
                        <vs:EndNumber>99999999999999</vs:EndNumber>
                        <vs:Increment>2</vs:Increment>
                        <vs:Variable>SeqNum</vs:Variable>
                    </vs:DataGenerator>
                    <vs:DataGenerator>
                        <vs:Type>Sequential Number</vs:Type>
                        <vs:StartNumber>1</vs:StartNumber>
                        <vs:EndNumber>5</vs:EndNumber>
                        <vs:Increment>1</vs:Increment>
                        <vs:Variable>SeqSmall</vs:Variable>
                    </vs:DataGenerator>
                    <vs:DataGenerator>
                        <vs:Type>Random String</vs:Type>
                        <vs:Length>10</vs:Length>
                        <vs:Variable>StrAlpha</vs:Variable>
                        <vs:prefix>alpha-</vs:prefix>
                        <vs:IsAlphabet>true</vs:IsAlphabet>
                        <vs:IsNumeric>false</vs:IsNumeric>
                        <vs:IsSpecial>false</vs:IsSpecial>
                    </vs:DataGenerator>
                    <vs:DataGenerator>
                        <vs:Type>Random String</vs:Type>
                        <vs:Length>8</vs:Length>
                        <vs:Variable>StrDigits</vs:Variable>
                        <vs:prefix>num-</vs:prefix>
                        <vs:IsAlphabet>false</vs:IsAlphabet>
                        <vs:IsNumeric>true</vs:IsNumeric>
                        <vs:IsSpecial>false</vs:IsSpecial>
                    </vs:DataGenerator>
                    <vs:DataGenerator>
                        <vs:Type>Random String</vs:Type>
                        <vs:Length>12</vs:Length>
                        <vs:Variable>StrAll</vs:Variable>
                        <vs:prefix>all-</vs:prefix>
                        <vs:IsAlphabet>true</vs:IsAlphabet>
                        <vs:IsNumeric>true</vs:IsNumeric>
                        <vs:IsSpecial>true</vs:IsSpecial>
                    </vs:DataGenerator>
                    <vs:DataGenerator>
                        <vs:Type>Random String</vs:Type>
                        <vs:Length>6</vs:Length>
                        <vs:Variable>StrNoFlags</vs:Variable>
                        <vs:IsAlphabet>false</vs:IsAlphabet>
                        <vs:IsNumeric>false</vs:IsNumeric>
                        <vs:IsSpecial>false</vs:IsSpecial>
                    </vs:DataGenerator>
                </vs:DataGenerators>
                <vs:Filters>
                    <vs:Variable>
                        <vs:Type>XPath</vs:Type>
                        <vs:Name>varName</vs:Name>
                        <vs:RequestName>Request1</vs:RequestName>
                        <vs:Path>/xml/val</vs:Path>
                        <vs:AppendMode>false</vs:AppendMode>
                    </vs:Variable>
                    <vs:Variable>
                        <vs:Type>Timestamp Filter</vs:Type>
                        <vs:Name>currentTime</vs:Name>
                        <vs:DateFormat>mm/dd/yyyy</vs:DateFormat>
                        <vs:Offset>1</vs:Offset>
                        <vs:AppendMode>false</vs:AppendMode>
                    </vs:Variable>
                    <vs:Variable>
                        <vs:Type>Boundary Condition Filter</vs:Type>
                        <vs:Name>part1</vs:Name>
                        <vs:StartText>abc</vs:StartText>
                        <vs:EndText>xyz</vs:EndText>
                        <vs:AppendMode>false</vs:AppendMode>
                    </vs:Variable>
                    <vs:Variable>
                        <vs:Type>Save Property Value to File</vs:Type>
                        <vs:Name>file1</vs:Name>
                        <vs:FilePath>/xml/val</vs:FilePath>
                        <vs:PropertyName>Request1</vs:PropertyName>
                        <vs:AppendMode>true</vs:AppendMode>
                    </vs:Variable>
                </vs:Filters>
                <vs:RequestData>
                    <vs:Request>
                        <vs:ContentType>application/xml</vs:ContentType>
                        <vs:Body/>
                        <vs:Name>XML Request</vs:Name>
                    </vs:Request>
                    <vs:Request>
                        <vs:ContentType>application/xml</vs:ContentType>
                        <vs:Body/>
                        <vs:Name>Json Request</vs:Name>
                    </vs:Request>
                </vs:RequestData>
                <!-- Pair 1 : MatchStyle=Script. Claims only when header X-Get-Script=MATCH.
                     Carries two responses to prove the second one is NEVER served implicitly. -->
                <vs:RRPair id="43657843">
                    <vs:Request contentType="text/xml">
                        <vs:RequestData><![CDATA[Sample Request]]></vs:RequestData>
                        <vs:RequestParameters/>
                        <vs:Headers/>
                        <vs:QueryParams/>
                    </vs:Request>
                    <vs:ResponseSelection>
                        <vs:MatchStyle>Script</vs:MatchStyle>
                        <vs:MatchScript>
                            <vs:ScriptLang>Groovy</vs:ScriptLang>
                            <vs:Script><![CDATA[
def mode = mockRequest.getRequestHeaders().getFirst("X-Get-Script")
if (mode == "MATCH") {
    matchContext.setResponse("GetScriptMatched")
    return true
}
return false
]]></vs:Script>
                        </vs:MatchScript>
                    </vs:ResponseSelection>
                    <vs:ResponseSet>
                        <vs:Response contentType="text/xml" httpMsg="OK" name="GetScriptMatched" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
  <soapenv:Body>
    <sayHelloResponse>
      <result>SOAP_SCRIPT_MATCHED</result>
      <rrPair>43657843</rrPair>
      <style>SCRIPT</style>
      <randomNumber>${RandomNum}</randomNumber>
    </sayHelloResponse>
  </soapenv:Body>
</soapenv:Envelope>]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>Message</vs:Key>
                                    <vs:Value>SOAP Script matched</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                        <vs:Response contentType="text/xml" httpMsg="OK" name="UnusedScriptResponse" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
  <soapenv:Body>
    <sayHelloResponse>
      <result>ERROR_SECOND_RESPONSE_MUST_ONLY_RETURN_IF_EXPLICITLY_SELECTED</result>
    </sayHelloResponse>
  </soapenv:Body>
</soapenv:Envelope>]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>Message</vs:Key>
                                    <vs:Value>Unused script response</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                    </vs:ResponseSet>
                </vs:RRPair>

                <!-- Pair 2 : MatchStyle=Selective on an HTTP header. Headers ARE populated for
                     SOAP (SoapService.toSunHeaders), so this behaves exactly as in REST. -->
                <vs:RRPair id="43657844">
                    <vs:Request contentType="text/xml">
                        <vs:RequestData/>
                        <vs:RequestParameters/>
                        <vs:Headers>
                            <vs:arg case="false" echoValue="false" matchType="Equals" name="X-Get-Mode" selected="true">HEADER</vs:arg>
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
                        <vs:Response contentType="text/xml" httpMsg="OK" name="GetHeaderSelectiveMatched" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
  <soapenv:Body>
    <sayHelloResponse>
      <result>SOAP_HEADER_SELECTIVE_MATCHED</result>
      <rrPair>43657844</rrPair>
      <style>SELECTIVE</style>
    </sayHelloResponse>
  </soapenv:Body>
</soapenv:Envelope>]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>Message</vs:Key>
                                    <vs:Value>SOAP header selective matched</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                    </vs:ResponseSet>
                </vs:RRPair>

                <!-- Pair 3 : MatchStyle=Operation, named by defaultRR. ResponseResolver holds it
                     out of the walk entirely, so its position here cannot shadow the pairs above. -->
                <vs:RRPair id="74657435">
                    <vs:Request/>
                    <vs:ResponseSelection>
                        <vs:MatchStyle>Operation</vs:MatchStyle>
                        <vs:MatchScript>
                            <vs:ScriptLang>Groovy</vs:ScriptLang>
                            <vs:Script/>
                        </vs:MatchScript>
                    </vs:ResponseSelection>
                    <vs:ResponseSet>
                        <vs:Response contentType="text/xml" httpMsg="OK" name="GetOperationFallback" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
  <soapenv:Body>
    <sayHelloResponse>
      <result>SOAP_OPERATION_DEFAULT_FALLBACK</result>
      <rrPair>74657435</rrPair>
      <style>OPERATION</style>
      <digitsOnly>${StrDigits}</digitsOnly>
    </sayHelloResponse>
  </soapenv:Body>
</soapenv:Envelope>]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>Message</vs:Key>
                                    <vs:Value>Success</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                    </vs:ResponseSet>
                </vs:RRPair>
            </vs:StubOperation>
            <!--
                Operation 2 : processPayment
                Mirrors the REST "POST /admin/service" endpoint of New_REST_Latest_v1.vs.
                Body-driven matching. Because the SOAP payload is namespaced and XmlHolder
                parses namespace-aware, every RequestParameters arg name is written as an
                explicit XPath - "//*[local-name()='account']". A bare name such as "account"
                becomes "//account" in RRPairRequestMatcher.extractBodyField() and will NOT
                match a namespaced SOAP element. "//pay:account" and "//*:account" also work
                (XmlHolder rewrites both to local-name()), the explicit form is used here
                because it survives every rewrite pass unchanged.

                Sample request that drives the whole chain:

                <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
                                  xmlns:pay="http://wu.com/stubio/payment">
                  <soapenv:Body>
                    <pay:processPayment>
                      <pay:account>1234</pay:account>
                      <pay:amount>250</pay:amount>
                      <pay:ignoredField>SHOULD_NOT_BE_MATCHED</pay:ignoredField>
                    </pay:processPayment>
                  </soapenv:Body>
                </soapenv:Envelope>

                The operation is selected by SoapRequestHandler on the Body's first child
                local name, so it must stay exactly "processPayment".

                Chain order: 43657847 -> 74657436 -> 74657438 -> 74657439 -> 74657440,
                             with 74657435 held back as defaultRR.
            -->
            <vs:StubOperation bindingstubOperationName="processPayment" defaultRR="74657435" name="processPayment">
                <vs:DataSourceSelect>
                    <vs:Database>
                        <vs:ResultProperties/>
                    </vs:Database>
                    <vs:Database>
                        <vs:ConnectionName>SV DB</vs:ConnectionName>
                        <vs:DataSourceName>lkyjt</vs:DataSourceName>
                        <vs:Query><![CDATA[[pjhgfdx]]></vs:Query>
                        <vs:ResultProperties/>
                    </vs:Database>
                    <vs:File>
                        <vs:RandomCount>0</vs:RandomCount>
                        <vs:RequestName/>
                        <vs:RequestColumnMappings/>
                    </vs:File>
                    <vs:File>
                        <vs:DataSourceName>Data Source</vs:DataSourceName>
                        <vs:FileLocation>C:\Users\329232\Downloads\Report_Consolidated (1).xlsx</vs:FileLocation>
                        <vs:FileType>Query</vs:FileType>
                        <vs:Sheet>January 2026</vs:Sheet>
                        <vs:MappingType>Request</vs:MappingType>
                        <vs:RandomCount>0</vs:RandomCount>
                        <vs:RequestName/>
                        <vs:RequestColumnMappings>
                            <vs:RequestColumnMapping>
                                <vs:RequestMapping>hobbies[1]</vs:RequestMapping>
                                <vs:ComparisonType>Contains</vs:ComparisonType>
                                <vs:ColumnName>S.No.</vs:ColumnName>
                            </vs:RequestColumnMapping>
                        </vs:RequestColumnMappings>
                    </vs:File>
                </vs:DataSourceSelect>
                <vs:DataGenerators>
                    <vs:DataGenerator>
                        <vs:Type>Random Number</vs:Type>
                        <vs:StartNumber>1000000000</vs:StartNumber>
                        <vs:EndNumber>9999999999</vs:EndNumber>
                        <vs:Variable>RandomNum</vs:Variable>
                    </vs:DataGenerator>
                    <vs:DataGenerator>
                        <vs:Type>Sequential Number</vs:Type>
                        <vs:StartNumber>1000000000</vs:StartNumber>
                        <vs:EndNumber>99999999999999</vs:EndNumber>
                        <vs:Increment>2</vs:Increment>
                        <vs:Variable>SeqNum</vs:Variable>
                    </vs:DataGenerator>
                    <vs:DataGenerator>
                        <vs:Type>Sequential Number</vs:Type>
                        <vs:StartNumber>1</vs:StartNumber>
                        <vs:EndNumber>5</vs:EndNumber>
                        <vs:Increment>1</vs:Increment>
                        <vs:Variable>SeqSmall</vs:Variable>
                    </vs:DataGenerator>
                    <vs:DataGenerator>
                        <vs:Type>Random String</vs:Type>
                        <vs:Length>10</vs:Length>
                        <vs:Variable>StrAlpha</vs:Variable>
                        <vs:prefix>alpha-</vs:prefix>
                        <vs:IsAlphabet>true</vs:IsAlphabet>
                        <vs:IsNumeric>false</vs:IsNumeric>
                        <vs:IsSpecial>false</vs:IsSpecial>
                    </vs:DataGenerator>
                    <vs:DataGenerator>
                        <vs:Type>Random String</vs:Type>
                        <vs:Length>8</vs:Length>
                        <vs:Variable>StrDigits</vs:Variable>
                        <vs:prefix>num-</vs:prefix>
                        <vs:IsAlphabet>false</vs:IsAlphabet>
                        <vs:IsNumeric>true</vs:IsNumeric>
                        <vs:IsSpecial>false</vs:IsSpecial>
                    </vs:DataGenerator>
                    <vs:DataGenerator>
                        <vs:Type>Random String</vs:Type>
                        <vs:Length>12</vs:Length>
                        <vs:Variable>StrAll</vs:Variable>
                        <vs:prefix>all-</vs:prefix>
                        <vs:IsAlphabet>true</vs:IsAlphabet>
                        <vs:IsNumeric>true</vs:IsNumeric>
                        <vs:IsSpecial>true</vs:IsSpecial>
                    </vs:DataGenerator>
                    <vs:DataGenerator>
                        <vs:Type>Random String</vs:Type>
                        <vs:Length>6</vs:Length>
                        <vs:Variable>StrNoFlags</vs:Variable>
                        <vs:IsAlphabet>false</vs:IsAlphabet>
                        <vs:IsNumeric>false</vs:IsNumeric>
                        <vs:IsSpecial>false</vs:IsSpecial>
                    </vs:DataGenerator>
                </vs:DataGenerators>
                <vs:Filters>
                    <vs:Variable>
                        <vs:Type>XPath</vs:Type>
                        <vs:Name>varName</vs:Name>
                        <vs:RequestName>Request1</vs:RequestName>
                        <vs:Path>/xml/val</vs:Path>
                        <vs:AppendMode>false</vs:AppendMode>
                    </vs:Variable>
                    <vs:Variable>
                        <vs:Type>Timestamp Filter</vs:Type>
                        <vs:Name>currentTime</vs:Name>
                        <vs:DateFormat>mm/dd/yyyy</vs:DateFormat>
                        <vs:Offset>1</vs:Offset>
                        <vs:AppendMode>false</vs:AppendMode>
                    </vs:Variable>
                    <vs:Variable>
                        <vs:Type>Boundary Condition Filter</vs:Type>
                        <vs:Name>part1</vs:Name>
                        <vs:StartText>abc</vs:StartText>
                        <vs:EndText>xyz</vs:EndText>
                        <vs:AppendMode>false</vs:AppendMode>
                    </vs:Variable>
                    <vs:Variable>
                        <vs:Type>Save Property Value to File</vs:Type>
                        <vs:Name>file1</vs:Name>
                        <vs:FilePath>/xml/val</vs:FilePath>
                        <vs:PropertyName>Request1</vs:PropertyName>
                        <vs:AppendMode>true</vs:AppendMode>
                    </vs:Variable>
                </vs:Filters>
                <vs:RequestData>
                    <vs:Request>
                        <vs:ContentType>application/xml</vs:ContentType>
                        <vs:Body></vs:Body>
                        <vs:Name>Request2</vs:Name>
                    </vs:Request>
                    <vs:Request>
                        <vs:ContentType>application/xml</vs:ContentType>
                        <vs:Body>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;user id="12345"&gt;
    &lt;personalInfo&gt;
        &lt;firstName&gt;Elara&lt;/firstName&gt;
        &lt;lastName&gt;Quinn&lt;/lastName&gt;
        &lt;email verified="true"&gt;elara.quinn@example.com&lt;/email&gt;
        &lt;phone type="mobile"&gt;+1-555-0123&lt;/phone&gt;
    &lt;/personalInfo&gt;
    &lt;address&gt;
        &lt;city&gt;India&lt;/city&gt;
        &lt;state&gt;CA&lt;/state&gt;
    &lt;/address&gt;
&lt;/user&gt;</vs:Body>
                        <vs:Name>Request1 (copy)</vs:Name>
                    </vs:Request>
                    <vs:Request>
                        <vs:ContentType>application/xml</vs:ContentType>
                        <vs:Body>&lt;?xml version="1.0" encoding="UTF-8"?&gt;
&lt;user id="12345"&gt;
    &lt;personalInfo&gt;
        &lt;firstName&gt;Niva&lt;/firstName&gt;
        &lt;lastName&gt;Quinn&lt;/lastName&gt;
        &lt;email verified="true"&gt;elara.quinn@example.com&lt;/email&gt;
        &lt;phone type="mobile"&gt;+1-555-0123&lt;/phone&gt;
    &lt;/personalInfo&gt;
    &lt;address&gt;
        &lt;city&gt;India&lt;/city&gt;
        &lt;state&gt;CA&lt;/state&gt;
    &lt;/address&gt;
&lt;/user&gt;</vs:Body>
                        <vs:Name>Request9</vs:Name>
                    </vs:Request>
                    <vs:Request>
                        <vs:ContentType>application/json</vs:ContentType>
                        <vs:Body>{
    "firstName": "Jane",
    "lastName": "Doe",
    "age": 25,
    "isStudent": false,
    "hobbies": ["reading", "cycling"]
}</vs:Body>
                        <vs:Name>Request2 (copy)</vs:Name>
                    </vs:Request>
                </vs:RequestData>
                <!-- Pair 1 : Selective across body + header at once. All selected args must
                     match. "ignoredField" is selected="false" so it must NOT participate -
                     the request carries SHOULD_NOT_BE_MATCHED for it and the pair must still
                     claim. -->
                <vs:RRPair id="43657847">
                    <vs:Request contentType="text/xml">
                        <vs:RequestData><![CDATA[<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:pay="http://wu.com/stubio/payment">
  <soapenv:Body>
    <pay:processPayment>
      <pay:account>1234</pay:account>
      <pay:amount>250</pay:amount>
      <pay:ignoredField>SHOULD_NOT_BE_MATCHED</pay:ignoredField>
    </pay:processPayment>
  </soapenv:Body>
</soapenv:Envelope>]]></vs:RequestData>
                        <vs:RequestParameters>
                            <vs:arg case="true" echoValue="false" matchType="Equals" name="//*[local-name()='account']" selected="true">1234</vs:arg>
                            <vs:arg case="false" echoValue="false" matchType="Greater Than" name="//*[local-name()='amount']" selected="true">100</vs:arg>
                            <vs:arg case="true" echoValue="false" matchType="Equals" name="//*[local-name()='ignoredField']" selected="false">MUST_NOT_BE_COMPARED</vs:arg>
                        </vs:RequestParameters>
                        <vs:Headers>
                            <vs:arg case="false" echoValue="true" matchType="Equals" name="X-Channel" selected="true">WEB</vs:arg>
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
                        <vs:Response contentType="text/xml" httpMsg="OK" name="PostCombinedSelectiveMatched" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
  <soapenv:Body>
    <processPaymentResponse>
      <result>SOAP_BODY_HEADER_SELECTIVE_MATCHED</result>
      <rrPair>43657847</rrPair>
      <style>SELECTIVE</style>
      <echoedChannel>${X-Channel}</echoedChannel>
      <randomNumber>${RandomNum}</randomNumber>
    </processPaymentResponse>
  </soapenv:Body>
</soapenv:Envelope>]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>Message</vs:Key>
                                    <vs:Value>Success</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                    </vs:ResponseSet>
                </vs:RRPair>

                <!-- Pair 2 : Selective on a header only, body ignored entirely. -->
                <vs:RRPair id="74657436">
                    <vs:Request contentType="text/xml">
                        <vs:RequestData/>
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
                        <vs:Response contentType="text/xml" httpMsg="OK" name="HeaderOnlyMatched" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
  <soapenv:Body>
    <processPaymentResponse>
      <result>SOAP_HEADER_ONLY_SELECTIVE_MATCHED</result>
      <rrPair>74657436</rrPair>
      <style>SELECTIVE</style>
    </processPaymentResponse>
  </soapenv:Body>
</soapenv:Envelope>]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>Message</vs:Key>
                                    <vs:Value>HeaderOnly</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                    </vs:ResponseSet>
                </vs:RRPair>

                <!-- Pair 3 : Script picking between two responses off the request body.
                     XmlSlurper is used with declareNamespace-free access, so it reads the
                     payload regardless of prefix. Send <pay:tier>GOLD</pay:tier> or SILVER. -->
                <vs:RRPair id="74657438">
                    <vs:Request contentType="text/xml">
                        <vs:RequestData><![CDATA[<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:pay="http://wu.com/stubio/payment">
  <soapenv:Body>
    <pay:processPayment>
      <pay:tier>GOLD</pay:tier>
    </pay:processPayment>
  </soapenv:Body>
</soapenv:Envelope>]]></vs:RequestData>
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
if (body == null || body.trim().isEmpty()) {
    return false
}

def tier = new org.framework.utils.GroovyUtils(null)
        .getXmlHolder(body)
        .getNodeValue("//*[local-name()='tier']")

if (tier == "GOLD") {
    matchContext.setResponse("GoldResponse")
    return true
}

if (tier == "SILVER") {
    matchContext.setResponse("SilverResponse")
    return true
}

return false
]]></vs:Script>
                        </vs:MatchScript>
                    </vs:ResponseSelection>
                    <vs:ResponseSet>
                        <vs:Response contentType="text/xml" httpMsg="OK" name="GoldResponse" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
  <soapenv:Body>
    <processPaymentResponse>
      <result>SOAP_SCRIPT_GOLD_MATCHED</result>
      <rrPair>74657438</rrPair>
      <style>SCRIPT</style>
    </processPaymentResponse>
  </soapenv:Body>
</soapenv:Envelope>]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>Message</vs:Key>
                                    <vs:Value>Gold</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                        <vs:Response contentType="text/xml" httpMsg="OK" name="SilverResponse" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
  <soapenv:Body>
    <processPaymentResponse>
      <result>SOAP_SCRIPT_SILVER_MATCHED</result>
      <rrPair>74657438</rrPair>
      <style>SCRIPT</style>
    </processPaymentResponse>
  </soapenv:Body>
</soapenv:Envelope>]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>Message</vs:Key>
                                    <vs:Value>Silver</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                    </vs:ResponseSet>
                </vs:RRPair>

                <!-- Pair 4 : Script that returns true WITHOUT calling setResponse().
                     GroovyScriptResponseGenerator must log the warning and decline, so the
                     single response below must never be served. Send
                     <pay:scriptCase>NO_RESPONSE</pay:scriptCase> and expect the defaultRR
                     fallback, not MUST_NOT_BE_IMPLICIT_DEFAULT. -->
                <vs:RRPair id="74657439">
                    <vs:Request contentType="text/xml">
                        <vs:RequestData><![CDATA[<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:pay="http://wu.com/stubio/payment">
  <soapenv:Body>
    <pay:processPayment>
      <pay:scriptCase>NO_RESPONSE</pay:scriptCase>
    </pay:processPayment>
  </soapenv:Body>
</soapenv:Envelope>]]></vs:RequestData>
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
if (body == null || body.trim().isEmpty()) {
    return false
}

def scriptCase = new org.framework.utils.GroovyUtils(null)
        .getXmlHolder(body)
        .getNodeValue("//*[local-name()='scriptCase']")

if (scriptCase == "NO_RESPONSE") {
    return true
}

return false
]]></vs:Script>
                        </vs:MatchScript>
                    </vs:ResponseSelection>
                    <vs:ResponseSet>
                        <vs:Response contentType="text/xml" httpMsg="OK" name="MUST_NOT_BE_IMPLICIT_DEFAULT" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
  <soapenv:Body>
    <processPaymentResponse>
      <result>ERROR_THIS_RESPONSE_MUST_NOT_BE_RETURNED_IMPLICITLY</result>
    </processPaymentResponse>
  </soapenv:Body>
</soapenv:Envelope>]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>Message</vs:Key>
                                    <vs:Value>ShouldNotReturn</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                    </vs:ResponseSet>
                </vs:RRPair>

                <!-- Pair 5 : Selective on a NESTED element, the SOAP counterpart of the REST
                     nested-JSONPath pair. The second arg is selected="false" and must be
                     skipped, so a request whose tier is not PLATINUM still claims here as
                     long as customer/id is C-900. -->
                <vs:RRPair id="74657440">
                    <vs:Request contentType="text/xml">
                        <vs:RequestData><![CDATA[<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:pay="http://wu.com/stubio/payment">
  <soapenv:Body>
    <pay:processPayment>
      <pay:customer>
        <pay:id>C-900</pay:id>
        <pay:tier>PLATINUM</pay:tier>
      </pay:customer>
    </pay:processPayment>
  </soapenv:Body>
</soapenv:Envelope>]]></vs:RequestData>
                        <vs:RequestParameters>
                            <vs:arg case="true" echoValue="false" matchType="Equals" name="//*[local-name()='customer']/*[local-name()='id']" selected="true">C-900</vs:arg>
                            <vs:arg case="true" echoValue="false" matchType="Equals" name="//*[local-name()='customer']/*[local-name()='tier']" selected="false">PLATINUM</vs:arg>
                        </vs:RequestParameters>
                        <vs:Headers/>
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
                        <vs:Response contentType="text/xml" httpMsg="OK" name="NestedXPathMatched" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
  <soapenv:Body>
    <processPaymentResponse>
      <result>SOAP_NESTED_XPATH_SELECTIVE_MATCHED</result>
      <rrPair>74657440</rrPair>
      <style>SELECTIVE</style>
      <customerId>C-900</customerId>
    </processPaymentResponse>
  </soapenv:Body>
</soapenv:Envelope>]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>Message</vs:Key>
                                    <vs:Value>NestedXPathMatched</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                    </vs:ResponseSet>
                </vs:RRPair>

                <!-- Pair 6 : Operation fallback, named by defaultRR. Held out of the walk, so
                     the args below are never compared - Operation claims unconditionally. -->
                <vs:RRPair id="74657435">
                    <vs:Request>
                        <vs:RequestData><![CDATA[Sample Request]]></vs:RequestData>
                        <vs:RequestParameters>
                            <vs:arg case="true" echoValue="false" matchType="=" name="//*[local-name()='account']" selected="true">1235</vs:arg>
                            <vs:arg case="false" echoValue="false" matchType="&lt;" name="//*[local-name()='amount']" selected="true">100</vs:arg>
                        </vs:RequestParameters>
                    </vs:Request>
                    <vs:ResponseSelection>
                        <vs:MatchStyle>Operation</vs:MatchStyle>
                        <vs:MatchScript>
                            <vs:ScriptLang>Groovy</vs:ScriptLang>
                            <vs:Script/>
                        </vs:MatchScript>
                    </vs:ResponseSelection>
                    <vs:ResponseSet>
                        <vs:Response contentType="text/xml" httpMsg="OK" name="PostOperationFallback" responseDelay="0" statusCode="200">
                            <vs:Body><![CDATA[<?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
  <soapenv:Body>
    <processPaymentResponse>
      <result>SOAP_OPERATION_DEFAULT_FALLBACK</result>
      <rrPair>74657435</rrPair>
      <style>OPERATION</style>
      <sequentialNumber>${SeqNum}</sequentialNumber>
      <alphaOnly>${StrAlpha}</alphaOnly>
    </processPaymentResponse>
  </soapenv:Body>
</soapenv:Envelope>]]></vs:Body>
                            <vs:ResponseScript>
                                <vs:ScriptLang>Groovy</vs:ScriptLang>
                                <vs:Script/>
                            </vs:ResponseScript>
                            <vs:CustomHeaders>
                                <vs:Header>
                                    <vs:Key>Message</vs:Key>
                                    <vs:Value>Success</vs:Value>
                                </vs:Header>
                            </vs:CustomHeaders>
                        </vs:Response>
                    </vs:ResponseSet>
                </vs:RRPair>
            </vs:StubOperation>
        </vs:StubOperations>
    </vs:SOAPService>
    <vs:CustomScripts>
        <vs:CustomScript>
            <vs:ScriptLang>Groovy</vs:ScriptLang>
            <vs:ExecutionType>VS Start</vs:ExecutionType>
            <vs:Script><![CDATA[//Custom Script]]></vs:Script>
        </vs:CustomScript>
        <vs:CustomScript>
            <vs:ScriptLang>Groovy</vs:ScriptLang>
            <vs:ExecutionType>VS Stop</vs:ExecutionType>
            <vs:Script><![CDATA[//Custom Script]]></vs:Script>
        </vs:CustomScript>
        <vs:CustomScript>
            <vs:ScriptLang>Groovy</vs:ScriptLang>
            <vs:ExecutionType>On Request</vs:ExecutionType>
            <vs:Script><![CDATA[//Custom Script]]></vs:Script>
        </vs:CustomScript>
        <vs:CustomScript>
            <vs:ScriptLang>Groovy</vs:ScriptLang>
            <vs:ExecutionType>On Response</vs:ExecutionType>
            <vs:Script><![CDATA[//Custom Script]]></vs:Script>
        </vs:CustomScript>
    </vs:CustomScripts>
    <vs:Config>
        <vs:ThreadPool coreThreads="2" maxThreads="2"/>
        <vs:ResponseDelay>0</vs:ResponseDelay>
    </vs:Config>
    <vs:Metadata/>
</vs:stubVirtualService>
