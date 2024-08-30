import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_fri/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:flutter_e_commerece_c11_fri/domain/entities/RegisterResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/failures.dart';
import 'package:flutter_e_commerece_c11_fri/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String phone, String password, String rePassword) async {
    var either = await authRemoteDataSource.register(
        name, email, phone, password, rePassword);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
