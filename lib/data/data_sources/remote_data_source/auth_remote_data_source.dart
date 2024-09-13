import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_fri/domain/entities/LoginResponseEntity.dart';

import '../../../domain/entities/RegisterResponseEntity.dart';
import '../../../domain/failures.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String phone, String password, String rePassword);

  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}
