// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get chooseLanguage => 'اختر اللغة';

  @override
  String get session => 'الجلسة';

  @override
  String total(Object amount) {
    return 'إجمالي المبلغ هو $amount دولار';
  }

  @override
  String get home => 'الرئيسية';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get setting => 'الإعدادات';

  @override
  String get landingText1 => 'القهوة أولاً ثم نتحدث !';

  @override
  String get landingPrefix2 => 'اشرب ';

  @override
  String get landingHighlight2 => 'رشفة واحدة';

  @override
  String get landingSuffix2 => ' واستمتع';

  @override
  String get landingPrefix3 => 'حتى ';

  @override
  String get landingHighlight3 => 'القهوة';

  @override
  String get landingSuffix3 => ' ستجعل الابتسامة تشرق :)';

  @override
  String get next => 'التالي';

  @override
  String get getStarted => 'ابدأ الآن';
}
