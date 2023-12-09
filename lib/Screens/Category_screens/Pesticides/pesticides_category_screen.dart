import 'package:flutter/material.dart';
import '../../../List/HomePage Lists/cartegory_products.dart';
import '../../../Query_Cillection/BestSellerQuery/best_seller_query.dart';
import '../../../common/widget/ProductCards/product_card.dart';
import '../../../common/widget/horizontal_scrollable_category/horizontal_scrollable_category.dart';
import '../../All_Product_Screen/all_product_screen.dart';
import '../Fertilizers/fertilizers_category_screen.dart';

class PesticidesCategoryScreen extends StatefulWidget {
  const PesticidesCategoryScreen({super.key});

  @override
  State<PesticidesCategoryScreen> createState() =>
      _PesticidesCategoryScreenState();
}

class _PesticidesCategoryScreenState extends State<PesticidesCategoryScreen> {
  bool isLoading = true;

  //=========================this is for the Pesticides===========//
  Map<String, dynamic>? Pesticides;

  Future<void> fetchPesticides() async {
    final data = await fetchCategory('456492089640', 2, 6, 6);
    setState(() {
      Pesticides = data;
      isLoading = false;
    });
  }
  //=====================Chemaical Insecticides==============================//

  Map<String, dynamic>? ChemicalInsecticides;

  Future<void> fetchChemical() async {
    final data = await fetchCategory('466308530472', 2, 2, 2);
    setState(() {
      ChemicalInsecticides = data;
      isLoading = false;
    });
  }

  //=======================Organic Pest Controll================================//

  Map<String, dynamic>? OrganicPest;

  Future<void> fetchOrganicPest() async {
    final data = await fetchCategory('456493007144', 2, 6, 6);
    setState(() {
      OrganicPest = data;
      isLoading = false;
    });
  }

  //=======================Bio fertlizers================================//

  Map<String, dynamic>? bioPesticides;

  Future<void> fetchBio() async {
    final data = await fetchCategory('456493302056', 2, 6, 6);
    setState(() {
      bioPesticides = data;
      isLoading = false;
    });
  }
  //=======================Hypo================================//

  Map<String, dynamic>? trapslurs;

  Future<void> fetchhTraps() async {
    final data = await fetchCategory('456493826344', 2, 6, 6);
    setState(() {
      trapslurs = data;
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
      await fetchPesticides();
      await fetchChemical();
      await fetchOrganicPest();
      await fetchBio();
      await fetchhTraps();
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
              itemCount: products[1]['sub-category'].length,
              itemBuilder: (context, index) {
                final subCategory = products[1]['sub-category'][index];
                return ProductItemFertilizerCategory(
                  product: products[1]['sub-category'][index],
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
                  //CategorySection(title: 'Pesticides ', id: '456492089640', products: Pesticides,),
                  CategorySection(title: 'Chemical Ins..', id: '466308530472', products: ChemicalInsecticides,),
                  CategorySection(title: 'Organic Pest', id: '456493007144', products: OrganicPest,),
                  CategorySection(title: 'Bio Pesticides', id: '456493302056', products: bioPesticides,),
                  CategorySection(title: 'Traps & Lurs', id: '456493826344', products: trapslurs,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

