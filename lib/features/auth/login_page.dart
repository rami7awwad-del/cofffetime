import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/core/resources/text_style.dart';
import 'package:coffee_project/features/auth/register_page.dart';
import 'package:coffee_project/features/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;
  String selectedCountryCode = '+963';

  final List<Map<String, String>> countries = [
    {'code': '+963', 'flag': '🇸🇾', 'name': 'Syria'},
    {'code': '+966', 'flag': '🇸🇦', 'name': 'Saudi Arabia'},
    {'code': '+971', 'flag': '🇦🇪', 'name': 'UAE'},
    {'code': '+20', 'flag': '🇪🇬', 'name': 'Egypt'},
    {'code': '+961', 'flag': '🇱🇧', 'name': 'Lebanon'},
    {'code': '+962', 'flag': '🇯🇴', 'name': 'Jordan'},
    {'code': '+970', 'flag': '🇵🇸', 'name': 'Palestine'},
    {'code': '+964', 'flag': '🇮🇶', 'name': 'Iraq'},
    {'code': '+965', 'flag': '🇰🇼', 'name': 'Kuwait'},
    {'code': '+968', 'flag': '🇴🇲', 'name': 'Oman'},
    {'code': '+974', 'flag': '🇶🇦', 'name': 'Qatar'},
    {'code': '+973', 'flag': '🇧🇭', 'name': 'Bahrain'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60.h),

            Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Container(
                    height: 390.h,
                    width: 338.w,
                    decoration: BoxDecoration(
                      color: opencart,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 16.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ===== User Name =====
                          Text(
                            'User Name',
                            style: TextStyles.interSize15
                                .withWeight(FontWeight.w600)
                                .withColor(appWhiteColor),
                          ),
                          SizedBox(height: 6.h),
                          TextFormField(
                            controller: usernameController,
                            style: TextStyles.interSize15.withColor(
                              appWhiteColor,
                            ),
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: appWhiteColor.withOpacity(0.3),
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: appWhiteColor.withOpacity(0.3),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: appWhiteColor,
                                  width: 2,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12.h,
                                horizontal: 0,
                              ),
                              filled: false,
                            ),
                          ),
                          SizedBox(height: 20.h),

                          // ===== Phone =====
                          Text(
                            'Phone',
                            style: TextStyles.interSize15
                                .withWeight(FontWeight.w600)
                                .withColor(appWhiteColor),
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                
                              Container(
                                height: 48.h,
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: appWhiteColor.withOpacity(0.3),
                                    ),
                                  ),
                                ),
                                child: DropdownButton<String>(
                                  value: selectedCountryCode,
                                  dropdownColor:
                                      opencart, 
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: appWhiteColor,
                                    size: 24.sp,
                                  ),
                                  iconSize: 24.sp,
                                  elevation: 16,
                                  style: TextStyles.interSize15.withColor(
                                    appWhiteColor,
                                  ),
                                  underline: const SizedBox(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedCountryCode = newValue!;
                                    });
                                  },
                                  items: countries
                                      .map<DropdownMenuItem<String>>((
                                        Map<String, String> country,
                                      ) {
                                        return DropdownMenuItem<String>(
                                          value: country['code'],
                                          child: Row(
                                            children: [
                                              Text(
                                                country['flag'] ?? '🏳️',
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                ),
                                              ),
                                              SizedBox(width: 6.w),
                                              Text(
                                                country['code'] ?? '',
                                                style: TextStyles.interSize15
                                                    .withColor(appWhiteColor),
                                              ),
                                            ],
                                          ),
                                        );
                                      })
                                      .toList(),
                                ),
                              ),
                              SizedBox(width: 8.w),

                              Expanded(
                                child: TextFormField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyles.interSize15.withColor(
                                    appWhiteColor,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: '996 567 879',
                                    hintStyle: TextStyles.interSize15.withColor(
                                      appWhiteColor.withOpacity(0.5),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: appWhiteColor.withOpacity(0.3),
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: appWhiteColor.withOpacity(0.3),
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: appWhiteColor,
                                        width: 2,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 12.h,
                                      horizontal: 0,
                                    ),
                                    filled: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),

                          // ===== Password =====
                          Text(
                            'Password',
                            style: TextStyles.interSize15
                                .withWeight(FontWeight.w600)
                                .withColor(appWhiteColor),
                          ),
                          SizedBox(height: 6.h),
                          TextFormField(
                            controller: passwordController,
                            obscureText: _obscureText,
                            style: TextStyles.interSize15.withColor(
                              appWhiteColor,
                            ),
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: appWhiteColor.withOpacity(0.3),
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: appWhiteColor.withOpacity(0.3),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: appWhiteColor,
                                  width: 2,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: appWhiteColor.withOpacity(0.5),
                                  size: 20.sp,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12.h,
                                horizontal: 0,
                              ),
                              filled: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

  
                Positioned(
                  top: -50.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 100.r,
                      height: 100.r,
                      decoration: const BoxDecoration(
                        color: darkBeigeColor,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/images/Group 1171274900.png",
                        height: 100.h,
                        width: 100.w,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: Icon(
                            Icons.coffee,
                            size: 60.sp,
                            color:
                                appPrimaryColor, 
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 35.h),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SizedBox(
                width: double.infinity,
                height: 55.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    String username = usernameController.text;
                    String phone = phoneController.text;
                    String password = passwordController.text;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Welcome $username!',
                          style: TextStyles.interSize15.withColor(
                            appWhiteColor,
                          ),
                        ),
                        backgroundColor:
                            successColor, 
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );

                    print('Username: $username');
                    print('Phone: $selectedCountryCode $phone');
                    print('Password: $password');

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainLayout(),
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyles.interSize18.withColor(appWhiteColor),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // ===== زر Create Account =====
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SizedBox(
                width: double.infinity,
                height: 55.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    side: BorderSide(color: darkGreenColor, width: 2.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Create Account",
                    textAlign: TextAlign.center,
                    style: TextStyles.interSize18.withColor(
                      darkGreenColor,
                    ), // 
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
