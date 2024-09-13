import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerece_c11_fri/core/resources/color_manager.dart';
import 'package:flutter_e_commerece_c11_fri/core/widget/dialog_utils.dart';
import 'package:flutter_e_commerece_c11_fri/features/main_layout/home/presentation/cubit/home_tab_states.dart';
import 'package:flutter_e_commerece_c11_fri/features/main_layout/home/presentation/cubit/home_tab_view_model.dart';
import 'package:flutter_e_commerece_c11_fri/features/main_layout/home/presentation/widgets/announcement_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/home_screen_app_bar.dart';
import 'widgets/custom_category_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel, HomeTabStates>(
      bloc: HomeTabViewModel.get(context)
        ..getAllCategories()
        ..getAllBrands(),
      listener: (context, state) {
        if (state is HomeCategoryErrorState) {
          DialogUtils.showMessage(
              context: context, message: state.failures.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: HomeScreenAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    AnnouncementWidget(),
                    CustomSectionBar(
                        sectionNname: 'Categories', function: () {}),
                    state is HomeCategoryLoadingState
                        ? Center(
                            child: CircularProgressIndicator(
                            color: ColorManager.primary,
                          ))
                        : SizedBox(
                            height: 270.h,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CategoryOrBrandItemWidget(
                                    list: HomeTabViewModel.get(context)
                                        .categoriesList[index]);
                              },
                              itemCount: HomeTabViewModel.get(context)
                                  .categoriesList
                                  .length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                            ),
                          ),
                    SizedBox(height: 12.h),
                    CustomSectionBar(sectionNname: 'Brands', function: () {}),
                    state is HomeBrandLoadingState
                        ? Center(
                            child: CircularProgressIndicator(
                            color: ColorManager.primary,
                          ))
                        : SizedBox(
                            height: 270.h,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CategoryOrBrandItemWidget(
                                    list: HomeTabViewModel.get(context)
                                        .brandsList[index]);
                              },
                              itemCount: HomeTabViewModel.get(context)
                                  .brandsList
                                  .length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                            ),
                          ),
                    // CustomSectionBar(
                    //   sectionNname: 'Most Selling Products',
                    //   function: () {},
                    // ),
                    // SizedBox(
                    //   child: SizedBox(
                    //     height: 360.h,
                    //     child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context, index) {
                    //         return const ProductCard(
                    //           title: "Nike Air Jordon",
                    //           description:
                    //               "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                    //           rating: 4.5,
                    //           price: 1100,
                    //           priceBeforeDiscound: 1500,
                    //           image: ImageAssets.categoryHomeImage,
                    //         );
                    //       },
                    //       itemCount: 20,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 12.h),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
