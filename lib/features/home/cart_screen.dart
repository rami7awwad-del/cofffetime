import 'package:coffee_project/core/Classes/CartItem.dart';
import 'package:coffee_project/core/routing/app_routes.dart';
import 'package:coffee_project/core/widgets/qty_button.dart';
import 'package:coffee_project/features/auth/profile_screen.dart';
import 'package:coffee_project/features/home/Screen/orderhistory_screen.dart';
import 'package:coffee_project/features/home/Screen/paymentscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/core/resources/text_style.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> cartList = [
    CartItem(
      id: '1',
      name: 'Cappuccino',
      description: 'With Steamed Milk',
      origin: 'Medium Roasted',
      imageUrl: 'assets/images/6.png',
      sizesAndPrices: {'S': 4.20, 'M': 4.20, 'L': 4.20},
      selectedSizesQty: {'S': 1, 'M': 1, 'L': 1},
    ),
    CartItem(
      id: '2',
      name: 'Cappuccino',
      description: 'With Steamed Milk',
      origin: 'Medium Roasted',
      imageUrl: 'assets/images/7.png',
      sizesAndPrices: {'M': 6.20},
      selectedSizesQty: {'M': 1},
    ),
    CartItem(
      id: '3',
      name: 'Liberica Coffee Beans',
      description: 'With Steamed Milk',
      origin: 'Medium Roasted',
      imageUrl: 'assets/images/1.png',
      sizesAndPrices: {'250gm': 4.20, '500gm': 4.20, '1kg': 4.20},
      selectedSizesQty: {'250gm': 1, '500gm': 1, '1kg': 1},
    ),
  ];

  double get overallTotal {
    double total = 0.0;
    for (var item in cartList) {
      total += item.totalPrice;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkGreenColor,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.order);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: opencart,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons.grid_view_rounded,
                        color: textHint,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  Text(
                    "Cart",
                    style: TextStyles.interSize24.withColor(appWhiteColor),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.profile);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        'assets/images/16.png',
                        width: 30.w,
                        height: 30.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                itemCount: cartList.length,
                itemBuilder: (context, index) {
                  final item = cartList[index];
                  final isMultiSize = item.selectedSizesQty.length > 1;

                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      gradient: advancedCoffeeGradient2,
                      borderRadius: BorderRadius.circular(23.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.r),
                              child: Image.asset(
                                item.imageUrl,
                                width: 126.w,
                                height: 126.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyles.interSize15.withColor(
                                      appWhiteColor,
                                    ),
                                  ),
                                  Text(
                                    item.description,
                                    style: TextStyles.interSize15.withColor(
                                      textHint,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),

                                  if (!isMultiSize) ...[
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 14.w,
                                            vertical: 6.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: bak,
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                          ),
                                          child: Text(
                                            item.selectedSizesQty.keys.first,
                                            style: TextStyles.interSize15
                                                .withColor(appWhiteColor),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          r'$ ',
                                          style: TextStyles.poppinsSize18
                                              .withColor(goldAccentColor),
                                        ),
                                        Text(
                                          item.sizesAndPrices.values.first
                                              .toStringAsFixed(2),
                                          style: TextStyles.poppinsSize18
                                              .withColor(appWhiteColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),

                                    Row(
                                      children: [
                                        QtyButton(icon:Icons.remove, onTap: () {
                                          setState(() {
                                            final key = item
                                                .selectedSizesQty
                                                .keys
                                                .first;
                                            if (item.selectedSizesQty[key]! >
                                                1) {
                                              item.selectedSizesQty[key] =
                                                  item.selectedSizesQty[key]! -
                                                  1;
                                            }
                                          });
                                        }),
                                        Container(
                                          width: 50.w,
                                          height: 30.h,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 10.w,
                                          ),
                                          decoration: BoxDecoration(
                                            color: bak,
                                            borderRadius: BorderRadius.circular(
                                              7.r,
                                            ),
                                            //border: Border.solid(width: 1, color: goldAccentColor)
                                          ),
                                          child: Text(
                                            item.selectedSizesQty.values.first
                                                .toString(),
                                            style: TextStyles.interSize15
                                                .withColor(appWhiteColor),
                                          ),
                                        ),
                                        QtyButton(icon:Icons.add, onTap: () {
                                          setState(() {
                                            final key = item
                                                .selectedSizesQty
                                                .keys
                                                .first;
                                            item.selectedSizesQty[key] =
                                                item.selectedSizesQty[key]! + 1;
                                          });
                                        }),
                                      ],
                                    ),
                                  ] else ...[
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 6.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: bak,
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                      ),
                                      child: Text(
                                        item.origin,
                                        style: TextStyles.interSize15.withColor(
                                          textHint,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),

                        if (isMultiSize) ...[
                          SizedBox(height: 15.h),
                          ...item.selectedSizesQty.keys.map((size) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 6.h),
                              child: Row(
                                children: [
                                  Container(
                                    width: 50.w,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 6.h,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: bak,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Text(
                                      size,
                                      style: TextStyles.interSize15.withColor(
                                        appWhiteColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15.w),
                                  // السعر
                                  Text(
                                    r'$ ',
                                    style: TextStyles.poppinsSize18.withColor(
                                      goldAccentColor,
                                    ),
                                  ),
                                  Text(
                                    (item.sizesAndPrices[size] ?? 0.0)
                                        .toStringAsFixed(2),
                                    style: TextStyles.poppinsSize18.withColor(
                                      appWhiteColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  // زر الناقص
                                  QtyButton( icon:Icons.remove,onTap: () {
                                    setState(() {
                                      if (item.selectedSizesQty[size]! > 0) {
                                        item.selectedSizesQty[size] =
                                            item.selectedSizesQty[size]! - 1;
                                      }
                                    });
                                  }),
                                  // رقم الكمية
                                  Container(
                                    width: 50.w,
                                    height: 30.h,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: bak,
                                      borderRadius: BorderRadius.circular(7.r),
                                      border: Border.all(
                                        color: goldAccentColor,
                                      ),
                                    ),
                                    child: Text(
                                      item.selectedSizesQty[size].toString(),
                                      style: TextStyles.interSize15.withColor(
                                        appWhiteColor,
                                      ),
                                    ),
                                  ),
                                  // زر الزائد
                                  QtyButton(
                                    icon: Icons.add,
                                    onTap: () {
                                      setState(() {
                                        item.selectedSizesQty[size] =
                                            (item.selectedSizesQty[size] ?? 0) +
                                            1;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
              decoration: BoxDecoration(color: appPrimaryColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // السعر الكلي
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyles.interSize15.withColor(textHint),
                      ),
                      Row(
                        children: [
                          Text(
                            r'$ ',
                            style: TextStyles.poppinsSize15.withColor(
                              goldAccentColor,
                            ),
                          ),
                          Text(
                            overallTotal.toStringAsFixed(2),
                            style: TextStyles.poppinsSize15.withColor(
                              appWhiteColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PaymentScreen(totalPrice: overallTotal),
                        ),
                      );
                    },
                    child: Container(
                      width: 200.w,
                      height: 55.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: goldAccentColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        "Pay",
                        style: TextStyles.poppinsSize18.withColor(
                          appPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }  
}
