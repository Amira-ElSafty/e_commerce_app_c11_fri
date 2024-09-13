import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_fri/data/api_manager.dart';
import 'package:flutter_e_commerece_c11_fri/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:flutter_e_commerece_c11_fri/data/end_points.dart';
import 'package:flutter_e_commerece_c11_fri/data/model/LoginResponseDto.dart';
import 'package:flutter_e_commerece_c11_fri/data/model/RegisterResponseDto.dart';
import 'package:flutter_e_commerece_c11_fri/domain/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDto>> register(String name,
      String email, String phone, String password, String rePassword) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        //todo: internet connection
        var response = await apiManager.postData(EndPoints.register, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone
        });
        var registerResponse = RegisterResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo: success
          return Right(registerResponse);
        } else {
          //todo: error => server
          return Left(ServerError(errorMessage: registerResponse.message!));
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
  Future<Either<Failures, LoginResponseDto>> login(
      String email, String password) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult == ConnectivityResult.wifi ||
          checkResult == ConnectivityResult.mobile) {
        //todo: internet connection
        var response = await apiManager.postData(EndPoints.login, body: {
          "email": email,
          "password": password,
        });
        var loginResponse = LoginResponseDto.fromJson(response.data);
        //todo: Save token
        // SharedPreferenceUtils.saveData(key: 'token', value: loginResponse.token);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo: success
          return Right(loginResponse);
        } else {
          //todo: error => server
          return Left(ServerError(errorMessage: loginResponse.message!));
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
