abstract class LoginState {}

class LogininitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginfailedState extends LoginState {
  String errorMessege;
  LoginfailedState({required this.errorMessege});
}

class LoginSuccessState extends LoginState {}
