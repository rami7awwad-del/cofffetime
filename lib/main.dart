import 'package:coffee_project/Admain/loginAdmain_page.dart';
import 'package:coffee_project/features/auth/login_page.dart';
import 'package:coffee_project/features/auth/londingPage.dart';
import 'package:coffee_project/features/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/resources/app_colors.dart';
import 'core/resources/text_style.dart';

//import 'features/home/pages/home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainLayout(),
        );
      },
    );
  }
}
