import 'package:coffee_project/Localization/l10n/app_localization.dart';
import 'package:coffee_project/core/routing/app_routes.dart';
import 'package:coffee_project/features/auth/londingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('ar'); // اللغة الافتراضية

  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    // تهيئة الـ AppRouter وربطه بـ setState
    _appRouter = AppRouter(
      onLanguageChanged: (newLocale) {
        setState(() {
          _locale = newLocale;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: _locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          
      initialRoute: AppRoutes.londing,
      
    onGenerateRoute: _appRouter.onGenerateRoute,
        );
      },
    );
  }
  
}

