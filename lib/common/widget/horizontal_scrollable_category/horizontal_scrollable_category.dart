import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';


class ProductItemCategory extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;

  const ProductItemCategory(
      {Key? key,
        required this.product,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110.0,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                product['image'],
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ProductItemFertilizerCategory extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;
  final bool isSelected;

  const ProductItemFertilizerCategory({
    Key? key,
    required this.product,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height/7.5,
        width: 110.0,
        //padding: const EdgeInsets.all(8.0),
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                product['image'],
                fit: BoxFit.cover,
              ),
            ),
            Text(
              product['name'],
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// class ImageFromStorage extends StatelessWidget {
//   final String imagePath;
//
//   ImageFromStorage({required this.imagePath});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _getImageURL(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Image.network(snapshot.data.toString());
//         } else if (snapshot.hasError) {
//           return Text('Error loading image');
//         } else {
//           return CircularProgressIndicator();
//         }
//       },
//     );
//   }
//
//   Future<String> _getImageURL() async {
//     final ref = FirebaseStorage.instance.ref().child('Category/'+imagePath);
//     return await ref.getDownloadURL();
//   }
// }