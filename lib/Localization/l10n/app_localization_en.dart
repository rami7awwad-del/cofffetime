// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get chooseLanguage => 'Choose Language';

  @override
  String get session => 'Session';

  @override
  String total(Object amount) {
    return 'Your Total is $amount Dollars';
  }

  @override
  String get home => 'Home';

  @override
  String get profile => 'Profile';

  @override
  String get setting => 'Setting';

  @override
  String get landingText1 => 'coffee first then talk !';

  @override
  String get landingPrefix2 => 'just one ';

  @override
  String get landingHighlight2 => 'sip';

  @override
  String get landingSuffix2 => ' and feel good';

  @override
  String get landingPrefix3 => 'so ';

  @override
  String get landingHighlight3 => 'chafe';

  @override
  String get landingSuffix3 => ' will make you smile :)';

  @override
  String get next => 'Next';

  @override
  String get getStarted => 'Get Started';
}
