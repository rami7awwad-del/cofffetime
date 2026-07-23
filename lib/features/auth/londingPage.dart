import 'package:coffee_project/Localization/l10n/app_localization.dart';
import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/core/resources/text_style.dart';
import 'package:coffee_project/core/routing/app_routes.dart';
import 'package:coffee_project/features/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage extends StatefulWidget {
  final ValueChanged<Locale>? onLanguageChanged;

  const LandingPage({super.key, this.onLanguageChanged});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  late AppLocalizations l10n;

  List<Map<String, dynamic>> _buildLandingData() {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return [
      {
        "image": "assets/images/Screenshot 2026-07-04 145006.png",
        "isRichText": false,
        "text": l10n.landingText1,
      },
      {
        "image": "assets/images/landing2.png",
        "isRichText": true,
        "prefix": l10n.landingPrefix2,
        "highlight": l10n.landingHighlight2,
        "suffix": l10n.landingSuffix2,
      },
      {
        "image": "assets/images/landing3.png",
        "isRichText": true,
        "prefix": l10n.landingPrefix3,
        "highlight": l10n.landingHighlight3,
        "suffix": l10n.landingSuffix3,
      },
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    l10n = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final landingData = _buildLandingData();

    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: landingData.length,
                    itemBuilder: (context, index) {
                      final item = landingData[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              item["image"],
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) => Center(
                                child: Icon(
                                  Icons.coffee,
                                  size: 150.sp,
                                  color: appPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.h),
                          if (item["isRichText"])
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyles.interSize24.copyWith(
                                  color: appPrimaryColor,
                                ),
                                children: [
                                  TextSpan(text: item["prefix"]),
                                  TextSpan(
                                    text: item["highlight"],
                                    style: TextStyles.interSize24.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: goldAccentColor,
                                    ),
                                  ),
                                  TextSpan(text: item["suffix"]),
                                ],
                              ),
                            )
                          else
                            Text(
                              item["text"],
                              textAlign: TextAlign.center,
                              style: TextStyles.interSize24.copyWith(
                                color: appPrimaryColor,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          landingData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            height: 8.h,
                            width: _currentPage == index ? 20.w : 8.w,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? appPrimaryColor
                                  : oliveGreyColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: appPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            onPressed: () {
                              if (_currentPage < landingData.length - 1) {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              } else {
                                Navigator.pushNamed(
                                  context,AppRoutes.login
                                );
                              }
                            },
                            //Navigator.pushNamed(context, AppRoutes.productDetails);
                            child: Text(
                              _currentPage == landingData.length - 1
                                  ? l10n.getStarted
                                  : l10n.next,
                              textAlign: TextAlign.center,
                              style: TextStyles.interSize18.copyWith(
                                color: appWhiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10.h,
              right: 16.w,
              child: InkWell(
                onTap: () {
                  if (widget.onLanguageChanged != null) {
                    widget.onLanguageChanged!(
                      isArabic ? const Locale('en') : const Locale('ar'),
                    );
                  }
                },
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: appPrimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: appPrimaryColor, width: 1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.language,
                        size: 18.sp,
                        color: appPrimaryColor,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        isArabic ? "عربي" : "ُEn",
                        style: TextStyles.interSize15.copyWith(
                          color: appPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}