import cpp
import semmle.code.cpp.dataflow.DataFlow

/**
 * A call to function `signal`
 */
class SignalCall extends FunctionCall {
  SignalCall() { this.getTarget().hasGlobalName("signal") }
}

/**
 * A signal handler
 */
class SignalHandler extends Function {
  SignalCall registration;

  SignalHandler() {
    // is a signal handler
    this = registration.getArgument(1).(FunctionAccess).getTarget()
  }

  SignalCall getRegistration() { result = registration }

  FunctionCall getReassertingCall() {
    result.getTarget().hasGlobalName("signal") and
    this = result.getEnclosingFunction() and
    (
      this.getRegistration().getArgument(0).getValue() = result.getArgument(0).getValue()
      or
      DataFlow::localFlow(DataFlow::parameterNode(this.getParameter(0)),
        DataFlow::exprNode(result.getArgument(0)))
    )
  }
}

/**
 * A call to `abort` or `_Exit` or `quick_exit`
 */
class AbortCall extends FunctionCall {
  AbortCall() { this.getTarget().hasGlobalName(["abort", "_Exit", "quick_exit"]) }
}
