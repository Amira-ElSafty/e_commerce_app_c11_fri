import 'package:dartz/dartz.dart';
import 'package:flutter_e_commerece_c11_fri/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';

@injectable
class AddToCartUseCase {
  HomeRepository homeRepository;

  AddToCartUseCase({required this.homeRepository});

  Future<Either<Failures, AddToCartResponseEntity>> invoke(String productId) {
    return homeRepository.addToCart(productId);
  }
}
