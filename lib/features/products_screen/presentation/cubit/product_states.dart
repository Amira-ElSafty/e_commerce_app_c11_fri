import 'package:flutter_e_commerece_c11_fri/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/entities/ProductResponseEntity.dart';

import '../../../../domain/failures.dart';

abstract class ProductStates {}

class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductErrorState extends ProductStates {
  Failures failures;

  ProductErrorState({required this.failures});
}

class ProductSuccessState extends ProductStates {
  ProductResponseEntity responseEntity;

  ProductSuccessState({required this.responseEntity});
}

class AddToCartLoadingState extends ProductStates {}

class AddToCartErrorState extends ProductStates {
  Failures failures;

  AddToCartErrorState({required this.failures});
}

class AddToCartSuccessState extends ProductStates {
  AddToCartResponseEntity responseEntity;

  AddToCartSuccessState({required this.responseEntity});
}
