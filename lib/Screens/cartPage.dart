import 'package:flutter/material.dart';
import 'package:krishisevakendra/features/BottomAppBar/bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flipkart Cart Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CartPage(),
    );
  }
}

class CartItem {
  final String title;
  final String seller;
  final double price;
  late int quantity;
  late String discountCoupon;
  late double discountAmount;

  CartItem({
    required this.title,
    required this.seller,
    required this.price,
    required this.quantity,
    this.discountCoupon = '',
    this.discountAmount = 0.0,
  });
}

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _selectedIndex = 0;
  List<CartItem> cartItems = [
    CartItem(
      title: 'Product Title 1',
      seller: 'ABC Seller',
      price: 20.0,
      quantity: 1,
    ),
    CartItem(
      title: 'Product Title 2',
      seller: 'XYZ Seller',
      price: 30.0,
      quantity: 1,
    ),
  ];

  String discountCoupon = '';
  double discountAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: const Color(0xff07833D),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildAddressContainer(),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return _buildCartItem(index, cartItems[index]);
              },
            ),
          ),
          _buildBottomAppBar(cartItems),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Implement logic to navigate or perform actions based on the selected index
  }

  Widget _buildAddressContainer() {
    return Material(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white, // Change address container background color
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Address:',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'XYZ Street, City, Country',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                // Change address logic
              },
              child: const Text(
                'Change',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(int index, CartItem item) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 2.0, // Add elevation to the card for a shadow effect
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    'assets/images/Product Image/Product.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Seller: ${item.seller}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Price: \$${item.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (cartItems[index].quantity > 1) {
                        cartItems[index].quantity--; // Decrease quantity
                      }
                    });
                  },
                ),
                Text('Quantity: ${item.quantity}'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      cartItems[index].quantity++; // Increase quantity
                    });
                  },
                ),
              ],
            ),
            if (item.discountAmount > 0)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Discounted Price: \$${(item.price * item.quantity - item.discountAmount).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Remove logic
                    removeItemFromCart(index);
                  },
                  child: const Text(
                    'Remove',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/orderSummary');
                    // Buy Now logic
                    // Implement the logic for buying the item immediately
                  },
                  child: const Text(
                    'Buy This Now',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceDetails(List<CartItem> cartItems) {
    double totalPrice = cartItems.fold(
        0, (total, item) => total + (item.price * item.quantity));

    double totalDiscount = cartItems.fold(
        0, (total, item) => total + item.discountAmount);

    double deliveryCharges = 0.0; // Assuming there are no delivery charges

    double totalAmount = totalPrice - totalDiscount + deliveryCharges;

    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Price Details',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _buildPriceDetail('Price', totalPrice),
            _buildPriceDetail('Discount', totalDiscount),
            _buildPriceDetail('Delivery Charges', deliveryCharges),
            const Divider(),
            _buildPriceDetail('Total Amount', totalAmount),
            const Divider(),
            _buildPriceDetail('You Saved', totalDiscount),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceDetail(String title, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            value == 0 ? 'Free' : '\$$value',
            style: TextStyle(
              color: value == 0 ? Colors.green : null,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAppBar(List<CartItem> cartItems) {
    double totalPrice = cartItems.fold(
        0, (total, item) => total + (item.price * item.quantity));

    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Implement checkout logic here
                // For example, navigate to the checkout screen
              },
              child: const Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }


  void removeItemFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }
}
