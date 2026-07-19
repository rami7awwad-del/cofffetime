// lib/core/themes/app_colors.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'text_style.dart';


/// ==================== Fonts ====================
// يمكنك تغييره إلى Poppins أو Inter

/// ==================== Colors (Figma Coffee Palette) ====================

// الألوان الأساسية
const Color appPrimaryColor = Color(0xFF064741);     // الأخضر الداكن الأساسي
const Color darkGreenColor = Color(0xFF0D3C38);
const Color darkGreenColor2 = Color(0xFF0A6B62);        // درجة زيتية داكنة ثانوية

// ألوان القهوة والذهب
const Color goldAccentColor = Color(0xFFBFA05F);     // الذهبي/البني الفاتح المعتمد للأزرار والميزات
const Color lightBrownColor = Color(0xFFAD8063);     // درجة بني قهوة دافئة للأيقونات أو النصوص

// ألوان الخلفية
const Color appBackgroundColor = Color(0xFFF9EBD0);  // البيج الفاتح (خلفية الشاشات الترحيبية)
const Color darkBeigeColor = Color(0xFFE1CEA8);  
const Color opencart = Color(0xff60735F); 
const Color bak = Color(0xff072523);
const Color icon = Color(0xff596E6C);//  background: #596E6C;

 // بيج غامق قليلاً (لحقول الإدخال أو التباين)

// الألوان الثانوية
const Color oliveGreyColor = Color(0xFF869485);      // الرمادي المائل للزيتي للحدود والنصوص الثانوية

// الألوان العامة
const Color appWhiteColor = Color(0xFFFFFFFF);
const Color appBlackColor = Color(0xFF1E1E1E);

// ألوان الحالات والرسائل
const Color errorColor = Color(0xFFE74C3C);
const Color successColor = Color(0xFF2ECC71);
const Color warningColor = Color(0xFFF1C40F);

// ألوان إضافية للنصوص
const Color textPrimary = Color(0xFF1E1E1E);
const Color textSecondary = Color(0xFF869485);
const Color textHint = Color(0xFFADADAD);

/// ==================== BoxShadow ====================
List<BoxShadow>? boxShadow = [
  BoxShadow(
    color: appBlackColor.withOpacity(0.06),
    blurRadius: 12,
    spreadRadius: 1,
    offset: const Offset(0, 4),
  ),
];

/// ==================== Gradient ====================
// تدرج لوني فخم يدمج بين الدرجتين الزيتيتين المستخرجتين لخلفيات البطاقات
const LinearGradient advancedCoffeeGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF064741),
    Color(0xFF0A6B62),
  ],
);
const LinearGradient advancedCoffeeGradient2 = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF262B33),
    Color(0xFF0D3C38),
  ],
);

const LinearGradient advancedCoffeeGradient3 = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF064741),
    Color(0xFF0D3C38),
  ],
);


const LinearGradient advancedCoffeeGradient5 = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFF262B33),
    Color(0xFF0C0F14),
  ],
);

//background: linear-gradient(107.76deg, #262B33 2.32%, #0C0F14 100%);

const LinearGradient advancedCoffeeGradient4 = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: [
    Color(0xFF064741),
    Color(0xff60735F),
  ],
);
/// ==================== Extended Colors ====================background: linear-gradient(158.84deg, #262B33 4%, rgba(38, 43, 51, 0) 91.93%);

class AppColors {
  // الألوان الأساسية
  static const Color primary = appPrimaryColor;
  static const Color primaryDark = darkGreenColor;
  static const Color primaryLight = Color(0xFF0A6B62);
  
  // ألوان القهوة والذهب
  static const Color gold = goldAccentColor;
  static const Color brown = lightBrownColor;
  
  // ألوان الخلفية
  static const Color background = appBackgroundColor;
  static const Color backgroundDark = darkBeigeColor;
  
  // الألوان الثانوية
  static const Color grey = oliveGreyColor;
  
  // الألوان العامة
  static const Color white = appWhiteColor;
  static const Color black = appBlackColor;
  
  // ألوان الحالات
  static const Color error = errorColor;
  static const Color success = successColor;
  static const Color warning = warningColor;
  
  
}