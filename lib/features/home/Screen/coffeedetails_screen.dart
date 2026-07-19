import 'package:coffee_project/core/Classes/Cappuccino.dart';
import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/core/resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeDetailsScreen extends StatefulWidget {
  final Cappuccino cappuccino;

  const CoffeeDetailsScreen({super.key, required this.cappuccino});

  @override
  State<CoffeeDetailsScreen> createState() => _CoffeeDetailsScreenState();
}

class _CoffeeDetailsScreenState extends State<CoffeeDetailsScreen> {
  late String _selectedSize;

  @override
  void initState() {
    super.initState();
   
    _selectedSize = widget.cappuccino.defaultSize;
  }

  @override
  Widget build(BuildContext context) {
    
    final double currentPrice = widget.cappuccino.sizesAndPrices[_selectedSize] ?? widget.cappuccino.defaultPrice;

    return Scaffold(
      backgroundColor: const Color(0xff072523),
      body: Column(
        children: [
       
          Expanded(
            flex: 5,
            child: Stack(
              children: [
        
                Positioned.fill(
                  child: Image.asset(
                    widget.cappuccino.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
           
                Positioned(
                  top: 50.h,
                  left: 20.w,
                  right: 20.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildHeaderButton(Icons.arrow_back_ios_new, () => Navigator.pop(context)),
                      _buildHeaderButton(Icons.favorite, () {}, iconColor: AppColors.error),
                    ],
                  ),
                ),
            
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28.r),
                        topRight: Radius.circular(28.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
            
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.cappuccino.name,
                              style: TextStyles.poppinsSize22.withColor(AppColors.white).withWeight(FontWeight.w700),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              "ً With Steamed Milk ", // مثل: With Steamed Milk
                              style: TextStyles.interSize15.withColor(AppColors.grey),
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                Icon(Icons.star, color: AppColors.gold, size: 20.sp),
                                SizedBox(width: 4.w),
                                Text(
                                  widget.cappuccino.rating.toString(),
                                  style: TextStyles.interSize15.withColor(AppColors.white).withWeight(FontWeight.bold),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "(6,879)",
                                  style: TextStyles.interSize10.withColor(AppColors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                _buildBadgeIcon(Icons.coffee_rounded, "Coffee"),
                                SizedBox(width: 12.w),
                                _buildBadgeIcon(Icons.water_drop_rounded, "Milk"),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                color: const Color(0xff072523),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Text(
                                widget.cappuccino.origin, // مثل: Medium Roasted
                                style: TextStyles.interSize10.withColor(AppColors.grey),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

         
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyles.interSize15.withColor(AppColors.white).withWeight(FontWeight.w600),
                  ),
                  SizedBox(height: 8.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        widget.cappuccino.description,
                        style: TextStyles.interSize15.withColor(AppColors.white.withOpacity(0.85)).withHeight(1.5),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Size",
                    style: TextStyles.interSize15.withColor(AppColors.grey).withWeight(FontWeight.w600),
                  ),
                  SizedBox(height: 10.h),
                  
          
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: widget.cappuccino.sizesAndPrices.keys.map((size) {
                      final isSelected = _selectedSize == size;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedSize = size;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 6.w),
                            height: 40.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.transparent : const Color(0xFF1F3835),
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: isSelected ? AppColors.gold : Colors.transparent,
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              size,
                              style: TextStyles.interSize15.withColor(
                                isSelected ? AppColors.gold : AppColors.white,
                              ).withWeight(isSelected ? FontWeight.bold : FontWeight.normal),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  
                  SizedBox(height: 24.h),

          
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price",
                            style: TextStyles.interSize10.withColor(AppColors.grey),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Text(
                                r"$ ",
                                style: TextStyles.interSize24.withColor(AppColors.gold).withWeight(FontWeight.bold),
                              ),
                              Text(
                                currentPrice.toStringAsFixed(2),
                                style: TextStyles.interSize24.withColor(AppColors.white).withWeight(FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 40.w),
                      Expanded(
                        child: SizedBox(
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: () {
                              debugPrint("Added ${widget.cappuccino.name} ($_selectedSize) to cart!");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: goldAccentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              "Add to Cart",
                              style: TextStyles.interSize18.withColor(const Color(0xff072523)).withWeight(FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderButton(IconData icon, VoidCallback onTap, {Color iconColor = AppColors.grey}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(icon, color: iconColor, size: 18.sp),
      ),
    );
  }

  Widget _buildBadgeIcon(IconData icon, String label) {
    return Container(
      width: 55.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: const Color(0xff072523),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.gold, size: 20.sp),
          SizedBox(height: 2.h),
          Text(
            label,
            style: TextStyles.interSize10.withColor(AppColors.grey),
          ),
        ],
      ),
    );
  }
}