import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerece_c11_fri/domain/use_cases/register_use_case.dart';
import 'package:flutter_e_commerece_c11_fri/features/auth/presentation/screens/register/cubit/register_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  var nameController = TextEditingController(text: 'Amira');
  var emailController = TextEditingController(text: 'amira1314@route.com');
  var passwordController = TextEditingController(text: 'Amira123');
  var rePasswordController = TextEditingController(text: 'Amira123');
  var phoneController = TextEditingController(text: '01232323232');

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  //todo: hold data - handle logic

  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        phoneController.text,
        passwordController.text,
        rePasswordController.text);
    either.fold((error) {
      emit(RegisterErrorState(failures: error));
    }, (response) {
      emit(RegisterSuccessState(responseEntity: response));
    });
  }
}
