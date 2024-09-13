import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_fri/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/failures.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count);
}
