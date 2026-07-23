import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/core/resources/text_style.dart';
import 'package:coffee_project/core/widgets/customButton.dart';
import 'package:coffee_project/core/widgets/loginFormCard.dart';
import 'package:coffee_project/core/widgets/loginHeaderAvatar.dart';
import 'package:coffee_project/features/main_layout/main_layout.dart';
import 'package:coffee_project/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

  // ===== شروط التحقق (Validators) =====
  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter phone number';
    }
    if (value.trim().length != 10 || !RegExp(r'^[0-9]+$').hasMatch(value.trim())) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  void _onRegister() {
    // تفعيل فحص الشروط قبل إنشاء الحساب
    if (_formKey.currentState!.validate()) {
      String username = usernameController.text;
      String phone = phoneController.text;
      String password = passwordController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Account created successfully for $username!',
            style: TextStyles.interSize15.withColor(appWhiteColor),
          ),
          backgroundColor: successColor,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );

      print('Username: $username');
      print('Phone: $selectedCountryCode $phone');
      print('Password: $password');

      Navigator.pushNamed(
        context,AppRoutes.mainLayout
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120.h),

              // Stack الحاوية والصورة العلوية
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Center(
                    child: LoginFormCard(
                      usernameController: usernameController,
                      phoneController: phoneController,
                      passwordController: passwordController,
                      selectedCountryCode: selectedCountryCode,
                      countries: countries,
                      onCountryChanged: (val) =>
                          setState(() => selectedCountryCode = val!),
                      obscureText: _obscureText,
                      onTogglePassword: () =>
                          setState(() => _obscureText = !_obscureText),
                      phoneValidator: _validatePhone,
                      passwordValidator: _validatePassword,
                    ),
                  ),
                  const LoginHeaderAvatar(),
                ],
              ),

              SizedBox(height: 35.h),

              // زر Register الموحد
              CustomButton(
                text: "Register",
                onPressed: _onRegister,
                backgroundColor: appPrimaryColor,
                textColor: appWhiteColor,
              ),

              SizedBox(height: 20.h),
            ],
          ),
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