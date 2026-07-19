import 'package:coffee_project/core/Classes/Cappuccino.dart';
import 'package:coffee_project/core/Classes/coffee_beans.dart';
import 'package:coffee_project/core/resources/app_colors.dart';
import 'package:coffee_project/features/home/Screen/beandetails_screen.dart';
import 'package:coffee_project/features/home/Screen/coffeedetails_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffee_project/core/resources/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
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
        backgroundColor: appPrimaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20.h,
              children: [
                Container(
                  height: 100.h,
                  child: Row(
                    spacing: 20,
                    children: [
                      Text(
                        "Best Coffee For You",
                        style: TextStyles.interSize24.withColor(appWhiteColor),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: lightBrownColor.withOpacity(0.6),
                            width: 4,
                          ),
                        ),
                        color: opencart,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/images/Group 1171274887.png',
                              width: 60.w,
                              height: 25.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  child: TextField(
                    style: TextStyle(color: appWhiteColor),
                    cursorColor: textHint,
                    decoration: InputDecoration(
                      hintText: "Find Your Coffee...",
                      hintStyle: TextStyles.interSize15.withColor(textHint),
                      prefixIcon: Icon(Icons.search, color: textHint, size: 28),
                      filled: true,
                      fillColor: opencart,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                  ),
                ),

                SizedBox(
                  height: 160.h,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: appWhiteColor.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/cup.png',
                            width: 280.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: appWhiteColor.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/1.png',
                            width: 280.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: appWhiteColor.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/4.png',
                            width: 280.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Text(
                  "Coffee beans",
                  style: TextStyles.poppinsSize18.withColor(appWhiteColor),
                ),

                SizedBox(
                  height: 340.h,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final coffee = coffeeBeansList[index];
                      return InkWell(
                        onTap: () {
                          debugPrint(
                            "Navigating to details for: ${coffee.name}",
                          );

                          // الانتقال إلى شاشة التفاصيل وتمرير بيانات عنصر القهوة الحالي
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BeanDetailsScreen(coffeeBean: coffee),
                            ),
                          );
                        },

                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 5),
                          child: Container(
                            width: 150.w,
                            height: 340.h,
                            decoration: BoxDecoration(
                              gradient: advancedCoffeeGradient,
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: Card(
                              elevation: 4,
                              clipBehavior: Clip.antiAlias,
                              color: appWhiteColor.withOpacity(
                                0,
                              ), // شفاف باستخدام متغيراتك
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10,left: 10,right: 10,),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                        child: AspectRatio(
                                          aspectRatio:1.0, 
                                          child: Image.asset(
                                            coffee.imageUrl,
                                            fit: BoxFit
                                                .cover, 
                                          ),
                                        ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                      top: 10,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      coffee.name,
                                      style: TextStyles.poppinsSize15.withColor(
                                        appWhiteColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                    ),
                                    child: Text(
                                      "With Steamed Milk",
                                      style: TextStyles.interSize10.withColor(
                                        appWhiteColor,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 15.w),
                                      Text(
                                        r'$ ',
                                        style: TextStyles.jakartaSize15
                                            .withColor(goldAccentColor),
                                      ),
                                      Text(
                                        coffee.defaultPrice.toStringAsFixed(2),
                                        style: TextStyles.jakartaSize15
                                            .withColor(appWhiteColor),
                                      ),
                                      SizedBox(width: 45.w),
                                      InkWell(
                                        onTap: () {
                                          debugPrint(
                                            "Navigating to details for: ${coffee.name}",
                                          );
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BeanDetailsScreen(
                                                    coffeeBean: coffee,
                                                  ),
                                            ),
                                          );
                                        },
                                        borderRadius: BorderRadius.circular(12),
                                        child: Container(
                                          width: 28,
                                          height: 28,
                                          decoration: BoxDecoration(
                                            color: goldAccentColor,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: bak,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: coffeeBeansList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),

                Text(
                  "Cappuccino",
                  style: TextStyles.poppinsSize18.withColor(appWhiteColor),
                ),

                SizedBox(
                  height: 270.h,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final cappuccino = cappuccinoList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CoffeeDetailsScreen(cappuccino: cappuccino),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: advancedCoffeeGradient,
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: Card(
                              elevation: 4,
                              clipBehavior: Clip.antiAlias,
                              color: appWhiteColor.withOpacity(0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                          child: Image.asset(
                                            cappuccino.imageUrl,
                                            width: 100.w,
                                            height: 100.h,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            height: 30,

                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: bak.withOpacity(0.6),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                    topRight: Radius.circular(
                                                      25,
                                                    ),
                                                    bottomLeft: Radius.circular(
                                                      25,
                                                    ),
                                                  ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: goldAccentColor,
                                                  size: 13,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  cappuccino.rating
                                                      .toStringAsFixed(1),
                                                  style: TextStyles.interSize10
                                                      .withColor(appWhiteColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                      top: 10,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      cappuccino.name,
                                      style: TextStyles.poppinsSize15.withColor(
                                        appWhiteColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                    ),
                                    child: Text(
                                      "With Steamed Milk",
                                      style: TextStyles.interSize10.withColor(
                                        appWhiteColor,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 10.w),
                                      Text(
                                        r'$ ',
                                        style: TextStyles.poppinsSize18
                                            .withColor(goldAccentColor),
                                      ),
                                      Text(
                                        cappuccino.defaultPrice.toStringAsFixed(
                                          2,
                                        ),
                                        style: TextStyles.poppinsSize18
                                            .withColor(appWhiteColor),
                                      ),
                                      SizedBox(width: 15.w),
                                      InkWell(
                                        onTap: () {
                                          debugPrint(
                                            "Added ${cappuccino.name} to cart!",
                                          );
                                        },
                                        borderRadius: BorderRadius.circular(12),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: goldAccentColor,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: bak,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: cappuccinoList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<CoffeeBean> coffeeBeansList = [
  CoffeeBean(
    name: "Ethiopian",
    description:
        "A premium light roast with vibrant floral notes, sweet citrus undertones, and a clean, tea-like finish.",
    origin: "Ethiopia",
    rating: 9.5,
    imageUrl: "assets/images/4.png",
    sizesAndPrices: {'250gm': 14.99, '500gm': 28.00, '1kg': 50.00},
  ),
  CoffeeBean(
    name: "Colombian",
    description:
        "A beautifully balanced medium roast featuring rich chocolate tones, sweet caramel, and a subtle nutty aroma.",
    origin: "Colombia",
    rating: 8.8,
    imageUrl: "assets/images/2.png",
    sizesAndPrices: {'250gm': 12.50, '500gm': 23.50, '1kg': 42.00},
  ),
  CoffeeBean(
    name: "Sumatra",
    description:
        "A bold, heavy-bodied dark roast known for its unique earthy flavor profile, low acidity, and deep herbal complexity.",
    origin: "Indonesia",
    rating: 9.1,
    imageUrl: "assets/images/3.png",
    sizesAndPrices: {'250gm': 15.25, '500gm': 29.00, '1kg': 52.00},
  ),
  CoffeeBean(
    name: "Guatemalan",
    description:
        "An elegant medium-dark roast boasting a rich, full body with complex smoky notes and a sweet, cocoa-like finish.",
    origin: "Guatemala",
    rating: 8.9,
    imageUrl: "assets/images/1.png",
    sizesAndPrices: {'250gm': 13.99, '500gm': 26.00, '1kg': 48.00},
  ),
  CoffeeBean(
    name: "Brazilian",
    description:
        "A smooth, mild medium roast with natural sweetness, displaying delightful notes of roasted nuts and creamy caramel.",
    origin: "Brazil",
    rating: 8.4,
    imageUrl: "assets/images/5.png",
    sizesAndPrices: {'250gm': 11.80, '500gm': 22.00, '1kg': 39.00},
  ),
];
List<Cappuccino> cappuccinoList = [
  Cappuccino(
    name: "Classic",
    description:
        "A traditional espresso-based drink with equal parts of espresso, steamed milk, and rich foamed milk.",
    origin: "Italy",
    rating: 9.0,
    imageUrl: "assets/images/6.png",
    sizesAndPrices: {'S': 3.20, 'M': 4.20, 'L': 5.20},
  ),
  Cappuccino(
    name: "Viennese",
    description:
        "An elegant variation topped with whipped cream instead of milk foam, offering a sweeter and creamier taste.",
    origin: "Austria",
    rating: 8.7,
    imageUrl: "assets/images/7.png",
    sizesAndPrices: {'S': 3.80, 'M': 4.80, 'L': 5.80},
  ),
  Cappuccino(
    name: "Caramel",
    description:
        "Infused with smooth sweet caramel syrup, topped with a delicate drizzle of golden caramel sauce on top.",
    origin: "France",
    rating: 9.3,
    imageUrl: "assets/images/9.png",
    sizesAndPrices: {'S': 4.10, 'M': 5.10, 'L': 6.10},
  ),
  Cappuccino(
    name: "Freddo",
    description:
        "A refreshing iced version featuring cold-foamed skimmed milk layered over double shot of chilled espresso.",
    origin: "Greece",
    rating: 8.9,
    imageUrl: "assets/images/10.png",
    sizesAndPrices: {'S': 3.50, 'M': 4.50, 'L': 5.50},
  ),
  Cappuccino(
    name: "Decaf",
    description:
        "All the rich texture and delicious flavor of a classic recipe, crafted using premium decaffeinated beans.",
    origin: "Brazil",
    rating: 8.2,
    imageUrl: "assets/images/99.png",
    sizesAndPrices: {'S': 3.30, 'M': 4.30, 'L': 5.30},
  ),
];
