package ksp.kos.ideaplugin.dataflow;

import ksp.kos.ideaplugin.expressions.SyntaxException;
import ksp.kos.ideaplugin.psi.*;

import java.util.*;

/**
 * Created on 12/03/16.
 *
 * @author ptasha
 */
public class FunctionFlow extends BaseFlow<FunctionFlow> implements NamedFlow<FunctionFlow> {
    private final String name;

    private final List<ParameterFlow> parameters;
    private final List<VariableFlow> variables;
    private final ReturnFlow returnFlow;

    public FunctionFlow(String name, List<ParameterFlow> parameters, List<VariableFlow> variables, ReturnFlow returnFlow) {
        this.name = name;
        this.parameters = parameters;
        this.variables = variables;
        this.returnFlow = returnFlow;
    }

    public static FunctionFlow parse(KerboScriptDeclareFunctionClause function) throws SyntaxException {
        String name = function.getName();
        List<ParameterFlow> parameters = new ArrayList<>();
        List<VariableFlow> variables = new ArrayList<>();
        List<KerboScriptInstruction> instructions = function.getInstructionBlock().getInstructionList();
        for (KerboScriptInstruction instruction : instructions) {
            if (instruction instanceof KerboScriptSetStmt) {
                VariableFlow flow = VariableFlow.parse((KerboScriptSetStmt) instruction);
                if (flow!=null) {
                    variables.add(flow);
                }
            } else if (instruction instanceof KerboScriptDeclareStmt) {
                KerboScriptDeclareStmt declareStmt = (KerboScriptDeclareStmt) instruction;
                if (declareStmt.getDeclareParameterClause()!=null) {
                    parameters.add(ParameterFlow.parse(declareStmt.getDeclareParameterClause()));
                } else if (declareStmt.getDeclareIdentifierClause()!=null) {
                    variables.add(VariableFlow.parse(declareStmt.getDeclareIdentifierClause()));
                }
            } else if (instruction instanceof KerboScriptReturnStmt) {
                return new FunctionFlow(name, parameters, variables, ReturnFlow.parse((KerboScriptReturnStmt)instruction));
            }
        }
        throw new SyntaxException("Return statement is not found for function "+name);
    }

    @Override
    public FunctionFlow differentiate() {
        HashMap<String, NamedFlow<?>> context = new HashMap<>();
        List<ParameterFlow> diffParameters = new LinkedList<>();
        for (ParameterFlow parameter : parameters) {
            ParameterFlow diff = parameter.differentiate();
            add(diffParameters, parameter, context);
            add(diffParameters, diff, context);
        }
        List<VariableFlow> diffVariables = new LinkedList<>();
        for (VariableFlow variable : variables) {
            VariableFlow diff = variable.differentiate();
            add(diffVariables, variable, context);
            add(diffVariables, diff, context);
        }
        ReturnFlow diffRet = returnFlow.differentiate();
        diffRet.addContext(context);

        for (ListIterator<VariableFlow> iterator = diffVariables.listIterator(diffVariables.size()); iterator.hasPrevious(); ) {
            VariableFlow variable = iterator.previous();
            if (!variable.hasDependees()) {
                iterator.remove();
            }
        }
        int i = 0;
        for (Iterator<ParameterFlow> iterator = diffParameters.iterator(); iterator.hasNext(); ) {
            ParameterFlow diffParameter = iterator.next();
            if (i >= parameters.size()) {
                if (!diffParameter.hasDependees()) {
                    iterator.remove();
                }
            }
            i++;
        }

        return new FunctionFlow(name+"_", diffParameters, diffVariables, diffRet);
    }

    private <F extends NamedFlow<F>> void add(List<F> list, F flow, HashMap<String, NamedFlow<?>> context) {
        list.add(flow);
        flow.addContext(context);
    }

    @Override
    public String getText() {
        String text = "";
        text += "function " + name + " {\n";
        for (ParameterFlow parameter : parameters) {
            text+=parameter.getText()+"\n";
        }
        text += "\n";
        for (VariableFlow variable : variables) {
            text+=variable.getText()+"\n";
        }
        text += returnFlow.getText()+"\n";
        text += "}";
        return text;
    }

    @Override
    public String getName() {
        return name;
    }
}
