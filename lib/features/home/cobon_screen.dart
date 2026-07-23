import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/core/resources/text_style.dart';
import 'package:coffee_project/core/widgets/coupon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CobonsScreen extends StatelessWidget {
  const CobonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      //backgroundColor: darkGreenColor, 
      body: Container(
        decoration: BoxDecoration( gradient: advancedCoffeeGradient2,),
        child: SafeArea(
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
        
                
                CouponCard(
                  title: '70% discount for any instant coffee package',
                  badgeText: '70%',
                  iconData: Icons.coffee_rounded,
                ),
                CouponCard(
                  title: 'new special Americano ~',
                  badgeText: null, // بدون شارة مئوية علوية
                  iconData: Icons.local_cafe_rounded,
                ),
                CouponCard(
                  title: '30% discount for any coffee package',
                  badgeText: '30%',
                  iconData: Icons.gif_box,
                ),
              ],
            ),
          ),
        ),
      ),
     
    );
  }
}
