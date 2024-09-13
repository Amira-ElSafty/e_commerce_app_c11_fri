import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerece_c11_fri/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/use_cases/add_to_cart_use_case.dart';
import 'package:flutter_e_commerece_c11_fri/domain/use_cases/get_all_products_use_case.dart';
import 'package:flutter_e_commerece_c11_fri/features/products_screen/presentation/cubit/product_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductViewModel extends Cubit<ProductStates> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductViewModel(
      {required this.getAllProductsUseCase, required this.addToCartUseCase})
      : super(ProductInitialState());

  //todo: hold data - handle logic
  List<ProductEntity> productsList = [];
  int numOfCartItems = 0;

  static ProductViewModel get(context) => BlocProvider.of(context);

  void getAllProducts() async {
    emit(ProductLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold((l) => emit(ProductErrorState(failures: l)), (response) {
      productsList = response.data ?? [];
      emit(ProductSuccessState(responseEntity: response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold((l) => emit(AddToCartErrorState(failures: l)), (response) {
      numOfCartItems = response.numOfCartItems!.toInt();
      print('numOfCartItems: $numOfCartItems');
      emit(AddToCartSuccessState(responseEntity: response));
    });
  }
}
