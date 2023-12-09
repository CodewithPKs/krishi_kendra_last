import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:krishisevakendra/Screens/product_screen/productScreen.dart';

import '../../../Screens/WishListScreen/wish_list_screen.dart';

//==================================================================================================
class ProductCard extends StatefulWidget {
  final String id;
  final String title;
  final String imageSrc;
  final String price;
  final String costAtPrice;
  final String description;
  final List<String> images;
  final List<Map<String, dynamic>> variants;

  const ProductCard({
    Key? key,
    required this.id,
    required this.title,
    required this.imageSrc,
    required this.costAtPrice,
    required this.price,
    required this.images,
    required this.variants,
    required this.description,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCard1State();
}

class _ProductCard1State extends State<ProductCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductPage(
                price: widget.price,
                title: widget.title,
                costAtPrice: widget.costAtPrice,
                  images: widget.images,
                variants: widget.variants,
                description: widget.description,
                id: widget.id,
               ),
              ),
          ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        width: 170,
        decoration: _buildProductCardDecoration(),
        child: Column(
          children: [
            _buildProductCardTopRow(),
            _buildProductImage(),
            const SizedBox(height: 6),
            _buildProductDetails(),
            const SizedBox(
              height: 5,
            ),
            //const DropdownButtonWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildLikeButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 5,right: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            isLiked = !isLiked;
            WishListItemsScreen(
              imageSrc: widget.imageSrc,
              title: widget.title,
              price: widget.price,
              coseAtPrice: widget.costAtPrice,
            );
          });
        },
        child: Icon(
          Icons.favorite,
          color: isLiked ? Colors.red : Colors.grey,
        ),
      ),
    );
  }


  BoxDecoration _buildProductCardDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 3,
          offset: const Offset(2, 2),
        ),
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 3,
          offset: const Offset(-2, -2),
        ),
      ],
      borderRadius: BorderRadius.circular(22),
      color: Colors.white,
    );
  }

  Widget _buildProductCardTopRow() {
    double discountPercentage = _calculateDiscountPercentage();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDiscountContainer(discountPercentage),
        //_buildLikeButton(),
      ],
    );
  }

  Widget _buildDiscountContainer(double discountPercentage) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: 30,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        color: Color.fromRGBO(7, 131, 61, 1),
      ),
      child: Center(
        child: Text(
          '${discountPercentage.toStringAsFixed(0)}%',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Stack(children: [
      Container(
        margin: const EdgeInsets.only(top: 0),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.network(
          widget.imageSrc,
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(30),
                color: Colors.white70.withOpacity(0.9),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 1,
                      offset: Offset(2, 2),
                      color: Colors.grey),
                ]),
            child: const Row(
              children: [
                Icon(
                  Iconsax.star1,
                  color: Colors.orange,
                ),
                Text(
                  "4.5",
                  style: TextStyle(color: Color(0xff07833D)),
                )
              ],
            ),
          )),
    ]);
  }

  Widget _buildProductTitle() {
    return Text(
      widget.title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontFamily: 'Poppins',
        height: 0,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.left,
    );
  }

  Widget _buildProductDetails() {
    int savedAmount = _calculateSavedAmount().round();
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductTitle(),
          const SizedBox(height: 2),
          _buildProductPrices(),
          _buildSavedPrice(savedAmount),
        ],
      ),
    );
  }

  Widget _buildProductPrices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.price,
              style: Theme.of(context).textTheme.subtitle1!.apply(
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
            const SizedBox(width: 8),
            Text(
              widget.costAtPrice,
              style: Theme.of(context).textTheme.subtitle1!.apply(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSavedPrice(int savedAmount) {
    return savedAmount > 0
        ? Row(
      children: [
        const Image(
          image: AssetImage('assets/Images/Discount.png'),
          width: 25,
          height: 25,
        ),
        Text(
          'Saved Price ₹$savedAmount',
          style: TextStyle(color: Colors.red, fontSize: 12),
        ),
      ],
    )
        : Container(); // If savedAmount is not greater than 0, return an empty container
  }

  double _calculateSavedAmount() {
    double price = double.tryParse(widget.price) ?? 0;
    double costAtPrice = double.tryParse(widget.costAtPrice) ?? 0;

    // Calculate saved amount
    double savedAmount = costAtPrice - price;

    // Ensure the saved amount is non-negative
    return savedAmount > 0 ? savedAmount : 0;
  }

  double _calculateDiscountPercentage() {
    double price = double.tryParse(widget.price) ?? 0;
    double costAtPrice = double.tryParse(widget.costAtPrice) ?? 0;

    double savedAmount = costAtPrice - price;

    // Ensure the saved amount is non-negative
    return (savedAmount > 0) ? (savedAmount / costAtPrice) * 100 : 0;
  }
}

//=============================================================================================

class VariantDropdown extends StatefulWidget {
  final List<Map<String, dynamic>> variants;
  final Function(String) onChanged;

  const VariantDropdown({
    Key? key,
    required this.variants,
    required this.onChanged,
  }) : super(key: key);

  @override
  _VariantDropdownState createState() => _VariantDropdownState();
}

class _VariantDropdownState extends State<VariantDropdown> {
  late String selectedVariant;

  @override
  void initState() {
    super.initState();
    // Initialize with the first variant
    selectedVariant = widget.variants[0]['title'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DropdownButtonFormField<String>(
          dropdownColor: Colors.green,
          style: TextStyle(color: Colors.white),
          value: selectedVariant,
          onChanged: (String? newValue) {
            setState(() {
              selectedVariant = newValue!;
              widget.onChanged(selectedVariant);
            });
          },
          items: widget.variants
              .map<DropdownMenuItem<String>>((Map<String, dynamic> variant) {
            return DropdownMenuItem<String>(
              value: variant['title'],
              child: Text(
                variant['title'],
                style: TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
