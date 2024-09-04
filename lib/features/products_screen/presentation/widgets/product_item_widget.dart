import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widget/heart_button.dart';

class ProductItemWidget extends StatelessWidget {
  //todo: product
  final String image;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;

  const ProductItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
  });

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return "${words.sublist(0, 2).join(' ')}..";
    }
  }

  String truncateDescription(String description) {
    List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 4) {
      return description;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.productDetails),
      child: Container(
        width: 191.w,
        height: 237.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.primary.withOpacity(0.3),
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  // CachedNetworkImage(
                  //   imageUrl: image,
                  //   height: height * 0.15,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  //   placeholder: (context, url) =>
                  //       const Center(child: CircularProgressIndicator()),
                  //   errorWidget: (context, url, error) => const Icon(Icons.error),
                  // ),
                  // Image.network(
                  //   image,
                  //   fit: BoxFit.cover,
                  // ),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(14.r)),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                      top: 8.h, right: 8.w, child: HeartButton(onTap: () {})),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      truncateTitle(title),
                      style: getMediumStyle(
                        color: ColorManager.textColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      truncateDescription(description),
                      style: getRegularStyle(
                        color: ColorManager.textColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "EGP $price",
                      style: getRegularStyle(
                        color: ColorManager.textColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    // SizedBox(height: height * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // width: width * 0.22,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Review ($rating)",
                                style: getRegularStyle(
                                  color: ColorManager.textColor,
                                  fontSize: 12.sp,
                                ),
                              ),
                              const Icon(
                                Icons.star_rate_rounded,
                                color: ColorManager.starRateColor,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorManager.primary,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
