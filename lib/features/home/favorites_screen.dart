import 'package:coffee_project/core/Classes/Cappuccino.dart';
import 'package:coffee_project/features/home/Screen/orderhistory_screen.dart';
import 'package:coffee_project/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/core/resources/text_style.dart';


class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appPrimaryColor, 
        body: Column(
          children: [
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const OrderHistoryScreen(), 
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: opencart,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons
                            .grid_view_rounded, // يمكنك تغيير الأيقونة إلى Icons.shopping_bag_outlined إذا كنت تفضل شكل الحقيبة/الطلبات
                        color: textHint,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  Text(
                    "Favorites",
                    style: TextStyles.interSize24.withColor(appWhiteColor),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      'assets/images/16.png', 
                      width: 35.w,
                      height: 35.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            // 2. قائمة العناصر المفضلة
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                itemCount: cappuccinoList.length,
                itemBuilder: (context, index) {
                 final cappuccino = cappuccinoList[index];

                  return Container(
                    margin: EdgeInsets.only(bottom: 20.h),
                    decoration: BoxDecoration(
                      color: darkGreenColor, 
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // الجزء العلوي: الصورة والطبقة الشفافة فوقها
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
                              child: Image.asset(
                                cappuccino.imageUrl, // من الكلاس الخاص بك
                                width: double.infinity,
                                height: 350.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // زر القلب الأحمر
                            Positioned(
                              top: 20.h,
                              right: 20.w,
                              child: Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0C0F14).withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                            
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(20.r),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5), 
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cappuccino.name, // من الكلاس الخاص بك
                                          style: TextStyles.poppinsSize18.withColor(appWhiteColor).copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22.sp,
                                          ),
                                        ),
                                        //Text( cappuccino.description, style: TextStyles.interSize10.withColor(textHint),),
                                        SizedBox(height: 15.h),
                                        Row(
                                          children: [
                                            Icon(Icons.star, color: goldAccentColor, size: 20.sp),
                                            SizedBox(width: 5.w),
                                            Text(
                                              cappuccino.rating.toString(), // من الكلاس الخاص بك
                                              style: TextStyles.poppinsSize15.withColor(appWhiteColor).copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            Text(
                                              "(6,879)", 
                                              style: TextStyles.interSize15.withColor(textHint).copyWith(fontSize: 12.sp),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            _buildBadgeIcon(Icons.coffee, "Coffee"),
                                            SizedBox(width: 10.w),
                                            _buildBadgeIcon(Icons.water_drop, "Milk"),
                                          ],
                                        ),
                                        SizedBox(height: 15.h),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF141921),
                                            borderRadius: BorderRadius.circular(10.r),
                                          ),
                                          child: Text(
                                            cappuccino.origin, // من الكلاس الخاص بك
                                            style: TextStyles.interSize15.withColor(textHint).copyWith(fontSize: 12.sp),
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
                        
                        Padding(
                          padding: EdgeInsets.all(20.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Description",
                                style: TextStyles.interSize15.withColor(textHint).copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                cappuccino.description,
                                style: TextStyles.interSize15.withColor(appWhiteColor).copyWith(
                                  fontSize: 13.sp,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgeIcon(IconData icon, String label) {
    return Container(
      width: 55.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: const Color(0xFF141921),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: goldAccentColor, size: 20.sp),
          SizedBox(height: 2.h),
          Text(
            label,
            style: TextStyles.interSize15.withColor(textHint).copyWith(fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}