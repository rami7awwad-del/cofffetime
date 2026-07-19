import 'package:coffee_project/core/Classes/ordermodels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/core/resources/text_style.dart';
import 'package:coffee_project/features/auth/profile_screen.dart';
class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  
  final Map<int, bool> _expandedStates = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreenColor, 
      body: SafeArea(
        child: Column(
          children: [
            
            _buildAppBar(context),
            
           
            _buildTabsRow(),
            SizedBox(height: 15.h),

         
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: mockOrders.length,
                itemBuilder: (context, orderIndex) {
                  final order = mockOrders[orderIndex];
                 
                  bool isExpanded = _expandedStates[orderIndex] ?? true; 

                  return Container(
                    margin: EdgeInsets.only(bottom: 25.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _expandedStates[orderIndex] = !isExpanded;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Order Date", style: TextStyles.interSize15.withColor(textHint)),
                                  SizedBox(height: 2.h),
                                  Text(order.orderDate, style: TextStyles.interSize15.withColor(appWhiteColor)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Total Amount", style: TextStyles.interSize15.withColor(textHint)),
                                  SizedBox(height: 2.h),
                                  Text(
                                    "\$ ${order.totalAmount.toStringAsFixed(2)}",
                                    style: TextStyles.poppinsSize15.withColor(goldAccentColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),

                     
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          height: isExpanded ? null : 0, // إذا أُغلق يصبح الارتفاع 0
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: Column(
                            children: order.items.map((item) {
                              return _buildProductCard(item);
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            
         
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: SizedBox(
                width: double.infinity,
                height: 55.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: goldAccentColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                    elevation: 0,
                  ),
                  child: Text(
                    "Download",
                    style: TextStyles.poppinsSize18.withColor(darkGreenColor).withWeight(FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildProductCard(OrderItem item) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        gradient: advancedCoffeeGradient2, 
        borderRadius: BorderRadius.circular(23.r),
      ),
      child: Column(
        children: [
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(item.imageUrl, width: 60.w, height: 60.h, fit: BoxFit.cover),
                ),
              
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name, style: TextStyles.poppinsSize18.withColor(appWhiteColor)),
                    Text(item.description, style: TextStyles.interSize15.withColor(textHint)),
                  ],
                ),
              ),
              Text(
                "\$ ${item.itemTotal.toStringAsFixed(2)}",
                style: TextStyles.poppinsSize18.withColor(goldAccentColor),
              ),
            ],
          ),
          SizedBox(height: 15.h),

         
          Column(
            children: item.sizeDetails.map((sizeDetail) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                
                    Container(
                      width: 55.w,
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: bak, // الخلفية الأكثر قتامة لديك
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(sizeDetail.size, style: TextStyles.interSize15.withColor(appWhiteColor)),
                    ),
                    
                 
                    Row(
                      children: [
                        Text(r"$ ", style: TextStyles.poppinsSize15.withColor(goldAccentColor)),
                        Text(sizeDetail.price.toStringAsFixed(2), style: TextStyles.poppinsSize15.withColor(appWhiteColor)),
                      ],
                    ),
                    
                 
                    Text(
                      "X ${sizeDetail.quantity}",
                      style: TextStyles.interSize15.withColor(goldAccentColor),
                    ),
                    
                 
                    Text(
                      sizeDetail.subTotal.toStringAsFixed(2),
                      style: TextStyles.poppinsSize15.withColor(goldAccentColor),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

    Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new, color: textHint, size: 18.sp),
            style: IconButton.styleFrom(
              backgroundColor: bak,
              padding: EdgeInsets.all(10.w),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            ),
          ),
          Text("Order History", style: TextStyles.interSize24.withColor(appWhiteColor)),
          GestureDetector(
                    onTap: () {
                 
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const EditProfileScreen(), 
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        'assets/images/16.png', // مسار صورتك الشخصية
                        width: 30.w,
                        height: 30.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
        ],
      ),
    );
  }

  // ودجت لتبويبات الفلاتر العلوية
  Widget _buildTabsRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTabItem("All", isActive: true),
          _buildTabItem("Delivery"),
          _buildTabItem("In-House"),
          _buildTabItem("Canceled"),
        ],
      ),
    );
  }

  Widget _buildTabItem(String text, {bool isActive = false}) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyles.interSize15.withColor(isActive ? goldAccentColor : textHint).withWeight(isActive ? FontWeight.bold : FontWeight.normal),
        ),
        if (isActive) ...[
          SizedBox(height: 4.h),
          CircleAvatar(radius: 3.r, backgroundColor: goldAccentColor),
        ]
      ],
    );
  }
}