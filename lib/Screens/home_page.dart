import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../List/HomePage Lists/cartegory_products.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  //=============== this all for the searching==========================//
  bool _isSearchBarVisible = false;
  bool _isSearchIconVisible = true;
  TextEditingController _searchController = TextEditingController();
  List<Product> _searchResults = [];

  Future<void> _searchProducts(String query) async {
    try {
      Map<String, dynamic> searchData = await fetchProducts(query);
      setState(() {
        _searchResults = parseProducts(searchData);
      });
    } catch (error) {
      print('Error during search: $error');
    }
  }
  //=====================================================================//

  //=========================this is for the best seller screen===========//
  Map<String, dynamic>? fetchData;

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    final data = await fetchCategory('your-search-keyword');
    setState(() {
      fetchData = data;
    });
  }
  //========================================================================//

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // If the search bar is visible, close it and prevent popping the route
        if (_isSearchBarVisible) {
          setState(() {
            _isSearchBarVisible = false;
            _searchController.clear();
          });
          return false;
        }

        // If the search bar is not visible, allow popping the route
        return true;
      },
        child: Scaffold(
            drawer: const Hamburger(),
            backgroundColor: const Color.fromRGBO(245, 246, 250, 1),
            appBar: AppBar(
              elevation: 8,
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.menu, size: 30, color: Colors.white), // Change the icon here
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
              title: Center(
                child: Image.asset(
                  'assets/Images/krishilogo.png',
                  width: 120,
                  height: 80,
                ),
              ),
              centerTitle: true,
              backgroundColor: const Color(0xff07833D),
              titleSpacing: 0.0, // Adjust this value as needed
              actions: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (_isSearchBarVisible) {
                        _isSearchBarVisible = false;
                        _searchController.clear();
                      } else {
                        _isSearchBarVisible = true;
                      }
                    });
                  },
                  child: SizedBox(
                    width: 30,
                    child: Icon(
                      _isSearchBarVisible ? Icons.close : Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    width: 50,
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              bottom:  PreferredSize(
                preferredSize: Size(50, _isSearchBarVisible ? 60 : 10),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: _isSearchBarVisible ? 60 : 0,
                    child: _isSearchBarVisible
                        ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                          ),
                          child: TextField(
                            controller: _searchController,
                            cursorColor: Colors.orange,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              hintText: 'Search for a product...',
                            ),
                            onChanged: (value) {
                              _searchProducts(value);
                            },
                          ),
                        ),
                      ),
                    )
                        : const SizedBox(),
                  ),
                ),
              ),
            ),
            body: _isSearchBarVisible
                ? ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index].title),
                  onTap: () {
                    // Handle suggestion tapped, e.g., navigate to product details
                    print('Selected Product: ${_searchResults[index].title}');
                  },
                );
              },
            )
                :  Column(
              children: [

                const Marqee(),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        //List viewBuilder that contains images and ViewAll button
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProductItem(
                                product: products[index],
                                isLastItem: index == products.length - 1,
                                onTap: () {
                                  // Navigate to the corresponding page based on the index
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => products[index]['category']),
                                  );
                                },
                              );
                            },
                          ),
                        ),


                        //Only For space
                        const SizedBox(
                          height: 5,
                        ),

                        //BestSeller text and viewAll button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'BestSeller',
                                style: TextStyle(
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
                                        builder: (context) => AllProductsPage(
                                          products: fetchData!['data']['collection']['products']['edges'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text('View all'),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Only For space
                        const SizedBox(
                          height: 15,
                        ),

                        //best seller section
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              if (fetchData != null && fetchData!['data'] != null)
                                for (var i = 0;
                                i < 2 &&
                                    i <
                                        fetchData!['data']['collection']['products']['edges']
                                            .length;
                                i++)
                                  ProductCard1(
                                    title: fetchData!['data']['collection']['products']['edges'][i]
                                    ['node']['title'],
                                    imageSrc: fetchData!['data']['collection']['products']['edges']
                                    [i]['node']['images']['edges'][0]['node']['src'],
                                  ),
                            ],
                          ),
                        ),

                        //Only For space
                        const SizedBox(
                          height: 15,
                        ),

                        // Banner Image Contains
                        Image.asset(
                          'assets/Images/banner_home_page.png',
                        ),

                        //new arrival and viewAll button txt
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'New Arrival',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text('View all'),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Only For space
                        const SizedBox(
                          height: 10,
                        ),

                        //New Arrival Product
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProductCard(),
                              ProductCard(),
                            ],
                          ),
                        ),

                        //Only For space
                        const SizedBox(
                          height: 20,
                        ),

                        // Second Banner Image
                        SizedBox(
                          width: double.infinity, // Set width to maximum
                          child: Image.asset(
                            'assets/Images/banner_2.png',
                            fit: BoxFit.cover,
                          ),
                        ),

                        //Only For space
                        const SizedBox(
                          height: 15,
                        ),

                        //Bio-Fertilizer and viewAll button txt
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Bio-Fertilizers',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text('View all'),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Only For space
                        const SizedBox(
                          height: 20,
                        ),

                        //Bio-Fertilizer section
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProductCard(),
                              ProductCard(),
                            ],
                          ),
                        ),

                        //Only For space
                        const SizedBox(
                          height: 15,
                        ),

                        //NPK - Fertilizer and viewAll button txt
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'NPK-Fertilizers',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text('View all'),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Only For space
                        const SizedBox(
                          height: 20,
                        ),

                        //NPK-Fertilizer section
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProductCard(),
                              ProductCard(),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            )
        ),);
  }
}

//To show the Items & viewAll in the horizontal listview
class ProductItem extends StatelessWidget {
  final Map<String, dynamic> product;
  final bool isLastItem;
  final VoidCallback onTap;

  const ProductItem(
      {Key? key,
        required this.product,
        required this.isLastItem,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110.0, // Adjust the width to fit your design
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                product['image'],
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class Product {
  final String title;

  Product({ required this.title});
}

Future<Map<String, dynamic>> fetchProducts(String search) async {
  final String apiKey = 'your-shopify-api-key';
  final String password = 'your-shopify-password';

  final url = 'https://3d6a19.myshopify.com/admin/api/2023-10/graphql.json';

  final String query = '''
    query {
      products(first: 10, query: "title: $search") {
        edges {
          node {
            id
            title
          }
        }
      }
    }
  ''';

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-Shopify-Access-Token': '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',
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode({'query': query}),
    );

    if (response.statusCode == 200) {
      // Parse and return the response data
      final data = json.decode(response.body);
      return data;
    } else {
      // Handle errors
      print('Error: ${response.statusCode}');
      print(response.body);
      throw Exception('Failed to fetch products');
    }
  } catch (error) {
    // Handle exceptions
    print('Exception: $error');
    throw Exception('Failed to fetch products');
  }
}

List<Product> parseProducts(Map<String, dynamic> data) {
  final List<Product> products = [];
  final List<dynamic> edges = data['data']['products']['edges'];

  for (var edge in edges) {
    final productNode = edge['node'];
    products.add(Product(
      title: productNode['title'],
    ));
  }

  return products;
}