import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginHeaderAvatar extends StatelessWidget {
  const LoginHeaderAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50.h,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          width: 100.r,
          height: 100.r,
          decoration: const BoxDecoration(
            color: darkBeigeColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            "assets/images/Group 1171274900.png",
            height: 100.h,
            width: 100.w,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Center(
              child: Icon(
                Icons.coffee,
                size: 60.sp,
                color: appPrimaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}