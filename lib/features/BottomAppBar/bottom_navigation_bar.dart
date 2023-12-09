import 'package:flutter/material.dart';
import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:krishisevakendra/Screens/Crops_screen/Crops-Screen/crop_screen.dart';
import 'package:krishisevakendra/Screens/agri_advisory.dart';
import '../../Screens/CategoryScreen/caregory_screeen.dart';
import '../../Screens/WishListScreen/wish_list_screen.dart';
import '../../Screens/home.dart';
import '../../utils/constants/text_strings.dart';

class BootomNavigationBar extends StatefulWidget {
  const BootomNavigationBar({super.key});

  @override
  State<BootomNavigationBar> createState() => _BootomNavigationBarState();
}

class _BootomNavigationBarState extends State<BootomNavigationBar> {
  int _selectedIndex = 0; //default index

  final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const CropScreen(),
   const CategoryScreen(),
    const AgriAdvisor(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // TODO: Add navigation functionality
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff07833D),
        shape: const CircleBorder(),
        elevation: 8,
        splashColor: Colors.red,

        child: const Icon(Icons.support_agent_outlined,color: Colors.white,size: 30,),
        // Customize the FAB background color
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        unselectedIconSize: 20,
        selectedIconSize: 26,
        selectedColor: const Color(0xff07833D),
        unSelectedColor: Colors.black54,
        backgroundColor: const Color.fromARGB(255, 236, 233, 233),
        currentIndex: _selectedIndex,
        unselectedFontSize: 12,
        selectedFontSize: 13,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        indicatorType: IndicatorType.Top,
        customBottomBarItems: [
          CustomBottomBarItems(
            label: KrishiTexts.bottomLabel1,
            icon: Icons.home,
          ),
          CustomBottomBarItems(
              label: KrishiTexts.bottomLabel2,
              icon: FontAwesomeIcons.pagelines),
          CustomBottomBarItems(
              label: KrishiTexts.bottomLabel3, icon: FontAwesomeIcons.solidHeart),
          CustomBottomBarItems(
            label: KrishiTexts.bottomLabel4,
            icon: Icons.support_agent_rounded,
          ),
        ],
      ),
    );
  }
}
