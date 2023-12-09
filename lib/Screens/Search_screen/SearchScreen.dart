import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Widget buildElevatedButton(String text, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.grey, width: 0.5),
        padding: EdgeInsets.all(10),
      ),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.w400)),
    );
  }


  int _hintIndex = 0;
  List<String> _hintList = [
    'Search Products...',
    'Search Insecticides...',
    'Search Super Killers...'
  ]; // Add more hints as needed

  @override
  void initState() {
    super.initState();
    _startChangingHint();
  }

  void _startChangingHint() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _hintIndex = (_hintIndex + 1) % _hintList.length;
      });
    });
  }

  TextEditingController _searchController = TextEditingController();
  bool _isSearchBarVisible = true;
  List<Product> _searchResults = [];

  Future<void> _searchProducts(String query) async {
    try {
      Map<String, dynamic> searchData = await fetchProducts(query);
      setState(() {
        _isSearchBarVisible = false; // Hide SingleChildScrollView
        _searchResults = parseProducts(searchData);
      });
    } catch (error) {
      print('Error during search: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: const Color(0xff07833D),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 25),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              height: 45,
              child: TextField(
                controller: _searchController,
                cursorColor: Colors.orange,
                showCursor: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: _hintList[_hintIndex],
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search_sharp, color: Colors.grey),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _isSearchBarVisible = value.isEmpty;
                  });
                  _searchProducts(value);
                },
              ),
            ),
          ),
        ),
      ),
      body: _isSearchBarVisible
          ? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Recent Searches',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: screenWidth *
                            0.25, // Use a fraction of the screen width
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Popular Searches',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildElevatedButton('Fulvsfsfsic Acid', () {}),
                      SizedBox(width: 10),
                      buildElevatedButton('FulAcid', () {}),
                      SizedBox(width: 10),
                      buildElevatedButton('Fulvic Acid', () {}),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildElevatedButton('Fulvic Acid', () {}),
                      SizedBox(width: 10),
                      buildElevatedButton('FucsdSDSd Acid', () {}),
                      SizedBox(width: 10),
                      buildElevatedButton('Fulvic Acid', () {}),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      buildElevatedButton('Fulsssavic Acid', () {}),
                      SizedBox(width: 10),
                      buildElevatedButton('Ful Acid', () {}),
                      SizedBox(width: 10),
                      buildElevatedButton('Fulvic Acid', () {}),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'New Arrivals',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: screenWidth *
                            0.25, // Use a fraction of the screen width
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Trending',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: screenWidth *
                            0.25, // Use a fraction of the screen width
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ) :  ListView.builder(
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
      ) ,
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
      products(first: 20, query: "title: $search") {
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