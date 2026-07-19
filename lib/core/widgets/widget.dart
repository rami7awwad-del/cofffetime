import 'package:coffee_project/core/resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee_project/core/resources/app_colors.dart';

class CustomFieldLabel extends StatelessWidget {
  final String label;

  const CustomFieldLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Text(
        label,
        // اعتماد الستايل والألوان المحددة في ملفاتك بدقة
        style: TextStyles.interSize15.withColor(textSecondary),
      ),
    );
  }
}



class CustomInputDecoration {
  static InputDecoration coffeeInput({String? hintText, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyles.interSize15.withColor(textHint),
      suffixIcon: suffixIcon,
      contentPadding: EdgeInsets.symmetric(vertical: 8.h),
      isDense: true,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.white.withOpacity(0.3), width: 1.h),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.gold, width: 1.5),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.white.withOpacity(0.3)),
      ),
    );
  }
}