import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:krishisevakendra/Screens/cartPage.dart';
import '../../Screens/Search_screen/SearchScreen.dart';

class StaticAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StaticAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 8,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu, size: 30, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
              // Handle menu icon press
            },
          );
        },
      ),
      title: Center(
        child: Image.asset(
          'assets/Images/App_Logo/krishilogo.png',
          width: 120,
          height: 80,
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color(0xff07833D),
      titleSpacing: 0.0,
      actions: [
        InkWell(
          onTap: () {
            // Handle search icon press
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>const SearchScreen()),
            );
          },
          child: const SizedBox(
            width: 35,
            child: Icon(
              Iconsax.search_normal,
              color: Colors.white,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            // Handle notifications icon press
          },
          child: const SizedBox(
            width: 35,
            child: Icon(
              Iconsax.notification,
              color: Colors.white,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>const CartPage()),
            );
          },
          child: const SizedBox(
            width: 35,
            child: Icon(
              Iconsax.shopping_cart,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

