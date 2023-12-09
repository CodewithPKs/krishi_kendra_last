import 'package:flutter/material.dart';
import '../../../List/HomePage Lists/cartegory_products.dart';
import '../../../Query_Cillection/BestSellerQuery/best_seller_query.dart';
import '../../../common/widget/ProductCards/product_card.dart';
import '../../../common/widget/horizontal_scrollable_category/horizontal_scrollable_category.dart';
import '../../All_Product_Screen/all_product_screen.dart';

class FertilizersCategoryScreen extends StatefulWidget {
  const FertilizersCategoryScreen({super.key});

  @override
  State<FertilizersCategoryScreen> createState() =>
      _FertilizersCategoryScreenState();
}

class _FertilizersCategoryScreenState extends State<FertilizersCategoryScreen> {
  bool isLoading = true;

  //=========================this is for the OrganicFertilizers===========//
  Map<String, dynamic>? OrganicFertilizers;

  Future<void> fetchorganic() async {
    final data = await fetchCategory('452259086632', 2, 6, 6);
    setState(() {
      OrganicFertilizers = data;
      isLoading = false;
    });
  }
  //=====================Organic Fertilizers==============================//

  Map<String, dynamic>? NPKFertilizers;

  Future<void> fetchNPK() async {
    final data = await fetchCategory('452267147560', 2, 6, 6);
    setState(() {
      NPKFertilizers = data;
      isLoading = false;
    });
  }
  //=======================Plant Growth regulator================================//

  Map<String, dynamic>? plantGrowth;

  Future<void> fetchPlantGrowth() async {
    final data = await fetchCategory('456490844456', 2, 6, 6);
    setState(() {
      plantGrowth = data;
      isLoading = false;
    });
  }
  //=======================Bio fertlizers================================//

  Map<String, dynamic>? bioFertilizers;

  Future<void> fetchBio() async {
    final data = await fetchCategory('456491073832', 2, 6, 6);
    setState(() {
      bioFertilizers = data;
      isLoading = false;
    });
  }
  //=======================Hypo================================//

  Map<String, dynamic>? Hydroponics;

  Future<void> fetchhydroponics() async {
    final data = await fetchCategory('456491401512', 2, 6, 6);
    setState(() {
      Hydroponics = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      await fetchorganic();
      await fetchNPK();
      await fetchPlantGrowth();
      await fetchBio();
      await fetchhydroponics();
    } catch (error) {
      // Handle the error (e.g., show an error message)
      print("Error fetching data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 246, 250, 1),
      appBar: AppBar(
          surfaceTintColor: Colors.transparent,
        title: Text('categoryes'),
        backgroundColor: Colors.white,
      ),
      body: isLoading
          ? const Center(
            child: CircularProgressIndicator(),
      )
          : Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40)),
              color: Colors.white
            ),
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products[0]['sub-category'].length,
              itemBuilder: (context, index) {
                final subCategory = products[0]['sub-category'][index];
                return ProductItemFertilizerCategory(
                  product: products[0]['sub-category'][index],
                  onTap: () {
                    if (subCategory['id'] != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AllProductScreen(id: subCategory['id'].toString()),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CategorySection(title: 'Organic Fertilizers', id: '452259086632', products: OrganicFertilizers,),
                  CategorySection(title: 'NPK-Fertilizers', id: '452267147560', products: NPKFertilizers,),
                  CategorySection(title: 'Plant Growth', id: '456490844456', products: plantGrowth,),
                  CategorySection(title: 'Bio Fertilizers', id: '456491073832', products: bioFertilizers,),
                  CategorySection(title: 'Hydroponics', id: '456491401512', products: Hydroponics,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection({
    Key? key,
    required this.title,
    required this.id,
    required this.products,
  }) : super(key: key);

  final String title;
  final String id;
  final Map<String, dynamic>? products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllProductScreen(id: id),
                      ),
                    );
                  },
                  child: const Text('View all'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildProductCards(products),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildProductCards(Map<String, dynamic>? products) {
    final List<Widget> cards = [];
    if (products != null && products['data'] != null) {
      for (var i = 0; i < 2 && i < products['data']['collection']['products']['edges'].length; i++) {
        cards.add(
          ProductCard(
            id:  products['data']['collection']['products']['edges'][i]['node']['id'],
            title: products['data']['collection']['products']['edges'][i]['node']['title'],
            imageSrc: products['data']['collection']['products']['edges'][i]['node']['images']['edges'][0]['node']['src'],
            price: products['data']['collection']['products']['edges'][i]['node']['variants']['edges'][i]['node']['price'],
            costAtPrice: products['data']['collection']['products']['edges'][i]['node']['variants']['edges'][i]['node']['compareAtPrice'],
            images: products['data']['collection']['products']['edges'][i]['node']['images']['edges']
                .map<String>((image) => image['node']['src'].toString())
                .toList(),
            variants: products['data']['collection']['products']['edges'][i]['node']['variants']['edges']
                .map<Map<String, dynamic>>((variant) {
              return {
                'title': variant['node']['title'],
                'price': variant['node']['price'],
                'compareAtPrice': variant['node']['compareAtPrice'],
                'id': variant['node']['id'],
              };
            }).toList(),
            description: products['data']['collection']['products']['edges'][i]['node']['description'],
          ),
        );
      }
    }
    return cards;
  }
}


// Widget _buildProductCard(int index, Map<String, dynamic>? products) {
//   if (products != null &&
//       products['data'] != null &&
//       index < products['data']['collection']['products']['edges'].length) {
//     return ProductCard(
//       id: products['data']['collection']['products']['edges'][index]['node']['id'],
//       title: products['data']['collection']['products']['edges'][index]['node']['title'],
//       imageSrc: products['data']['collection']['products']['edges'][index]['node']['images']['edges'][0]['node']['src'],
//       price: products['data']['collection']['products']['edges'][index]['node']['variants']['edges'][0]['node']['price'],
//       costAtPrice: products['data']['collection']['products']['edges'][index]['node']['variants']['edges'][index]['node']['compareAtPrice'],
//       images: products['data']['collection']['products']['edges'][index]['node']['images']['edges']
//           .map<String>((image) => image['node']['src'].toString())
//           .toList(),
//       variants: products['data']['collection']['products']['edges'][index]['node']['variants']['edges']
//           .map<Map<String, dynamic>>((variant) {
//         return {
//           'title': variant['node']['title'],
//           'price': variant['node']['price'],
//           'compareAtPrice': variant['node']['compareAtPrice'],
//           'id': variant['node']['id'],
//         };
//       }).toList(),
//       description: products['data']['collection']['products']['edges'][index]['node']['description'],
//     );
//   }
//   // You can return an empty container or a placeholder widget if needed
//   return Container();
// }

// 'id': variant['node']['id']