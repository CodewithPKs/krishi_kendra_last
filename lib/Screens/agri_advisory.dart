import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AgriAdvisor extends StatefulWidget {
  const AgriAdvisor({super.key});

  @override
  State<AgriAdvisor> createState() => _AgriAdvisorState();
}

class _AgriAdvisorState extends State<AgriAdvisor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        interactive: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Image.asset(
                    'assets/Images/AgriAdvisory/Agriadvisor.png',
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'What our Krishi Expert consultation include:',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Container(
                      child: Text(
                        'A 5-minute call with our expert agri-advisor provides important tips for crop development. Talk to our expert about saving your crops from pests and diseases and knowing the best recommendations for best results.',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final url = Uri.parse(
                          'https://managerkatayayni.zohobookings.in/#/customer/203098000000033008');
                      if (await canLaunchUrl(url)) ;
                      await launchUrl(url);
                      print('clicked');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrangeAccent),
                    child: Text(
                      'Book Now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
