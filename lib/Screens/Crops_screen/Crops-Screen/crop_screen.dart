import 'package:flutter/material.dart';
import '../../../List/Crops/crops_list.dart';
import '../../../common/widget/cards/Crop/Crop_Card/crop_card.dart';
import '../Crop-Diseases/diseases_screen.dart';

class CropScreen extends StatefulWidget {
  const CropScreen({Key? key});

  @override
  State<CropScreen> createState() => _CropScreenState();
}

class _CropScreenState extends State<CropScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 246, 250, 1),
      body: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            mainAxisExtent: 175,
          ),
          itemCount: Cropsproducts.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiseasesScreen(crop: Cropsproducts[index], diseases: Cropsproducts[index]['diseases'],)),
                );
              },
              child: CropCards(
                image: Cropsproducts[index]['image'],
                name: Cropsproducts[index]['CropName'],
              ),
            );
          },
        ),
      );
  }
}