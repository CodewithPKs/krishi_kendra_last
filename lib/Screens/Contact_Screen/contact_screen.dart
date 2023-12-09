import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../features/HamburgerMenu/hamburger_menu.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  bool _isSearchBarVisible = false;
  bool _isSearchIconVisible = true;
  TextEditingController _searchController = TextEditingController();

  void launchPhoneCall() async {
    const phoneNumber = 'tel:+16261414316'; // Replace with your actual phone number
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  void launchEmail() async {
    const email = 'mailto:support@krishisewakendra.in?subject=Feedback&body=Hi, I would like to provide the following feedback:'; // Replace with your email address and message
    if (await canLaunch(email)) {
      await launch(email);
    } else {
      throw 'Could not launch $email';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(245, 246, 250, 1),
      appBar: AppBar(
        title: Text("Contact Us"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(padding: EdgeInsets.all(25),
        child: Image.asset('assets/Images/contactUs_assets.png', width: MediaQuery.of(context).size.width/2,),),// Your image asset here
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: launchPhoneCall,
                  child: _buildContactOption(Icons.phone, 'Call Us'),
                ),
                GestureDetector(
                  onTap: () {},
                  child: _buildContactOption(Icons.chat, 'Chat With Us',
                  ),
                ),
                GestureDetector(
                  onTap: launchEmail,
                  child: _buildContactOption(Icons.email, 'Mail Us'),
                )
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text('Quick contact', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email.',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Send Message'),
                onPressed: () {},
              ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildContactOption(IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      CircleAvatar(
        radius: 25,
        child: Icon(icon, size: 30),
      ),
      SizedBox(height: 8),
      Text(label),
    ],
  );
}
