// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// class ListViweBuilder extends StatefulWidget {
//   const ListViweBuilder({super.key});
//
//   @override
//   State<ListViweBuilder> createState() => _ListViweBuilderState();
// }
//
// class _ListViweBuilderState extends State<ListViweBuilder> {
//
//   List product = [];
//   _initData() async {
//     await DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
//       setState(() {
//         product = json.decode(value);
//       });
//     });
//   }
//
//   @override
//   void initState(){
//     super.initState();
//     _initData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         child: OverflowBox(
//             maxWidth: MediaQuery.of(context).size.width,
//             child: MediaQuery.removePadding(
//               removeTop: true,
//               context: context,
//               child: ListView.builder(
//                   itemCount: product.length.toDouble()~/2,
//                   itemBuilder: (_, i){
//                     int a = 2*i;
//                     int b = 2*i +1;
//                     return Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.only(bottom: 5),
//                           margin: const EdgeInsets.only(left: 30, bottom: 15, top: 15),
//                           height: 170,
//                           width: (MediaQuery.of(context).size.width-90)/2,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(15),
//                               image: DecorationImage(
//                                   image: AssetImage(
//                                       product[a]['img']
//                                   )
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                     blurRadius: 3,
//                                     offset: const Offset(5, 5),
//                                     // color: AppColor.gradientSecond.withOpacity(0.1)
//                                 ),
//                                 BoxShadow(
//                                     blurRadius: 3,
//                                     offset: const Offset(-5, -5),
//                                     // color: AppColor.gradientSecond.withOpacity(0.1)
//                                 )
//                               ]
//                           ),
//                           child: Center(
//                               child: Align(
//                                 alignment: Alignment.bottomCenter,
//                                 child: Text(
//                                   product[a]['title'],
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       // color: AppColor.homePageDetail
//                                   ),
//                                 ),
//                               )
//                           ),
//                         ),
//                         Container(
//                           padding: const EdgeInsets.only(bottom: 5),
//                           margin: const EdgeInsets.only(left: 30, bottom: 15, top: 15),
//                           height: 170,
//                           width: (MediaQuery.of(context).size.width-90)/2,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(15),
//                               image: DecorationImage(
//                                   image: AssetImage(
//                                       product[b]['img']
//                                   )
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                     blurRadius: 3,
//                                     offset: const Offset(5, 5),
//                                     // color: AppColor.gradientSecond.withOpacity(0.1)
//                                 ),
//                                 BoxShadow(
//                                     blurRadius: 3,
//                                     offset: const Offset(-5, -5),
//                                     // color: AppColor.gradientSecond.withOpacity(0.1)
//                                 )
//                               ]
//                           ),
//                           child: Center(
//                               child: Align(
//                                 alignment: Alignment.bottomCenter,
//                                 child: Text(
//                                   product[b]['title'],
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                   ),
//                                 ),
//                               )
//                           ),
//                         ),
//                       ],
//                     );
//                   }
//               ),
//             )
//         )
//     );
//   }
// }
//
import 'dart:convert';

import 'package:flutter/material.dart';

class ListViweBuilder extends StatefulWidget {
  const ListViweBuilder({Key? key}) : super(key: key);

  @override
  State<ListViweBuilder> createState() => _ListViweBuilderState();
}

class _ListViweBuilderState extends State<ListViweBuilder> {
  List product = [];

  _initData() async {
    await DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        product = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: OverflowBox(
            maxWidth: MediaQuery.of(context).size.width,
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                  itemCount: product.length.toDouble()~/2,
                  itemBuilder: (_, i){
                    int a = 2*i;
                    int b = 2*i +1;
                    return Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          margin: const EdgeInsets.only(left: 30, bottom: 15, top: 15),
                          height: 170,
                          width: (MediaQuery.of(context).size.width-90)/2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(
                                      product[a]['img']
                                  )
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: const Offset(5, 5),
                                ),
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: const Offset(-5, -5),
                                )
                              ]
                          ),
                          child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  product[a]['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              )
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          margin: const EdgeInsets.only(left: 30, bottom: 15, top: 15),
                          height: 170,
                          width: (MediaQuery.of(context).size.width-90)/2,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(
                                      product[b]['img']
                                  )
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: const Offset(5, 5),
                                ),
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: const Offset(-5, -5),

                                )
                              ]
                          ),
                          child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  product[b]['title'],
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              )
                          ),
                        ),
                      ],
                    );
                  }
              ),
            )
        )
    );
  }
}




// import 'package:flutter/material.dart';
//
//
// class ProductCard extends StatelessWidget {
//   final Map<String, dynamic> product;
//
//   const ProductCard({
//     Key? key,
//     required this.product,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           AspectRatio(
//             aspectRatio: 1,
//             child: Image.asset(
//               product['image'],
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   product['name'],
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Text(product['price']),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
