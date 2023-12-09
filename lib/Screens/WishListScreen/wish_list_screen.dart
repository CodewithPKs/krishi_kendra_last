import 'package:flutter/material.dart';

class WishListItemsScreen extends StatefulWidget {
  final String title;
  final String imageSrc;
  final String price;
  final String coseAtPrice;
  const WishListItemsScreen({super.key, required this.imageSrc, required this.title, required this.price, required this.coseAtPrice});

  @override
  State<WishListItemsScreen> createState() => _WishListItemsScreenState();
}

class _WishListItemsScreenState extends State<WishListItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 246, 250, 1),
      body: Container(
        color: Colors.green,
        height: MediaQuery.of(context).size.height/6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(widget.imageSrc),
                ),
                SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                    Text(widget.coseAtPrice, ),
                    Text(widget.price),
                  ],
                )
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, ),
                onPressed: () {},
                child: Text('Buy Now', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
            )
          ],
        ),
      ),
    );
  }
}

// class WishListScreen extends StatefulWidget {
//   const WishListScreen({super.key});
//
//   @override
//   State<WishListScreen> createState() => _WishListScreenState();
// }
//
// class _WishListScreenState extends State<WishListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return const WishListItemsScreen();
//       },
//     );
//   }
// }
//
