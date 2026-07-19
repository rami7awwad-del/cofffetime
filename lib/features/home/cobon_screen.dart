import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/core/resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CobonsScreen extends StatelessWidget {
  const CobonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: darkGreenColor, 
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
             
              Text(
                'Best Coffee For You',
                style: TextStyles.poppinsSize22.withColor(AppColors.white).withWeight(FontWeight.w700),
              ),
              SizedBox(height: 24.h),

            
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  gradient: advancedCoffeeGradient4, 
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(color: AppColors.grey.withOpacity(0.3), width: 1),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                     
                        Container(
                          width: 45.w,
                          height: 45.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(color: AppColors.grey, width: 1.5),
                          ),
                          child: const Icon(Icons.person_outline, color: AppColors.white),
                        ),
                        SizedBox(width: 12.w),
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mustafa Hussein',
                              style: TextStyles.interSize15.withColor(AppColors.white).withWeight(FontWeight.w600),
                            ),
                            Text(
                              '+9564454522',
                              style: TextStyles.interSize10.withColor(AppColors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Total Beans',
                          style: TextStyles.interSize15.withColor(AppColors.white).withWeight(FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Text(
                              '256 ',
                              style: TextStyles.interSize24.withColor(AppColors.gold).withWeight(FontWeight.w700),
                            ),
                            Icon(Icons.energy_savings_leaf, color: AppColors.gold, size: 20.sp), // أيقونة بديلة لحبات البن
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                 
                    const Divider(color: Color(0xFFBFA05F), thickness: 0.5),
                    SizedBox(height: 4.h),
                    Center(
                      child: Text(
                        'Collect more beans to unlock coupons',
                        style: TextStyles.interSize10.withColor(AppColors.gold),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    
                    SizedBox(
                      width: double.infinity,
                      height: 44.h,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.backgroundDark, 
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                          elevation: 0,
                        ),
                        icon: Icon(Icons.qr_code_scanner, color: const Color(0xff072523), size: 18.sp),
                        label: Text(
                          'Scan me',
                          style: TextStyles.interSize15.withColor(const Color(0xff072523)).withWeight(FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32.h),
              
              // ==================== عنوان قسم الكوبونات ====================
              Row(
                children: [
                  Icon(Icons.local_offer, color: AppColors.white, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    'Cubons',
                    style: TextStyles.poppinsSize22.withColor(AppColors.white).withWeight(FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // ==================== قائمة الكوبونات المتاحة ====================
              _buildCouponCard(
                title: '70% discount for any instant coffee package',
                badgeText: '70%',
                iconData: Icons.coffee_rounded,
              ),
              _buildCouponCard(
                title: 'new special Americano ~',
                badgeText: null, // بدون شارة مئوية علوية
                iconData: Icons.local_cafe_rounded,
              ),
              _buildCouponCard(
                title: '30% discount for any coffee package',
                badgeText: '30%',
                iconData: Icons.gif_box,
              ),
            ],
          ),
        ),
      ),
     
    );
  }

  // ويدجت مخصصة لبناء كروت الكوبونات بدقة عالية
  Widget _buildCouponCard({required String title, String? badgeText, required IconData iconData}) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color:darkGreenColor,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColors.grey.withOpacity(0.3), width: 1),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyles.interSize15.withColor(AppColors.white).withWeight(FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 16.h),
                    
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundDark,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        'more info >>',
                        style: TextStyles.interSize10.withColor(bak).withWeight(FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              
              Icon(iconData, size: 55.sp, color: AppColors.backgroundDark.withOpacity(0.8)),
              SizedBox(width: 8.w),
            ],
          ),
        ),
      
        if (badgeText != null)
          Positioned(
            top: 0,
            right: 15.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r),
                ),
              ),
              child: Text(
                badgeText,
                style: TextStyles.interSize10.withColor(const Color(0xff072523)).withWeight(FontWeight.bold),
              ),
            ),
          ),
      ],
    );
  }
}

 