import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/core/resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdmainPage extends StatefulWidget {
  const AdmainPage({super.key});

  @override
  State<AdmainPage> createState() => _AdmainPageState();
}

class _AdmainPageState extends State<AdmainPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // 🔹 دالة إظهار النافذة المنبثقة (Dialog)
  void _showAddPointsDialog(BuildContext context, String userName, String currentBeans) {
    final TextEditingController pointsController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          backgroundColor: AppColors.background, // أو لون الخلفية الفاتح لديك
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1️⃣ صورة واسم المستخدم
                Row(
                   textDirection: TextDirection.ltr,
                  children: [
                    CircleAvatar(
                      radius: 22.r,
                      backgroundImage: const AssetImage("assets/images/16.png"),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      userName,
                      style: TextStyles.poppinsSize18
                          .withColor(AppColors.brown) // أو لون النص الداكن
                          .withWeight(FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                const Divider(thickness: 1),
                SizedBox(height: 16.h),

                // 2️⃣ إجمالي النقاط الحالي (Total Beans)
                Row(
                   textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Beans',
                      style: TextStyles.poppinsSize18
                          .withColor(goldAccentColor)
                          .withWeight(FontWeight.w600),
                    ),
                    Row(
                       textDirection: TextDirection.ltr,
                      children: [
                        Text(
                          currentBeans,
                          style: TextStyles.poppinsSize18
                              .withColor(AppColors.gold)
                              .withWeight(FontWeight.bold),
                        ),
                        SizedBox(width: 6.w),
                        Icon(
                          Icons.coffee,
                          color: AppColors.gold,
                          size: 20.sp,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                // 3️⃣ حقل إدخال النقاط المضافة (Added points)
                Row(
                   textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'added points',
                      style: TextStyles.poppinsSize18
                          .withColor(appBlackColor)
                          .withWeight(FontWeight.w500),
                    ),
                    SizedBox(
                      width: 100.w,
                      child: TextField(
                        controller: pointsController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyles.poppinsSize18
                            .withWeight(FontWeight.bold),
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 4),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),

                // 4️⃣ زر التأكيد (Submit)
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // الأكشن الخاص بتأكيد إضافة النقاط
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'submit',
                      style: TextStyles.poppinsSize18
                          .withColor(AppColors.white)
                          .withWeight(FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              
              SizedBox(height: 20.h),

              // ================= Header =================
              Row(
                textDirection: TextDirection.ltr,
                spacing: 120.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '! HELLO ZIAD ',
                    style: TextStyles.poppinsSize18
                        .withWeight(FontWeight.bold)
                        .withColor(AppColors.brown),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: AppColors.brown,
                        size: 24.sp,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        '250',
                        style: TextStyles.poppinsSize18
                            .withWeight(FontWeight.bold)
                            .withColor(AppColors.brown),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              // ================= Search Bar =================
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.backgroundDark,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColors.primary,
                      size: 24.sp,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'search',
                          hintStyle: TextStyles.interSize15.withColor(textHint),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.tune,
                      color: AppColors.primary,
                      size: 22.sp,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              // ================= User Cards List =================
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      // 👈 غلفنا العناصر بـ GestureDetector لتطبيق الضغط
                      child: GestureDetector(
                        onTap: () {
                          _showAddPointsDialog(
                            context,
                            'Mustafa Hussein',
                            '256',
                          );
                        },
                        child: Container(
                          height: 150.h,
                          decoration: BoxDecoration(
                            color: opencart,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                textDirection: TextDirection.ltr,
                                children: [
                                  CircleAvatar(
                                    radius: 22.r,
                                    backgroundImage: const AssetImage(
                                        "assets/images/16.png"),
                                  ),
                                  SizedBox(width: 14.w),
                                  Text(
                                    'Mustafa Hussein',
                                    style: TextStyles.poppinsSize18
                                        .withColor(appBackgroundColor)
                                        .withWeight(FontWeight.w500),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Row(
                                  textDirection: TextDirection.ltr,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'My Total Beans',
                                      style: TextStyles.poppinsSize18.withColor(
                                          AppColors.white.withOpacity(0.9)),
                                    ),
                                    Row(
                                      textDirection: TextDirection.ltr,
                                      children: [
                                        Text(
                                          '256',
                                          style: TextStyles.poppinsSize18
                                              .withColor(AppColors.gold)
                                              .withWeight(FontWeight.bold),
                                        ),
                                        SizedBox(width: 6.w),
                                        Icon(
                                          Icons.coffee,
                                          color: AppColors.gold,
                                          size: 20.sp,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // ================= Bottom Button =================
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 55.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // الأكشن الخاص بمسح الكود
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      textDirection: TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code_scanner,
                          color: AppColors.white,
                          size: 22.sp,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Scan user QR',
                          style: TextStyles.poppinsSize18
                              .withColor(AppColors.white)
                              .withWeight(FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}