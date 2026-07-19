import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/core/resources/text_style.dart';
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
                      color: const Color(0xff60735F),
                      borderRadius: BorderRadius.circular(16.r), // زوايا أكثر نعومة وانسيابية
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                       
                          Text(
                            'User Name',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          TextFormField(
                            controller: usernameController,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                            ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 8.h,
                                horizontal: 0,
                              ),
                              filled: false,
                            ),
                          ),
                          
                          SizedBox(height: 18.h),
                          
                          Text(
                            'Phone',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              
                              Container(
                                height: 44.h,
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.white.withOpacity(0.3),
                                    ),
                                  ),
                                ),
                                child: DropdownButton<String>(
                                  value: selectedCountryCode,
                                  dropdownColor: const Color(0xff60735F), // جعل خلفية القائمة متناسقة مع الكارد
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                    size: 22.sp,
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  underline: const SizedBox(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedCountryCode = newValue!;
                                    });
                                  },
                                  items: countries.map<DropdownMenuItem<String>>(
                                    (Map<String, String> country) {
                                      return DropdownMenuItem<String>(
                                        value: country['code'],
                                        child: Row(
                                          children: [
                                            Text(
                                              country['flag'] ?? '🏳️',
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                              ),
                                            ),
                                            SizedBox(width: 6.w),
                                            Text(
                                              country['code'] ?? '',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                              SizedBox(width: 12.w),
                              // رقم الهاتف
                              Expanded(
                                child: TextFormField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                  ),
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    hintText: '996 567 879',
                                    hintStyle: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white.withOpacity(0.4),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.3),
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.3),
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.h,
                                      horizontal: 0,
                                    ),
                                    filled: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          SizedBox(height: 18.h),
                          
                          // ===== Password =====
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          TextFormField(
                            controller: passwordController,
                            obscureText: _obscureText,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                            ),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.white.withOpacity(0.6),
                                  size: 18.sp,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 8.h,
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
                // الصورة الدائرية العلوية
                Positioned(
                  top: -45.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 90.r,
                      height: 90.r,
                      decoration: BoxDecoration(
                        color: darkBeigeColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/Group 1171274900.png",
                          height: 90.h,
                          width: 90.w,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Center(
                            child: Icon(
                              Icons.coffee,
                              size: 45.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 40.h),
            
            // ===== زر Register =====
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SizedBox(
                width: double.infinity,
                height: 52.h, 
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appPrimaryColor,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r), 
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
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                    
                    print('Username: $username');
                    print('Phone: $selectedCountryCode $phone');
                    print('Password: $password');
                  },
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: TextStyles.interSize18.copyWith(
                      color: appWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 16.h),
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