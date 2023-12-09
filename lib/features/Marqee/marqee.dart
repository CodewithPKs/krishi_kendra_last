import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class Marqee extends StatelessWidget {
  const Marqee({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 20,
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      child: Center(
        child: Marquee(
          text: 'BIG DHAMAKA SALE ON ALL PRODUCTS 🌟  ||  GET 5% OFF ON FIRST PRODUCT 💥 ||  ORDER NOW AVAIL DISCOUNT 🚚 ||',
          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800),
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center, // Center the text vertically
          blankSpace: 20.0,
          velocity: 50.0,
          startPadding: 10.0,
          accelerationDuration: const Duration(seconds: 1),
          accelerationCurve: Curves.linear,
          decelerationDuration: const Duration(milliseconds: 500),
          decelerationCurve: Curves.easeOut,
        ),
      ),
    );
  }
}
