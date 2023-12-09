import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Screens/Contact_Screen/contact_screen.dart';
import '../../Screens/FAQ_Screen/faq_screen.dart';
import '../../Screens/Refer&EarnScreen/refer_and_earn_screen.dart';
import '../../Screens/update_info_page/updateInfoPage.dart';

class Hamburger extends StatefulWidget {
  const Hamburger({Key? key}) : super(key: key);

  @override
  State<Hamburger> createState() => _HamburgerState();
}

class _HamburgerState extends State<Hamburger> {
  Widget buildListTile(IconData icon, String title, Function() onTap) {
    return ListTile(
      leading: Icon(icon, size: 20,),
      title: Text(title, style: const TextStyle(fontSize: 15)),
      onTap: onTap,
      dense: true,
      horizontalTitleGap:8,

      iconColor: const Color(0xff07833D),
    );
  }

  // Function for to share a custom message on whatsapp
  void shareOnWhatsApp(String customMessage) async {

    final url = "https://wa.me/?text=${Uri.encodeComponent(customMessage)}";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.yellowAccent,

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Aditya Singh Rajput'),
            accountEmail: const Text('adityasinghrajput0217@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/Images/dp.png', fit: BoxFit.cover),
              ),
            ),
            decoration: const BoxDecoration(
                color: Color(0xff07833D),
            ),


          ),
          buildListTile(Icons.edit, 'Edit Profile', () {
            // Implement the edit profile functionality
            // This can navigate to a new screen or show a modal bottom sheet for editing profile details
            Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateInformationPage()));// Close the drawer
          }),
          buildListTile(Icons.translate, 'Language', () {}),
          buildListTile(FontAwesomeIcons.bagShopping, 'My orders', () {}),
          buildListTile(Icons.production_quantity_limits, 'Find my products', () {}),
          buildListTile(Icons.group_add, 'Refer & Earn', () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ReferEarnScreen()));
          }),
          buildListTile(Icons.phone, 'Contact us', () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactScreen()));
          }),
          buildListTile(Icons.question_mark, 'General FAQ', () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FAQListScreen()));
          }),
          buildListTile(Icons.info_outlined, 'About us', () {}),
          buildListTile(Icons.policy, 'Privacy and policy', () {}),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          buildListTile(Icons.login_rounded, 'Sign out', () {}),
          buildListTile(Icons.precision_manufacturing, 'Made with ❤️ in India', () {}),
        ],

      ),

    );
  }
}
