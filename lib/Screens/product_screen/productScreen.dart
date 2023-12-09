import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;


class ProductPage extends StatefulWidget {
  final String id;
  final String title;
  final String price;
  final String costAtPrice;
  final List<String> images;
  final List<Map<String, dynamic>> variants;
  final String description;

  const ProductPage({Key? key,
    required this.id,
    required this.price,
    required this.title,
    required this.costAtPrice,
    required this.images,
    required this.variants,
    required this.description,
  }) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  bool showFullDescription = true;

  late String selectedVariantTitle;
  late String selectedVariantPrice;
  late String selectedVariantCostAtPrice;

  Map<String, bool> isButtonClickedMap = {};

  int _currentCarouselIndex = 0;
  int quantity=1;

  Map<String, dynamic>? fetchData;

  List<bool> isButtonClickedList = [];

  List<String> images = [];

  late String selectedVariantId;

  void _onVariantButtonTap(Map<String, dynamic> variant) {
    setState(() {
      // Deselect all buttons
      isButtonClickedMap.forEach((key, value) {
        isButtonClickedMap[key] = false;
      });

      // Select the tapped button
      isButtonClickedMap[variant['title']] = true;

      // Update the selected variant information
      selectedVariantTitle = variant['title'];
      selectedVariantPrice = variant['price'];
      selectedVariantCostAtPrice = variant['compareAtPrice'];
      selectedVariantId = variant['id']; // Store the selected variant id
    });
  }


