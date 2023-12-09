import 'package:flutter/material.dart';

import '../../Query_Cillection/BestSellerQuery/best_seller_query.dart';
import '../../common/widget/ProductCards/product_card.dart';

class AllProductScreen extends StatefulWidget {
  final String id;
  const AllProductScreen({required this.id});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  late Future<Map<String, dynamic>> fetchData;

  @override
  void initState() {
    super.initState();
    fetchData = fetchCategory(widget.id,30, 10, 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: FutureBuilder(
        future: fetchData,
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while the data is being fetched.
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Show an error message if there was an error fetching the data.
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Display the data once it's fetched.
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                mainAxisExtent: 300,
              ),
              itemCount: snapshot.data?['data']['collection']['products']['edges'].length,
              itemBuilder: (context, index) {
                return ProductCard(
                  id: snapshot.data!['data']['collection']['products']['edges'][index]['node']['id'],
                  title: snapshot.data!['data']['collection']['products']['edges'][index]['node']['title'],
                  imageSrc: snapshot.data!['data']['collection']['products']['edges'][index]['node']['images']['edges'][0]['node']['src'],
                  price: snapshot.data!['data']['collection']['products']['edges'][index]['node']['variants']['edges'][0]['node']['price'],
                  costAtPrice: snapshot.data!['data']['collection']['products']['edges'][index]['node']['variants']['edges'][0]['node']['compareAtPrice'],
                  images: snapshot.data?['data']['collection']['products']['edges'][index]['node']['images']['edges'].map<String>(
                        (image) => image['node']['src'].toString(),
                  ).toList(),
                  variants: snapshot.data!['data']['collection']['products']['edges'][index]['node']['variants']['edges'].map<Map<String, dynamic>>(
                        (variant) {
                      return {
                        'title': variant['node']['title'],
                        'price': variant['node']['price'],
                        'compareAtPrice': variant['node']['compareAtPrice'],
                        'id': variant['node']['id'],
                      };
                    },
                  ).toList(),

                  description: snapshot.data!['data']['collection']['products']['edges'][index]['node']['description'],
                );
              },
            );
          }
        },
      ),
    );
  }
}
