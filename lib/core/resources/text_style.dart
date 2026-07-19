import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



const String mainFontFamily = "Poppins";
const String secondaryFontFamily = "Inter";

class TextStyles {
  // ==================== خط Inter - 5 أحجام ====================

  // حجم 1: كبير جداً (Display) - 32px
  static TextStyle interSize32 = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    fontSize: 32.sp,
    height: 1.2,
    letterSpacing: -0.5,
  );

  // حجم 2: كبير (Heading) - 28px
  static TextStyle interSize28 = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 28.sp,
    height: 1.3,
    letterSpacing: 0,
  );

  // حجم 3: متوسط (Body) - 24px
  static TextStyle interSize24 = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 24.sp,
    height: 20 / 24,
    letterSpacing: 0,
  );

  // حجم 4: صغير (Caption) - 18px
  static TextStyle interSize18 = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
    height: 20 / 18,
    letterSpacing: 0.05,
  );

  // حجم 5: صغير جداً (Small) - 15px
  static TextStyle interSize15 = TextStyle(
    fontFamily: 'Inter',
    //fontWeight: FontWeight.w500,
    fontSize: 15.sp,
    height: 20 / 15,
    letterSpacing: 0.05,
  );

  // ==================== خط Poppins - 5 أحجام ====================

  // حجم 1: كبير جداً (Display) - 32px
  static TextStyle poppinsSize32 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 32.sp,
    height: 1.2,
    letterSpacing: -0.5,
  );

  // حجم 2: كبير (Heading) - 28px
  static TextStyle poppinsSize28 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 28.sp,
    height: 1.3,
    letterSpacing: 0,
  );

  // حجم 3: متوسط (Body) - 22px
  static TextStyle poppinsSize22 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 22.sp,
    height: 30 / 22,
    letterSpacing: 0,
  );

  // حجم 4: صغير (Caption) - 18px
  static TextStyle poppinsSize18 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 18.sp,
    height: 1.5,
    letterSpacing: 0,
  );

  // حجم 5: صغير جداً (Small) - 15px
  static TextStyle poppinsSize15 = TextStyle(
    fontFamily: 'Poppins',
    fontStyle:FontStyle.normal ,
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
    height: 24 / 15,
    letterSpacing: 0, // 2px letter-spacing
  );

  // ==================== خط Plus Jakarta Sans ====================

  // حجم 15px
  static TextStyle jakartaSize15 = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w500,
    fontSize: 15.sp,
    height: 24 / 15,
    letterSpacing: 2 / 15, // 2px letter-spacing
  );

  // ==================== ستايلات خاصة (للنصوص الصغيرة جداً) ====================

  // حجم 10px
  static TextStyle interSize10 = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
   // height: 20 / 10,
    letterSpacing: 0,
  );
}

// ==================== Extension لتسهيل التخصيص ====================

extension TextStyleHelper on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withSize(double size) => copyWith(fontSize: size.sp);
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);
  TextStyle withLetterSpacing(double spacing) => copyWith(letterSpacing: spacing);
  TextStyle withHeight(double height) => copyWith(height: height);
  TextStyle withDecoration(TextDecoration decoration) => copyWith(decoration: decoration);
  TextStyle withBackground(Color color) => copyWith(backgroundColor: color);
  TextStyle withShadows(List<Shadow> shadows) => copyWith(shadows: shadows);
}