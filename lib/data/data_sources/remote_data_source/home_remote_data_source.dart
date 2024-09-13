import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_fri/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/failures.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();

  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);
}
