import 'package:coffee_project/core/resources/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee_project/core/resources/app_colors.dart';


class PaymentScreen extends StatefulWidget {
  final double totalPrice;

  const PaymentScreen({super.key, required this.totalPrice});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  String _selectedPaymentMethod = "credit";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreenColor, 
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios_new, color: appWhiteColor, size: 20.sp),
                    style: IconButton.styleFrom(
                      backgroundColor: bak, 
                      padding: EdgeInsets.all(10.w),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    ),
                  ),
                  Text(
                    "Payment",
                    style: TextStyles.poppinsSize22.withColor(appWhiteColor),
                  ),
                  SizedBox(width: 45.w), 
                ],
              ),
              SizedBox(height: 25.h),

  
              GestureDetector(
                onTap: () => setState(() => _selectedPaymentMethod = "credit"),
                child: Container(
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    gradient: advancedCoffeeGradient5, 
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(
                      color: _selectedPaymentMethod == "credit" ? goldAccentColor : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Credit Card",
                        style: TextStyles.interSize15.withColor(appWhiteColor).withWeight(FontWeight.bold),
                      ),
                      SizedBox(height: 15.h),
                   
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.credit_card_rounded, color: goldAccentColor, size: 40.sp),
                          Text(
                            "VISA",
                            style: TextStyles.interSize24.withColor(appWhiteColor).withWeight(FontWeight.bold).copyWith(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                    
                      Text(
                        "3 8 9 7   8 9 2 3   6 7  4 5   4 6 3 8",
                        style: TextStyles.jakartaSize15.withColor(appWhiteColor),
                      ),
                      SizedBox(height: 25.h),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Card Holder Name", 
                                style: TextStyles.interSize10.withColor(textSecondary)
                              ),
                              Text(
                                "Robert Evans", 
                                style: TextStyles.interSize15.withColor(appWhiteColor).withWeight(FontWeight.w500)
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Expiry Date", 
                                style: TextStyles.interSize10.withColor(textSecondary)
                              ),
                              Text(
                                "02/30", 
                                style: TextStyles.interSize15.withColor(appWhiteColor).withWeight(FontWeight.w500)
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),

          
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _buildPaymentOption(
                      id: "wallet",
                      icon: Icons.account_balance_wallet_rounded,
                      iconColor: goldAccentColor,
                      title: "Wallet",
                      trailing: r"$ 100.50",
                    ),
                    _buildPaymentOption(
                      id: "google",
                      icon: Icons.g_mobiledata_rounded,
                      iconColor: Colors.blue,
                      title: "Google Pay",
                    ),
                    _buildPaymentOption(
                      id: "apple",
                      icon: Icons.apple_rounded,
                      iconColor: appWhiteColor,
                      title: "Apple Pay",
                    ),
                    _buildPaymentOption(
                      id: "amazon",
                      icon: Icons.shop_two_rounded,
                      iconColor: Colors.orange,
                      title: "Amazon Pay",
                    ),
                  ],
                ),
              ),

         
              Padding(
                padding: EdgeInsets.only(bottom: 20.h, top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
               
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price", 
                          style: TextStyles.interSize15.withColor(textSecondary)
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          children: [
                            Text(
                              r'$ ', 
                              style: TextStyles.interSize18.withColor(goldAccentColor).withWeight(FontWeight.bold)
                            ),
                            Text(
                              widget.totalPrice.toStringAsFixed(2),
                              style: TextStyles.interSize24.withColor(appWhiteColor).withWeight(FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                
                    GestureDetector(
                      onTap: () {
                  
                      },
                      child: Container(
                        width: 220.w,
                        height: 55.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: goldAccentColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Text(
                          _getButtonText(),
                          style: TextStyles.poppinsSize15.withColor(bak).withWeight(FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 
  Widget _buildPaymentOption({
    required String id,
    required IconData icon,
    required Color iconColor,
    required String title,
    String? trailing,
  }) {
    bool isSelected = _selectedPaymentMethod == id;
    return GestureDetector(
      onTap: () => setState(() => _selectedPaymentMethod = id),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: bak, 
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? goldAccentColor : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 28.sp),
            SizedBox(width: 15.w),
            Text(
              title,
              style: TextStyles.interSize15.withColor(appWhiteColor).withWeight(FontWeight.w600),
            ),
            const Spacer(),
            if (trailing != null)
              Text(
                trailing,
                style: TextStyles.interSize15.withColor(appWhiteColor),
              ),
          ],
        ),
      ),
    );
  }

    String _getButtonText() {
    switch (_selectedPaymentMethod) {
      case "credit":
        return "Pay from Credit Card";
      case "wallet":
        return "Pay from Wallet";
      case "google":
        return "Pay with Google Pay";
      case "apple":
        return "Pay with Apple Pay";
      case "amazon":
        return "Pay with Amazon Pay";
      default:
        return "Pay Now";
    }
  }
}