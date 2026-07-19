import 'package:coffee_project/core/resources/text_style.dart';
import 'package:coffee_project/core/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee_project/core/resources/app_colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  
  final TextEditingController _nameController = TextEditingController(text: " ");
  final TextEditingController _phoneController = TextEditingController(text: "");
 final TextEditingController _passwordController = TextEditingController(text: "");

  bool _isPasswordObscured = true;
  String _selectedCountryCode = "+963"; 

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreenColor, 
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios_new, color: appWhiteColor, size: 20.sp),
                      style: IconButton.styleFrom(
                        backgroundColor: bak, // لون الخلفية الداكن المعرف لديك
                        padding: EdgeInsets.all(10.w),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                      ),
                    ),
                    Text(
                      "Robert Evans",
                      style: TextStyles.poppinsSize22.withColor(appWhiteColor),
                    ),
                    SizedBox(width: 45.w), 
                  ],
                ),
                SizedBox(height: 25.h),

               
                Container(
                  width: 170.w,
                  height: 170.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/15.png'), 
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),

                
                Container(
                  height: 500.h,
                  width:300.w,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    gradient: advancedCoffeeGradient4, 
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(
                      color: appWhiteColor.withOpacity(0.15),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomFieldLabel(label: "Username"),
                      TextField(
                        controller: _nameController,
                        style: TextStyles.interSize15.withColor(appWhiteColor),
                        decoration: _buildInputDecoration(),
                      ),
                      SizedBox(height: 20.h),
                      const CustomFieldLabel(label: "Phone"),
                      Row(
                        children: [
                         
                          DropdownButton<String>(
                            value: _selectedCountryCode,
                            dropdownColor: darkGreenColor,
                            underline: const SizedBox(),
                            icon: Icon(Icons.arrow_drop_down, color: textSecondary, size: 20.sp),
                            style: TextStyles.interSize15.withColor(appWhiteColor),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  _selectedCountryCode = newValue;
                                });
                              }
                            },
                            items: <String>['+963', '+966', '+971', '+1']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: TextField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              style: TextStyles.interSize15.withColor(appWhiteColor),
                             // decoration: _buildInputDecoration(),
                            ),
                          ),
                        ],
                      ),
                      
                      Container(height: 1.h, color: appWhiteColor.withOpacity(0.3)),
                      SizedBox(height: 20.h),

                      
                      const CustomFieldLabel(label: "Passeword"),
                      TextField(
                        controller: _passwordController,
                        obscureText: _isPasswordObscured,
                        style: TextStyles.interSize15.withColor(appWhiteColor),
                        decoration: _buildInputDecoration().copyWith(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              color: textSecondary.withOpacity(0.7),
                              size: 20.sp,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordObscured = !_isPasswordObscured;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 35.h),

                 
                      SizedBox(
                        width: double.infinity,
                        height: 52.h,
                        child: ElevatedButton(
                          onPressed: () {
                            // كود حفظ التغييرات
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: goldAccentColor, 
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            "Save Changes",
                            style: TextStyles.poppinsSize15.withColor(appWhiteColor).withWeight(FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.h),

           
                SizedBox(
                  width: double.infinity,
                  height: 55.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // كود تسجيل الخروج
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: errorColor, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Log Out",
                      style: TextStyles.poppinsSize15.withColor(appWhiteColor).withWeight(FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

 
  
  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 8.h),
      isDense: true,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: appWhiteColor.withOpacity(0.3), width: 1.h),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: goldAccentColor, width: 1.5),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: appWhiteColor.withOpacity(0.3)),
      ),
    );
  }
}