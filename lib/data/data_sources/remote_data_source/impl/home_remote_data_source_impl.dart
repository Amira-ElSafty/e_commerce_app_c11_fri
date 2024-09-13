import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_fri/core/widget/shared_preference_utils.dart';
import 'package:flutter_e_commerece_c11_fri/data/api_manager.dart';
import 'package:flutter_e_commerece_c11_fri/data/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:flutter_e_commerece_c11_fri/data/model/AddToCartResponseDto.dart';
import 'package:flutter_e_commerece_c11_fri/data/model/CategoryOrBrandResponseDto.dart';
import 'package:flutter_e_commerece_c11_fri/data/model/ProductResponseDto.dart';
import 'package:flutter_e_commerece_c11_fri/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../../../end_points.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>>
      getAllCategories() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        //todo: internet connection
        var response = await apiManager.getData(EndPoints.getAllCategories);
        var getAllCategoriesResponse =
            CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo: success
          return Right(getAllCategoriesResponse);
        } else {
          //todo: error => server
          return Left(
              ServerError(errorMessage: getAllCategoriesResponse.message!));
        }
      } else {
        //todo: no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection,Please check'
                'internet.'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        //todo: internet connection
        var response = await apiManager.getData(EndPoints.getAllBrands);
        var getAllCategoriesResponse =
            CategoryOrBrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo: success
          return Right(getAllCategoriesResponse);
        } else {
          //todo: error => server
          return Left(
              ServerError(errorMessage: getAllCategoriesResponse.message!));
        }
      } else {
        //todo: no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection,Please check'
                'internet.'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductResponseDto>> getAllProducts() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        //todo: internet connection
        var response = await apiManager.getData(EndPoints.getAllProducts);
        var getAllProductsResponse = ProductResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo: success
          return Right(getAllProductsResponse);
        } else {
          //todo: error => server
          return Left(
              ServerError(errorMessage: getAllProductsResponse.message!));
        }
      } else {
        //todo: no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection,Please check'
                'internet.'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, AddToCartResponseDto>> addToCart(
      String productId) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        //todo: internet connection
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.postData(EndPoints.addToCart,
            body: {"productId": productId},
            headers: {'token': token.toString()});
        var addToCartResponse = AddToCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo: success
          return Right(addToCartResponse);
        } else {
          //todo: error => server
          return Left(ServerError(errorMessage: addToCartResponse.message!));
        }
      } else {
        //todo: no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection,Please check'
                'internet.'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