  void _showReviewDialog(BuildContext context) {
    // Add your logic to show the review dialog
    // For example, you can use showDialog widget
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Write Your Review'),
          content: Text('Your review form goes here'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
    // Initialize with the first variant
    selectedVariantTitle = widget.variants[0]['title'];
    selectedVariantPrice = widget.variants[0]['price'];
    selectedVariantCostAtPrice = widget.variants[0]['compareAtPrice'];
    selectedVariantId = widget.variants[0]['id']; // Initialize the selected variant id

    // Initialize the isButtonClickedMap
    widget.variants.forEach((variant) {
      isButtonClickedMap[variant['title']] = false;
    });

    isButtonClickedMap[selectedVariantTitle] = true;
  }

  Future<void> fetchDataFromApi() async {
    // Use widget.images instead of fetching from API
    setState(() {
      images = widget.images;
    });
  }

  @override
  Widget build(BuildContext context) {

     return Scaffold(
      appBar: AppBar(
        title: const Text('Product page'),
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            CarouselSlider(
              options: CarouselOptions(
                height: 400,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentCarouselIndex = index;
                  });
                },
              ),
              items: images.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(
                      imagePath,
                    );
                  },
                );
              }).toList(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 2.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentCarouselIndex == index
                        ? Colors.blue
                        : Colors.grey,
                  ),
                );
               },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  // Title of Product
                   Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  //Tag of Company
                  const Text(
                    'Katyayani Organics',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 16),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(
                          5,
                              (index) => const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 20,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _showReviewDialog(context);
                        },
                        child: const Text(
                          'Write your review',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff07833D), // Set custom color using hexadecimal notation
                            fontWeight: FontWeight.bold, // Making the text bold
                            decoration: TextDecoration.none, // Remove underline
                          ),
                        ),
                      ),
                    ],
                  ),


                  const SizedBox(height: 16),

                  // contain the price of product
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'MRP',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            selectedVariantCostAtPrice, // Replace with actual MRP
                            style: const TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '₹ $selectedVariantPrice', // Replace with actual price
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          '${_calculateDiscountPercentage().toStringAsFixed(0)}% OFF',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // Action to decrease quantity by 1
                                    // Replace the 'quantity' variable with your own state variable for quantity
                                    if (quantity > 1) {
                                      quantity--;
                                    }
                                  });
                                },
                                child: const Icon(Icons.remove,
                                  color: Color(0xff07833D),),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 12),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  '$quantity', // Replace with your state variable for quantity
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff07833D),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // Action to increase quantity by 1
                                    // Replace the 'quantity' variable with your own state variable for quantity
                                    quantity++;
                                  });
                                },
                                child: const Icon(Icons.add,
                                  color: Color(0xff07833D),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  const Divider(),

                  // button that contain the variants of product
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          widget.variants.length,
                              (index) {
                            final variant = widget.variants[index];
                            final title = variant['title'].toString() ?? '';
                            final trimmedTitle = title.replaceAll(RegExp(r''), '').trim();

                            return GestureDetector(
                              onTap: () {
                                _onVariantButtonTap(variant);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 10, right: 10),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: isButtonClickedMap[variant['title']] == true ? Colors.green : null,
                                  ),
                                  onPressed: () {
                                    _onVariantButtonTap(variant);
                                  },
                                  child: Text(
                                    trimmedTitle,
                                    style: TextStyle(
                                      color: isButtonClickedMap[variant['title']] == true ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  const Divider(),

                  //Description Section of Product
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        // Product description section
                        const SizedBox(height: 16),

                        const Text(
                          'Product Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          widget.description,
                          maxLines: showFullDescription ? null : widget.description.length,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16),
                        ),

                        const SizedBox(height: 8),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showFullDescription = !showFullDescription;
                            });
                          },

                          child: Text(
                            showFullDescription ? 'Show More' : 'Show less',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ),

                ],
              ),
            ),

              ],
            ),
          ),
        ]
       )
      ),

       floatingActionButton: FloatingActionButton(
         onPressed: () {
           // Handle button click
           buyNow();
           printProductInformation();
         },
         child: Icon(Icons.shopping_cart),
         backgroundColor: Colors.green,
       ),

       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }

  void buyNow() async {
    // Create order data
    Map<String, dynamic> orderData = {
      'order': {
        'line_items': [
          {
           'title': widget.title,
            'price': widget.price// Add the quantity if needed
          },
        ],
      },
    };

    // Make the HTTP request to create the order
    http.Response orderResponse = await http.post(
      Uri.parse('https://3d6a19.myshopify.com/admin/api/2023-04/orders.json'),
      headers: {
        'Content-Type': 'application/json',
        'X-Shopify-Access-Token': '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',
      },
      body: jsonEncode(orderData),
    );

    if (orderResponse.statusCode == 201) {
      // Order created successfully
      Map<String, dynamic> orderResponseBody = jsonDecode(orderResponse.body);
      int orderId = orderResponseBody['order']['id'];
      print('Order created successfully. Order ID: $orderId');

      // Add a note to the order
      Map<String, dynamic> noteData = {
        'note': 'Your order is being processed.', // Provide your note text
      };

      http.Response noteResponse = await http.post(
        Uri.parse('https://3d6a19.myshopify.com/admin/api/2023-04/orders/$orderId/notes.json'),
        headers: {
          'Content-Type': 'application/json',
          'X-Shopify-Access-Token': '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',
        },
        body: jsonEncode(noteData),
      );

      if (noteResponse.statusCode == 201) {
        // Note added successfully
        print('Note added to the order successfully.');
      } else {
        // Handle note addition error
        print('Error adding note: ${noteResponse.statusCode}');
      }
    } else {
      // Handle order creation error
      print('Error creating order: ${orderResponse.body}');
    }
  }





  void printProductInformation() {
    // Print product information
    print('Title: ${widget.title}');
    print('Price: ${selectedVariantPrice}');
    print('Total Price: ${calculateTotalPrice()}');
    print('id: ${widget.id}');
  }

  double calculateTotalPrice() {
    // Add your logic to calculate the total price
    return quantity * double.parse(selectedVariantPrice);
  }

  // Handle tap event for variant buttons
  // void _onVariantButtonTap(Map<String, dynamic> variant) {
  //   setState(() {
  //     selectedVariantTitle = variant['title'];
  //     selectedVariantPrice = variant['price'];
  //     selectedVariantCostAtPrice = variant['compareAtPrice'];
  //
  //     // Update the clicked state for the tapped variant button
  //     isButtonClickedMap[variant['title']] = true;
  //
  //     // Reset the clicked state for other variant buttons
  //     widget.variants.forEach((otherVariant) {
  //       if (otherVariant['title'] != variant['title']) {
  //         isButtonClickedMap[otherVariant['title']] = false;
  //       }
  //     });
  //   });
  // }


  double _calculateDiscountPercentage() {
    double price = double.tryParse(selectedVariantPrice) ?? 0;
    double costAtPrice = double.tryParse(selectedVariantCostAtPrice) ?? 0;

    double savedAmount = costAtPrice - price;

    // Ensure the saved amount is non-negative
    return (savedAmount > 0) ? (savedAmount / costAtPrice) * 100 : 0;
  }

}


