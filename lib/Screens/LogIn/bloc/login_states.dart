import 'package:shop/Screens/LogIn/login_model.dart';

abstract class LogInState {}

class SuffixIconState extends LogInState {}
class LoginInitialState extends LogInState {}

class LoginSucessState extends LogInState {
  final LoginModel loginModel;
  LoginSucessState(this.loginModel);
}
class LoginSLoadingState extends LogInState {

}

class LoginErrorState extends LogInState {
  final String error;

  LoginErrorState(this.error);
}
