import 'package:flutter/material.dart';
import 'package:krishisevakendra/features/App_Bar/static_app_bar.dart';


import 'features/BottomAppBar/bottom_navigation_bar.dart';
import 'features/HamburgerMenu/hamburger_menu.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key});

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        drawer: Hamburger(),
        backgroundColor: Color.fromRGBO(245, 246, 250, 1),
      appBar:StaticAppBar(),

      body: BootomNavigationBar(),

    );
  }
}


