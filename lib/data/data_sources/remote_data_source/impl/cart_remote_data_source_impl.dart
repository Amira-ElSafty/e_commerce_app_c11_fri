import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_fri/data/api_manager.dart';
import 'package:flutter_e_commerece_c11_fri/data/data_sources/remote_data_source/cart_remote_data_source.dart';
import 'package:flutter_e_commerece_c11_fri/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/widget/shared_preference_utils.dart';
import '../../../end_points.dart';
import '../../../model/GetCartResponseDto.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        //todo: internet connection
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager
            .getData(EndPoints.addToCart, headers: {'token': token.toString()});
        var getCartResponse = GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo: success
          return Right(getCartResponse);
        } else {
          //todo: error => server
          return Left(ServerError(errorMessage: getCartResponse.message!));
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
  Future<Either<Failures, GetCartResponseDto>> deleteItemInCart(
      String productId) async {
    // TODO: implement deleteItemInCart
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        //todo: internet connection
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.deleteData(
            '${EndPoints.addToCart}/$productId',
            headers: {'token': token.toString()});
        var deleteItemInCartResponse =
            GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo: success
          return Right(deleteItemInCartResponse);
        } else {
          //todo: error => server
          return Left(
              ServerError(errorMessage: deleteItemInCartResponse.message!));
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
  Future<Either<Failures, GetCartResponseDto>> updateCountInCart(
      String productId, int count) async {
    // TODO: implement updateCountInCart
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        //todo: internet connection
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.updateData(
            '${EndPoints.addToCart}/$productId',
            body: {'count': '$count'},
            headers: {'token': token.toString()});
        var updateCountInCartResponse =
            GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo: success
          return Right(updateCountInCartResponse);
        } else {
          //todo: error => server
          return Left(
              ServerError(errorMessage: updateCountInCartResponse.message!));
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
