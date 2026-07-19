
import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/features/home/cart_screen.dart';
import 'package:coffee_project/features/home/cobon_screen.dart';
import 'package:coffee_project/features/home/favorites_screen.dart';
import 'package:coffee_project/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // 1. ترتيب الشاشات
  List<Widget> screens = [
    HomeScreen(),    // index 0
     CartScreen(),   // index 1
    FavoritesScreen(),  
      CobonsScreen()     
  ];

  // 2. ابدأ من HomeScreen (index 0)
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
  
    
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: Container(
          //clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.amber, // 
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.r),
              topRight: Radius.circular(50.r),
            ),
            // 
            
            
          ),
          height: 90.h,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: appPrimaryColor, 
            elevation: 0,
            currentIndex: currentIndex,
           
            selectedIconTheme: IconThemeData(
              color: goldAccentColor, 
              size: 24.sp,
            ),
            unselectedIconTheme: IconThemeData(
              color: icon, 
              size: 24.sp,
            ),
            
            onTap: (value) {
              debugPrint("the current index is : $value");
              setState(() {
                currentIndex = value;
              });
            },
            
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.badge),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_offer),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
