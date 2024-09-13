import 'package:flutter_e_commerece_c11_fri/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/failures.dart';

abstract class HomeTabStates {}

class HomeInitialState extends HomeTabStates {}

class HomeCategoryLoadingState extends HomeTabStates {}

class HomeCategoryErrorState extends HomeTabStates {
  Failures failures;

  HomeCategoryErrorState({required this.failures});
}

class HomeCategorySuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity responseEntity;

  HomeCategorySuccessState({required this.responseEntity});
}

class HomeBrandLoadingState extends HomeTabStates {}

class HomeBrandErrorState extends HomeTabStates {
  Failures failures;

  HomeBrandErrorState({required this.failures});
}

class HomeBrandSuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity responseEntity;

  HomeBrandSuccessState({required this.responseEntity});
}
