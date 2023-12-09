import 'package:flutter/material.dart';

class CropDiseasesCard extends StatelessWidget {
  final String image;
  final String name;
  const CropDiseasesCard({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 3,
              offset: const Offset(2, 2),
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 3,
              offset: const Offset(-2, -2),
            ),
          ],
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
        ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22.0),
              child: Image(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
                height: 130,
              ),
            ),
          ),


         Padding(
           padding: EdgeInsets.all(5),
         child:  Text(
           name,
           style: const TextStyle(
             color: Colors.black,
             fontSize: 18,
             fontFamily: 'Poppins',
             fontWeight: FontWeight.w600,
             height: 0,
             overflow: TextOverflow.ellipsis
           ),
         ),)
          
        ],
      ),
    );
  }
}
