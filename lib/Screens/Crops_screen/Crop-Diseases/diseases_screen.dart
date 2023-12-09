import 'package:flutter/material.dart';

import '../../../common/widget/cards/Crop/CropDiseasesCard/crop_diseases_card.dart';


class DiseasesScreen extends StatefulWidget {
  final Map<String, dynamic> crop;
  final List<Map<String, dynamic>> diseases;

  const DiseasesScreen({super.key, required this.crop, required this.diseases});

  @override
  State<DiseasesScreen> createState() => _DiseasesScreenState();
}

class _DiseasesScreenState extends State<DiseasesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromRGBO(230, 255, 230, 1),
      appBar: AppBar(
        title: const Text('Diseases'),
        backgroundColor: const Color(0xff07833D),
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromRGBO(230, 255, 230, 1),
            child: Column(
              children: [
                Image(
                  image: AssetImage(widget.crop['image']),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.crop['CropName'],
                  style: const TextStyle(
                    color: Color(0xFF07833D),
                    fontSize: 35,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(7, 131, 61, 1)),
                  ),
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text(
                        'Buy Product from your crop',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: const Color.fromRGBO(245, 246, 250, 1),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                mainAxisExtent: 200,
              ),
              itemCount: widget.diseases.length,
              itemBuilder: (BuildContext context, int index) {
                return CropDiseasesCard(
                  image: widget.diseases[index]['image'],
                  name: widget.diseases[index]['CropName'],
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
