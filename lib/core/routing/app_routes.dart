import 'package:coffee_project/Admain/admain_page.dart';
import 'package:coffee_project/Admain/loginAdmain_page.dart';
import 'package:coffee_project/core/Classes/Cappuccino.dart';
import 'package:coffee_project/core/Classes/coffee_beans.dart';
import 'package:coffee_project/features/auth/login_page.dart';
import 'package:coffee_project/features/auth/londingPage.dart';
import 'package:coffee_project/features/auth/profile_screen.dart';
import 'package:coffee_project/features/auth/register_page.dart';
import 'package:coffee_project/features/home/Screen/beandetails_screen.dart';
import 'package:coffee_project/features/home/Screen/coffeedetails_screen.dart';
import 'package:coffee_project/features/home/cart_screen.dart';
import 'package:coffee_project/features/home/cobon_screen.dart';
import 'package:coffee_project/features/home/Screen/paymentscreen.dart';
import 'package:coffee_project/features/home/Screen/orderhistory_screen.dart';
import 'package:coffee_project/features/home/favorites_screen.dart';
import 'package:coffee_project/features/home/home_screen.dart';
import 'package:coffee_project/features/main_layout/main_layout.dart';

import 'package:flutter/material.dart';

class AppRouter {

 final ValueChanged<Locale>? onLanguageChanged;

  AppRouter({this.onLanguageChanged});
   Route<dynamic> onGenerateRoute(RouteSettings settings) {
   
    final args = settings.arguments;

    switch (settings.name) {

case AppRoutes.londing:
        return MaterialPageRoute(builder: (_) =>  LandingPage(onLanguageChanged: onLanguageChanged));


      case AppRoutes.admain:
        return MaterialPageRoute(builder: (_) => const LoginadmainPage());


      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterPage());

      case AppRoutes.mainLayout:
        return MaterialPageRoute(builder: (_) => const MainLayout());

      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());

        
        case AppRoutes.cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());

        case AppRoutes.cobons:
        return MaterialPageRoute(builder: (_) => const CobonsScreen());
        
         case AppRoutes.favorit:
        return MaterialPageRoute(builder: (_) => const FavoritesScreen());

         case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

        
         case AppRoutes.order:
        return MaterialPageRoute(builder: (_) => const OrderHistoryScreen());

      

        case AppRoutes.beanDetails:
  final coffeeBean = settings.arguments as CoffeeBean; // استخدم اسم موديل البين لديك
  return MaterialPageRoute(
    builder: (_) => BeanDetailsScreen(coffeeBean: coffeeBean),
  );
        

        
 case AppRoutes.coffeeDetails:
  final cappuccino = settings.arguments as Cappuccino; 
  return MaterialPageRoute(
    builder: (_) => CoffeeDetailsScreen(cappuccino: cappuccino),
  );


      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
  
}




abstract class AppRoutes {
  
  static const String login = '/login';
  static const String register = '/register';
  static const String londing = '/londing';
  static const String admain = '/admain';

  static const String mainLayout = '/mainLayout';
  static const String home = '/home';
  static const String profile = '/profile';

  
  static const String productDetails = '/productDetails';
  static const String cart = '/cart';
  static const String cobons = '/cobons';
  static const String favorit = '/favorit';
  static const String order = '/order';
  static const String beanDetails = '/beanDetails';
  static const String coffeeDetails = '/coffeeDetails';
  static const String payment = '/payment';
}
