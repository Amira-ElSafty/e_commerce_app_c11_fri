import 'package:flutter_e_commerece_c11_fri/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/failures.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartErrorState extends CartStates {
  Failures failures;

  GetCartErrorState({required this.failures});
}

class GetCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  GetCartSuccessState({required this.responseEntity});
}

class DeleteItemInCartLoadingState extends CartStates {}

class DeleteItemInCartErrorState extends CartStates {
  Failures failures;

  DeleteItemInCartErrorState({required this.failures});
}

class DeleteItemInCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  DeleteItemInCartSuccessState({required this.responseEntity});
}

class UpdateCountInCartLoadingState extends CartStates {}

class UpdateCountInCartErrorState extends CartStates {
  Failures failures;

  UpdateCountInCartErrorState({required this.failures});
}

class UpdateCountInCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  UpdateCountInCartSuccessState({required this.responseEntity});
}