void _showReviewDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String name = '';
      String email = '';
      String feedback = '';

      return AlertDialog(
        title: const Text('Write your review'),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              const SizedBox(height: 8),
              TextField(
                decoration: const InputDecoration(labelText: 'Email Address'),
                onChanged: (value) {
                  email = value;
                },
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Feedback'),
                onChanged: (value) {
                  feedback = value;
                },
              ),
              const SizedBox(height: 16),
              // ElevatedButton(
              //   onPressed: () async {
              //     // Get a reference to the Firestore database
              //     final FirebaseFirestore _firestore = FirebaseFirestore.instance;
              //
              //     // Create a new document in the 'reviews' collection
              //     await _firestore.collection('reviews').add({
              //       'name': name,
              //       'email': email,
              //       'feedback': feedback,
              //       'timestamp': FieldValue.serverTimestamp(),
              //     });
              //
              //     Navigator.of(context).pop(); // Close the dialog
              //   },
              //   child: const Text('Submit'),
              // ),
            ],
          ),
        ),
      );
    },
  );
}

Widget buildWeightButton(String weight, {required bool selected, required VoidCallback onSelected}) {
  return SizedBox(
    width: 100,
    height: 40,
    child: ElevatedButton(
      onPressed: onSelected,
      style: ButtonStyle(
        backgroundColor: selected
            ? MaterialStateProperty.all<Color>(const Color(0xff07833D))
            : MaterialStateProperty.all<Color>(Colors.white70),
        //side: MaterialStateProperty.all<BorderSide>(
        // BorderSide(
        //   color: selected ? const Color(0xff07833D): Colors.white70,
        // ),
        //),
      ),
      child: Text(
        weight,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}


class SimilarProductsCarousel extends StatelessWidget {
  const SimilarProductsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240, // Adjusted height to accommodate for padding and button
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Change this to the number of similar products
        itemBuilder: (BuildContext context, int index) {
          // Simulated product data for demonstration purposes
          final String productName = 'Product $index'; // Replace with actual product name
          final double productPrice = 99.99; // Replace with actual product price

          return SizedBox(
            width: 150, // Adjusted width for each product card
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/Product Image/Product.png', // Replace with your image URL

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '₹$productPrice', // Display product price
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 2),
                        ElevatedButton(
                          onPressed: () {
                            // Add to cart action
                            // Implement your logic here to add the product to the cart
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff07833D)),
                          ),
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FrequentlyBoughtProducts extends StatelessWidget {
  const FrequentlyBoughtProducts({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulated frequently bought products data for demonstration purposes
    final List<Map<String, dynamic>> frequentlyBoughtProducts = [
      {
        'name': 'Product 1',
        'price': 49.99,
        'image': 'assets/images/product1.png', // Replace with your image URL
      },
      {
        'name': 'Product 2',
        'price': 79.99,
        'image': 'assets/images/product2.png', // Replace with your image URL
      },
      {
        'name': 'Product 3',
        'price': 99.99,
        'image': 'assets/images/product3.png', // Replace with your image URL
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Frequently Bought Together:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 125,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: frequentlyBoughtProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = frequentlyBoughtProducts[index];
                    final String productName = product['name'] as String;
                    final String productImage = product['image'] as String;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset(
                              //productImage,
                                "assets/images/Product Image/Product.png"
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            productName,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add all three products to cart
                for (final product in frequentlyBoughtProducts) {
                  // Implement your logic here to add each product to the cart
                  // Example: addToCart(product['name'], product['price']);
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff07833D)),
              ),
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DeliveryTable extends StatelessWidget {
  const DeliveryTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Delivery and Shipping:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Table(
            border: TableBorder.all(color: Colors.grey),
            children: const [
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Location',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Delivery Time',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('City'),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('4-5 Days'),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Village'),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('7-8 Days'),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Free Delivery'),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Available'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}