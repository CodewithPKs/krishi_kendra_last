import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferEarnScreen extends StatelessWidget {
  const ReferEarnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Refer and Earn"
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/2.5,
                decoration: const BoxDecoration(

                  gradient: LinearGradient(
                    colors: [Colors.green, Color.fromARGB(255, 29, 221, 163)],
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Invite Your Friend And',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Earn Money',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Image(
                        //     image: AssetImage('assets/Images/coins_.png'),
                        //     width: 120),
                        Image(
                            image: AssetImage('assets/Images/kissan_logo.png'),
                            width: 150),
                        // Image(
                        //     image: AssetImage('assets/Images/coins_.png'),
                        //     width: 120),
                      ],
                    ),
                  ],
                ),
              ),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildAvatarWithText(
                              'Refer to \n a Friend', Icons.group_add),
                          _buildSeparator(), // Add separator text between avatars
                          _buildAvatarWithText(
                              'Login with \n refrel Code', Icons.shopping_cart),
                          _buildSeparator(), // Add separator text between avatars
                          _buildAvatarWithText(
                              'Get 100 coins \n use it', Icons.generating_tokens),
                        ],
                      ),
                      const SizedBox(
                          height:
                          10.0), // Adjust the spacing between circles and dashed lines
                    ],
                  ),
                ),
                const Text('YOUR REFERRLE CODE',  style: TextStyle(fontSize: 15, letterSpacing: 5)),
                const SizedBox(height: 15),
                CopyTextButton(textToCopy: 'PRAVEEN',),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add your share functionality here
                    // For example, you can use the Share package: https://pub.dev/packages/share
                    shareOnWhatsApp('Hi! this is krishi seva kendra');
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Background color
                    onPrimary: Colors.white, // Text color
                    elevation: 5, // Shadow elevation
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Adjust border radius as needed
                    ),
                  ),
                  icon: Icon(Icons.share),
                  label: Text(
                    'Share',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )

              ],
            )
            ],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image(
                    image: AssetImage('assets/Images/wallet-png.png'),
                    width: 50,
                  ),
                  Text(
                    'Share your referral link and Invite your friend \n via WhatsApp, SMS, email & Get 100 Coins',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildSeparator() {
    return const Text(
      '--------',
      style: TextStyle(letterSpacing: 5, fontSize: 20),
    );
  }

  Widget _buildAvatarWithText(String text, IconData icon) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue, width: 5.0),
          ),
          child: CircleAvatar(
            child: Icon(icon),
          ),
        ),
        const SizedBox(
            height: 5.0), // Adjust the spacing between avatar and text
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }
}


void shareOnWhatsApp(String customMessage) async {

  final url = "https://wa.me/?text=${Uri.encodeComponent(customMessage)}";

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class CopyTextButton extends StatelessWidget {
  final String textToCopy;

  const CopyTextButton({Key? key, required this.textToCopy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Text(
            textToCopy,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: 10),
          ),
        ),
        TextButton(
          onPressed: () {
            _copyToClipboard(textToCopy);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Text copied to clipboard'),
              ),
            );
          },
          child: Text(
            'TAP TO COPY',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  void _copyToClipboard(String text) {
    FlutterClipboard.copy(text);
  }
}