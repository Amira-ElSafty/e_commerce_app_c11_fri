import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerece_c11_fri/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter_e_commerece_c11_fri/domain/use_cases/get_all_brands_use_case.dart';
import 'package:flutter_e_commerece_c11_fri/domain/use_cases/get_all_categories_use_case.dart';
import 'package:flutter_e_commerece_c11_fri/features/main_layout/home/presentation/cubit/home_tab_states.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/resources/assets_manager.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;

  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModel(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeInitialState());

  //todo: hold data - handle logic
  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];
  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  static HomeTabViewModel get(context) => BlocProvider.of(context);

  void getAllCategories() async {
    emit(HomeCategoryLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold((l) => emit(HomeCategoryErrorState(failures: l)), (response) {
      categoriesList = response.data ?? [];
      if (brandsList.isNotEmpty) {
        emit(HomeCategorySuccessState(responseEntity: response));
      }
    });
  }

  void getAllBrands() async {
    emit(HomeBrandLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold((l) => emit(HomeBrandErrorState(failures: l)), (response) {
      brandsList = response.data ?? [];
      if (categoriesList.isNotEmpty) {
        emit(HomeBrandSuccessState(responseEntity: response));
      }
    });
  }
}
