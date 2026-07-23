import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/core/resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFormCard extends StatelessWidget {
  final String? Function(String?)? phoneValidator;
  final String? Function(String?)? passwordValidator;
  final TextEditingController usernameController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final String selectedCountryCode;
  final List<Map<String, String>> countries;
  final ValueChanged<String?> onCountryChanged;
  final bool obscureText;
  final VoidCallback onTogglePassword;

  const LoginFormCard({
    Key? key,
    this.phoneValidator,
    this.passwordValidator,
    required this.usernameController,
    required this.phoneController,
    required this.passwordController,
    required this.selectedCountryCode,
    required this.countries,
    required this.onCountryChanged,
    required this.obscureText,
    required this.onTogglePassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 338.w,
      height: 466,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: opencart,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
       
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
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
            style: TextStyles.interSize15.withColor(appWhiteColor),
            decoration: _buildInputDecoration(),
          ),
          SizedBox(height: 6.h),

          // ===== Phone =====
          Text(
            'Phone',
            style: TextStyles.interSize15
                .withWeight(FontWeight.w600)
                .withColor(appWhiteColor),
          ),
          SizedBox(height: 6.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCountryDropdown(),
              SizedBox(width: 8.w),
              Expanded(
                child: TextFormField(
                  validator: phoneValidator,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  style: TextStyles.interSize15.withColor(appWhiteColor),
                  decoration: _buildInputDecoration(hintText: '0996567879'),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),

          // ===== Password =====
          Text(
            'Password',
            style: TextStyles.interSize15
                .withWeight(FontWeight.w600)
                .withColor(appWhiteColor),
          ),
          SizedBox(height: 6.h),
          TextFormField(
            validator: passwordValidator,
            controller: passwordController,
            obscureText: obscureText,
            style: TextStyles.interSize15.withColor(appWhiteColor),
            decoration: _buildInputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: appWhiteColor.withOpacity(0.5),
                  size: 20.sp,
                ),
                onPressed: onTogglePassword,
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration({String? hintText, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle:
          TextStyles.interSize15.withColor(appWhiteColor.withOpacity(0.5)),
      suffixIcon: suffixIcon,
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: appWhiteColor.withOpacity(0.3)),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: appWhiteColor.withOpacity(0.3)),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: appWhiteColor, width: 2),
      ),
      errorStyle: TextStyle(fontSize: 11.sp, color: Colors.orangeAccent),
      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0),
      filled: false,
    );
  }

  Widget _buildCountryDropdown() {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: appWhiteColor.withOpacity(0.3)),
        ),
      ),
      child: DropdownButton<String>(
        value: selectedCountryCode,
        dropdownColor: opencart,
        icon: Icon(Icons.arrow_drop_down, color: appWhiteColor, size: 24.sp),
        iconSize: 24.sp,
        elevation: 16,
        style: TextStyles.interSize15.withColor(appWhiteColor),
        underline: const SizedBox(),
        onChanged: onCountryChanged,
        items: countries.map<DropdownMenuItem<String>>((country) {
          return DropdownMenuItem<String>(
            value: country['code'],
            child: Row(
              children: [
                Text(country['flag'] ?? '🏳️', style: TextStyle(fontSize: 20.sp)),
                SizedBox(width: 6.w),
                Text(
                  country['code'] ?? '',
                  style: TextStyles.interSize15.withColor(appWhiteColor),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}