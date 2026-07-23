import 'package:coffee_project/core/resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SizedBox(
        width: double.infinity,
        height: 55.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            elevation: 0,
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: 2.w)
                : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyles.interSize18.withColor(textColor),
          ),
        ),
      ),
    );
  }
}