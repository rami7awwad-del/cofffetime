import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/core/resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponCard extends StatelessWidget {
  final String title;
  final String? badgeText;
  final IconData iconData;
  final VoidCallback? onMoreInfoTap;

  const CouponCard({
    Key? key,
    required this.title,
    this.badgeText,
    required this.iconData,
    this.onMoreInfoTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
               gradient: advancedCoffeeGradient3,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: AppColors.grey.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyles.interSize15
                          .withColor(AppColors.white)
                          .withWeight(FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 16.h),
                    GestureDetector(
                      onTap: onMoreInfoTap,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundDark,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          'more info >>',
                          style: TextStyles.interSize10
                              .withColor(bak)
                              .withWeight(FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              Icon(
                iconData,
                size: 55.sp,
                color: AppColors.backgroundDark.withOpacity(0.8),
              ),
              SizedBox(width: 8.w),
            ],
          ),
        ),
        if (badgeText != null)
          Positioned(
            top: 0,
            right: 15.w,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 4.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
              ),
              child: Text(
                badgeText!,
                style: TextStyles.interSize10
                    .withColor(const Color(0xff072523))
                    .withWeight(FontWeight.bold),
              ),
            ),
          ),
      ],
    );
  }
}