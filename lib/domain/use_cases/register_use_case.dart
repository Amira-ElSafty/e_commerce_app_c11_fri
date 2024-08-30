import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_fri/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/RegisterResponseEntity.dart';
import '../failures.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, RegisterResponseEntity>> invoke(String name,
      String email, String phone, String password, String rePassword) {
    return authRepository.register(name, email, phone, password, rePassword);
  }
}
