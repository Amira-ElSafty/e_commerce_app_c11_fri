import 'package:dartz/dartz.dart';

import '../../../domain/entities/RegisterResponseEntity.dart';
import '../../../domain/failures.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String phone, String password, String rePassword);
}
