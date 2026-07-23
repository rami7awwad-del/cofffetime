import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const QtyButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: 28.44.w,
        height: 28.44.h,
        decoration: BoxDecoration(
          color: goldAccentColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(
          icon,
          color: bak,
          size: 16.sp,
        ),
      ),
    );
  }
}