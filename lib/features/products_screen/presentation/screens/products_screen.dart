import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../widgets/product_item_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 7 / 9,
          ),
          itemBuilder: (context, index) {
            return ProductItemWidget(
              image: ImageAssets.categoryHomeImage,
              title: "Nike Air Jordon",
              price: 1100,
              rating: 4.7,
              discountPercentage: 10,
              description:
                  "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
            );
          },
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}
