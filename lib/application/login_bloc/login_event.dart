

abstract class LoginEvent {}

class LoginButtonClicked extends LoginEvent {
  String username;
  String password;
  
  
  LoginButtonClicked({required this.username, required this.password});
  
}
