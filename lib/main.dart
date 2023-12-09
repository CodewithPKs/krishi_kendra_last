import 'package:flutter/material.dart';
import 'package:krishisevakendra/AppBottomNavBar.dart';
import 'Features/bottom_navigation_bar.dart';
import 'Screens/cartPage.dart';
import 'Screens/update_info_page/updateInfoPage.dart';



void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AppBottomNavBar(),

      initialRoute: '',
      routes: {
        '/cartPage': (context) => const CartPage(),
        '/update': (context) => const UpdateInformationPage(),
      },
    );
  }
}