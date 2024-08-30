import 'package:flutter_e_commerece_c11_fri/domain/entities/RegisterResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/failures.dart';

class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  Failures failures;

  RegisterErrorState({required this.failures});
}

class RegisterSuccessState extends RegisterStates {
  RegisterResponseEntity responseEntity;

  RegisterSuccessState({required this.responseEntity});
}
