class CubitState {}
class LoadingState extends CubitState{}
class SuccsessState extends CubitState{}
class FailureState extends CubitState{String message;
  FailureState(this.message);
}
class ErrorState extends CubitState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}