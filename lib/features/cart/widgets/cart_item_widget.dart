import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/routes_manager/routes.dart';
import 'color_and_size_cart_item.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.color,
    required this.colorName,
    required this.size,
    required this.price,
    required this.onDeleteTap,
    required this.quantity,
    required this.onIncrementTap,
    required this.onDecrementTap,
  });
  final String imagePath;
  final String title;
  final Color color;
  final String colorName;
  final int size;
  final int price;
  final void Function() onDeleteTap;
  final int quantity;
  final void Function(int value) onIncrementTap;
  final void Function(int value) onDecrementTap;
  @override
  Widget build(BuildContext context) {
    // bool isPortrait =
    //     MediaQuery.of(context).orientation == Orientation.portrait;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.productDetails),
      child: Container(
        width: 398.w,
        height: 140.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
        ),
        child: Row(children: [
          // display image in the container
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 140.h,
              width: 120.w,
            ),
          ),
          // SizedBox(width: 8.w),
          // display details product=========================
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p8.w,
                vertical: AppPadding.p8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // title and delete button ==
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                            color: ColorManager.textColor,
                            fontSize: AppSize.s18.sp,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: onDeleteTap,
                        child: Image.asset(
                          IconsAssets.icDelete,
                          color: ColorManager.textColor,
                          height: 22.h,
                        ),
                      )
                    ],
                  ),

                  // SizedBox(height: 7.h),
                  const Spacer(),
                  // display color and size===================
                  ColorAndSizeCartItem(
                    color: color,
                    colorName: colorName,
                    size: size,
                  ),
                  const Spacer(),
                  // display price and quantity =================
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'EGP $price',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                              color: ColorManager.textColor,
                              fontSize: AppSize.s18.sp),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.w,
                            vertical: 7.h),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  size: 20.w,
                                  color: ColorManager.white,
                                )),
                            SizedBox(
                              width: 18.w,
                            ),
                            Text(
                              '1',
                              style: getMediumStyle(color: ColorManager.white)
                                  .copyWith(fontSize: 18.sp),
                            ),
                            SizedBox(
                              width: 18.w,
                            ),
                            InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.add_circle_outline,
                                  color: ColorManager.white,
                                  size: 20.w,
                                )),
                          ],
                        ),
                      )
                      // ProductCounter(
                      //   add: onIncrementTap,
                      //   productCounter: quantity,
                      //   remove: onDecrementTap,
                      // )
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
