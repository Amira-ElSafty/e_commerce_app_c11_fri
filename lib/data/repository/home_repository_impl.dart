import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_fri/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:flutter_e_commerece_c11_fri/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/failures.dart';
import 'package:flutter_e_commerece_c11_fri/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>>
      getAllCategories() async {
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async {
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() async {
    var either = await homeRemoteDataSource.getAllProducts();
    return either.fold((l) => Left(l), (response) => Right(response));
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId) async {
    var either = await homeRemoteDataSource.addToCart(productId);
    return either.fold((l) => Left(l), (response) => Right(response));
  }
}
