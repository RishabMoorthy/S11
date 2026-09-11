package org.framework.core.impl;

import groovy.lang.Script;
import org.framework.core.MatchScriptEvaluator;
import org.framework.core.PairOutcome;
import org.framework.core.ResponseGenerator;
import org.framework.properties.Context;
import org.framework.properties.MatchContext;
import org.framework.properties.MockRequest;
import org.framework.utils.Logger;

import java.util.HashMap;

/**
 * Runs Groovy scripts for two separate contracts:
 *
 * <ul>
 *   <li>TCP GenerateResponse: existing "return response name" behavior.</li>
 *   <li>RRPair MatchScript: set the response through matchContext and return
 *       true; return false/null to decline and continue to the next RRPair.</li>
 * </ul>
 */
public class GroovyScriptResponseGenerator implements ResponseGenerator, MatchScriptEvaluator {

    String script;
    Class<? extends Script> parsedScript;
    GroovyScriptExecutor groovyExecutor = new GroovyScriptExecutor();

    public GroovyScriptResponseGenerator(String script) {
        this.script = script;
        this.parsedScript = groovyExecutor.parseScript(script, script);
    }

    /**
     * Existing TCP contract - unchanged.
     */
    @Override
    public String GenerateResponse(Context context, MockRequest request) {
        if (script == null || script.isEmpty()) {
            return null;
        }

        try {
            HashMap<String, Object> configureScriptProperties = new HashMap<>();
            configureScriptProperties.put("context", context);
            configureScriptProperties.put("mockOperation", context.getMockOperation());
            configureScriptProperties.put("mockRequest", request);
            configureScriptProperties.put("mockService", context.getMockService());

            return groovyExecutor.runScript(parsedScript, configureScriptProperties);
        } catch (Exception e) {
            Logger.getInstance().error(context.getMockService().getName(), e);
            return null;
        }
    }

    /**
     * RRPair MatchScript contract agreed for sequential RRPair execution:
     *
     * <pre>
     * matchContext.setResponse("ResponseName")
     * return true
     * </pre>
     *
     * means the current RRPair claims the request and serves ResponseName.
     *
     * <p>{@code return false}, {@code return null}, no return value, a thrown
     * exception, or {@code return true} without selecting a response all cause
     * this RRPair to decline so ResponseResolver continues to the next RRPair.
     *
     * <p>This deliberately prevents the first response in a multi-response
     * RRPair from becoming an implicit/default response.
     */
    @Override
    public PairOutcome evaluate(Context context, MockRequest request, MatchContext matchContext) {
        if (script == null || script.isEmpty()) {
            return PairOutcome.declined();
        }

        try {
            HashMap<String, Object> scriptProperties = new HashMap<>();
            scriptProperties.put("context", context);
            scriptProperties.put("mockOperation", context.getMockOperation());
            scriptProperties.put("mockRequest", request);
            scriptProperties.put("mockService", context.getMockService());
            scriptProperties.put("matchContext", matchContext);

            Object result = groovyExecutor.runScriptRaw(parsedScript, scriptProperties);

            if (result == null || Boolean.FALSE.equals(result)) {
                return PairOutcome.declined();
            }

            if (Boolean.TRUE.equals(result)) {
                String responseName = matchContext.getResponse();

                if (responseName == null || responseName.isBlank()) {
                    Logger.getInstance().warn("[RRPairChain] pair=" + matchContext.getPairId()
                            + " match script returned true without selecting a response"
                            + " - declining, chain continues. Call"
                            + " matchContext.setResponse(name) before return true.");
                    return PairOutcome.declined();
                }

                return PairOutcome.claimed(responseName);
            }

            // ReadyAPI-style "return responseName" is intentionally not accepted
            // for RRPair match scripts. New contract is response-in-context +
            // boolean result.
            Logger.getInstance().warn("[RRPairChain] pair=" + matchContext.getPairId()
                    + " match script returned '" + result
                    + "' instead of true/false - declining. Match scripts must call"
                    + " matchContext.setResponse(name) and return true.");

            return PairOutcome.declined();
        } catch (Exception e) {
            Logger.getInstance().error("[RRPairChain] pair=" + matchContext.getPairId()
                    + " match script threw " + e + " - declining, chain continues");
            return PairOutcome.declined();
        }
    }
}
