import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerece_c11_fri/domain/entities/GetCartResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/use_cases/delete_item_in_cart_use_case.dart';
import 'package:flutter_e_commerece_c11_fri/domain/use_cases/get_cart_use_case.dart';
import 'package:flutter_e_commerece_c11_fri/domain/use_cases/update_count_in_cart_use_case.dart';
import 'package:flutter_e_commerece_c11_fri/features/cart/cubit/cart_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartScreenViewModel extends Cubit<CartStates> {
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;

  UpdateCountInCartUseCase updateCountInCartUseCase;

  CartScreenViewModel(
      {required this.getCartUseCase,
      required this.deleteItemInCartUseCase,
      required this.updateCountInCartUseCase})
      : super(CartInitialState());

  //todo: hold data - handle logic
  List<GetProductCartEntity> productsList = [];

  static CartScreenViewModel get(context) => BlocProvider.of(context);

  void getCart() async {
    emit(GetCartLoadingState());
    var either = await getCartUseCase.invoke();
    either.fold((l) => emit(GetCartErrorState(failures: l)), (response) {
      productsList = response.data!.products!;
      emit(GetCartSuccessState(responseEntity: response));
    });
  }

  void deleteItemInCart(String productId) async {
    emit(DeleteItemInCartLoadingState());
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold((l) => emit(DeleteItemInCartErrorState(failures: l)),
        (response) {
      // productsList = response.data!.products!;
      emit(GetCartSuccessState(responseEntity: response));
    });
  }

  void updateCountInCart(String productId, int count) async {
    // emit(UpdateCountInCartLoadingState());
    var either = await updateCountInCartUseCase.invoke(productId, count);
    either.fold((l) => emit(UpdateCountInCartErrorState(failures: l)),
        (response) {
      // productsList = response.data!.products!;
      emit(GetCartSuccessState(responseEntity: response));
    });
  }
}
