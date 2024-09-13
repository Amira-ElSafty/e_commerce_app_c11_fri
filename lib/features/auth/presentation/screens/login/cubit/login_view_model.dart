import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerece_c11_fri/domain/use_cases/login_use_case.dart';
import 'package:flutter_e_commerece_c11_fri/features/auth/presentation/screens/login/cubit/login_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());

  //todo: hold data - handle logic
  var emailController = TextEditingController(text: 'amira1314@route.com');
  var passwordController = TextEditingController(text: 'Amira123');
  var formKey = GlobalKey<FormState>();

  void login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      either.fold((l) => emit(LoginErrorState(failures: l)), (response) {
        emit(LoginSuccessState(loginResponseEntity: response));
      });
    }
  }
}
