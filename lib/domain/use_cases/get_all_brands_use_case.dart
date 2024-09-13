import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_fri/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/CategoryOrBrandResponseEntity.dart';
import '../failures.dart';

@injectable
class GetAllBrandsUseCase {
  HomeRepository homeRepository;

  GetAllBrandsUseCase({required this.homeRepository});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke() {
    return homeRepository.getAllBrands();
  }
}