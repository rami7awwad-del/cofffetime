import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/core/resources/text_style.dart';
import 'package:coffee_project/features/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _landingData = [
    {
      "image": "assets/images/Screenshot 2026-07-04 145006.png",
      "isRichText": false,
      "text": "coffee first then talk !",
    },
    {
      "image": "assets/images/landing2.png",
      "isRichText": true,
      "prefix": "just one ",
      "highlight": "sip",
      "suffix": " and feel good",
    },
    {
      "image": "assets/images/landing3.png",
      "isRichText": true,
      "prefix": "so ",
      "highlight": "chafe",
      "suffix": " will make you smile :)",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: SafeArea(
        child: Column(
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
                itemCount: _landingData.length,
                itemBuilder: (context, index) {
                  final item = _landingData[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          item["image"],
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              Center(
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
                      _landingData.length,
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
                  // زر Next / Get Started
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
                          if (_currentPage < _landingData.length - 1) {
                           
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          } else {
                            
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          _currentPage == _landingData.length - 1
                              ? "Get Started"  
                              : "Next",
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
      ),
    );
  }
}