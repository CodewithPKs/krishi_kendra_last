
import 'package:flutter/material.dart';
class CropCards extends StatelessWidget {
  final String image;
  final String name;

  const CropCards({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
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
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage(image),
                // fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Text(
              name,
              style: const TextStyle(color: Colors.green, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
