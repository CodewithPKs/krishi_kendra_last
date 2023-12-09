import 'package:flutter/material.dart';

import '../../../List/HomePage Lists/cartegory_products.dart';
import '../../../Query_Cillection/BestSellerQuery/best_seller_query.dart';
import '../../../common/widget/ProductCards/product_card.dart';
import '../../../common/widget/horizontal_scrollable_category/horizontal_scrollable_category.dart';
import '../../All_Product_Screen/all_product_screen.dart';
import '../Fertilizers/fertilizers_category_screen.dart';

class FungicidesCategoryScreen extends StatefulWidget {
  const FungicidesCategoryScreen({super.key});

  @override
  State<FungicidesCategoryScreen> createState() => _FungicidesCategoryScreenState();
}

class _FungicidesCategoryScreenState extends State<FungicidesCategoryScreen> {

  bool isLoading = true;

  //=========================Organic Fungicides===========//
  Map<String, dynamic>? organicFungicides;

  Future<void> fetchOrganic() async {
    final data = await fetchCategory('456494186792', 2, 6, 6);
    setState(() {
      organicFungicides = data;
      isLoading = false;
    });
  }

  //=====================Chemaical Fungicides==============================//

  Map<String, dynamic>? ChemicalFungcides;

  Future<void> fetchChemical() async {
    final data = await fetchCategory('468300955944', 2, 2, 2);
    setState(() {
      ChemicalFungcides = data;
      isLoading = false;
    });
  }

  //=======================Bio Fungicides================================//

  Map<String, dynamic>? BioFungicides;

  Future<void> fetchBio() async {
    final data = await fetchCategory('452268949800', 2, 6, 6);
    setState(() {
      BioFungicides = data;
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
      await fetchOrganic();
      await fetchChemical();
      await fetchBio();
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
                    offset: const Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(40), bottomLeft: Radius.circular(40)),
                color: Colors.white
            ),
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products[2]['sub-category'].length,
              itemBuilder: (context, index) {
                final subCategory = products[2]['sub-category'][index];
                return ProductItemFertilizerCategory(
                  product: products[2]['sub-category'][index],
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
                  CategorySection(title: 'Bio Fungicides', id: '452268949800', products: BioFungicides,),
                  CategorySection(title: 'Chemical Fungicides', id: '468300955944', products: ChemicalFungcides,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

