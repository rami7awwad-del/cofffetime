import 'package:coffee_project/Admain/admain_page.dart';
import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/core/resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginadmainPage extends StatefulWidget {
  const LoginadmainPage({super.key});

  @override
  State<LoginadmainPage> createState() => _LoginadmainPageState();
}


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;
  String selectedCountryCode = '+963';
class _LoginadmainPageState extends State<LoginadmainPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
      
              SizedBox(height: 55.h),

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
                     Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdmainPage(),
                      ),
                    );


                      print('Username: $username');
                      print('Phone: $selectedCountryCode $phone');
                      print('Password: $password');
      
                      
                    },
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyles.interSize18.withColor(appWhiteColor),
                    ),
                  ),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
