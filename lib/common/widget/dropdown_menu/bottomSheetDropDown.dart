
import 'package:flutter/material.dart';

import '../../../Query_Cillection/BestSellerQuery/best_seller_query.dart';


class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {

  Map<String, dynamic>? fetchData;

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    final data = await fetchCategory('449900118312', 2, 1, 6);
    setState(() {
      fetchData = data;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //_buildProductInfo(),
          const Divider(height: 24, thickness: 1),
          const Text(
            'Choose a Size:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _buildOptionsList(context),
          ),
        ],
      ),
    );
  }


  Widget _buildOptionsList(BuildContext context) {
    if (fetchData == null || fetchData!['data'] == null) {
      return const SizedBox(); // Return an empty container or loading indicator
    }

    List<Map<String, dynamic>> products =
    List<Map<String, dynamic>>.from(fetchData!['data']['collection']['products']['edges']);

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        Map<String, dynamic> product = products[index]['node'];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildQuantityRow(product, index), // Pass the product index
              ],
            ),
            trailing: _buildAddToCartButton(),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }


  Widget _buildQuantityRow(Map<String, dynamic> product, int productIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildQuantityDescription(product, productIndex),
      ],
    );
  }

  Widget _buildQuantityDescription(Map<String, dynamic> product, int productIndex) {
    if (product['variants'] != null &&
        product['variants']['edges'] != null &&
        product['variants']['edges'].isNotEmpty) {
      List<Map<String, dynamic>> variants = (product['variants']['edges']as List).cast<Map<String, dynamic>>();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: variants.map((variant) {
          Map<String, dynamic> variantNode = variant['node'];
          String title = variantNode['title'].toString();
          return Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.grey,
            ),
          );
        }).toList(),
      );
    } else {
      return const SizedBox(); // Return an empty container if there are no variants
    }
  }




//   Widget _buildPriceInfoRow(Map<String, dynamic> product) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         _buildPriceText(product["price"], 20, Colors.green),
//         _buildPriceText(product["compareAtPrice"], 16, Colors.grey, [TextDecoration.lineThrough]),
//         //_buildDiscountContainer(_calculateDiscountPercentage(product)),
//       ],
//     );
//   }
//
//   Widget _buildPriceText(String text, double fontSize, Color color, [List<TextDecoration>? decorations]) {
//     return Row(
//       children: [
//         const SizedBox(width: 4),
//         Text(
//           text,
//           style: TextStyle(
//             fontSize: fontSize,
//             color: color,
//             decoration: decorations != null ? decorations[0] : null,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDiscountContainer(String text) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//       margin: const EdgeInsets.only(top: 4),
//       decoration: BoxDecoration(
//         color: Colors.red,
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//           fontSize: 10,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildQuantityDropdown() {
//     return Row(
//       children: [
//         const Text('Quantity: '),
//         DropdownButton<String>(
//           items: ['1', '2', '3', '4', '5'].map((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//           onChanged: (String? value) {
//             // Handle quantity selection
//           },
//           value: '1', // Set default value or quantity
//         ),
//       ],
//     );
//   }
//
  Widget _buildAddToCartButton() {
    return ElevatedButton(
      onPressed: () {
        // Implement 'Add to Cart' functionality
      },
      style: ElevatedButton.styleFrom(
        primary: const Color(0xff07833D),
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        'Add to Cart',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
//
//   double _calculateDiscountPercentage(Map<String, dynamic> product) {
//     double price = double.tryParse(product["price"]) ?? 0;
//     double compareAtPrice = double.tryParse(product["compareAtPrice"]) ?? 0;
//
//     double discountPercentage = ((compareAtPrice - price) / compareAtPrice) * 100;
//     return discountPercentage > 0 ? discountPercentage.roundToDouble() : 0;
//   }
// }
//
}