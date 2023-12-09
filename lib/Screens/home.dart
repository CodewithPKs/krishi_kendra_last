import 'package:flutter/material.dart';
import '../Query_Cillection/BestSellerQuery/best_seller_query.dart';
import '../common/widget/ProductCards/product_card.dart';
import '../common/widget/horizontal_scrollable_category/ScrollableList/horizontal_list_view.dart';
import 'All_Product_Screen/all_product_screen.dart';
import 'Category_screens/Fertilizers/fertilizers_category_screen.dart';

class HomeScreenBucket extends PageStorageBucket {
  // Define variables or data you want to persist here
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  final PageStorageBucket bucket = HomeScreenBucket();
  bool isLoading = true;
  Map<String, dynamic>? fetchData;
  Map<String, dynamic>? newArrival;
  Map<String, dynamic>? fertilizers;
  Map<String, dynamic>? Insecticides;
  Map<String, dynamic>? herbicides;
  Map<String, dynamic>? fungicides;
  Map<String, dynamic>? superSever;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    try {
      await Future.wait([
        fetchCategory('449900118312', 2, 6, 6).then((data) => fetchData = data),
        fetchCategory('466261311784', 2, 6, 6).then((data) => newArrival = data),
        fetchCategory('452266950952', 2, 6, 6).then((data) => fertilizers = data),
        fetchCategory('456492089640', 2, 6, 6).then((data) => Insecticides = data),
        fetchCategory('452259021096', 2, 6, 6).then((data) => herbicides = data),
        fetchCategory('456494317864', 2, 6, 6).then((data) => fungicides = data),
        fetchCategory('457815327016', 2, 6, 6).then((data) => superSever = data),
      ]);

      setState(() {
        isLoading = false;
      });
    } catch (error) {
      // Handle the error (e.g., show an error message)
      print("Error fetching data: $error");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PageStorage(
      bucket: bucket,
      key: const PageStorageKey('homeScreen'),
      child: Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HorizontalListView(),

                    CategorySection(title: 'Best Seller', id: '449900118312', products: fetchData),
                    CategorySection(title: 'New Arrival', id: '466261311784', products: newArrival),
                    CategorySection(title: 'Fertilizer', id: '452266950952', products: fertilizers),
                    CategorySection(title: 'Insecticides', id: '456492089640', products: Insecticides),
                    CategorySection(title: 'Herbicides', id: '452259021096', products: herbicides),
                    CategorySection(title: 'Fungicides', id: '456494317864', products: fungicides),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

