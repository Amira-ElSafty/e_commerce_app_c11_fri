import 'package:flutter_e_commerece_c11_fri/domain/entities/LoginResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/failures.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  Failures failures;

  LoginErrorState({required this.failures});
}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity loginResponseEntity;

  LoginSuccessState({required this.loginResponseEntity});
}
