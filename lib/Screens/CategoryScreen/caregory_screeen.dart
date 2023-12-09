import 'package:flutter/material.dart';

import '../../common/widget/horizontal_scrollable_category/ScrollableList/horizontal_list_view.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(245, 246, 250, 1),

        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              _buildCategoryStack('Fertilizers', Colors.white, 'right'),
              const SizedBox(height: 50),
              _buildCategoryStack('Insecticides', Colors.white, 'left'),
              const SizedBox(height: 50),
              _buildCategoryStack('Pesticides', Colors.white, 'right'),
              const SizedBox(height: 50),
              _buildCategoryStack('Herbicides', Colors.white, 'left'),
              const SizedBox(height: 50),
            ],
          ),
        ));
  }

  Widget _buildCategoryStack(String title, Color textColor, String alignment) {
    return Stack(
      clipBehavior: Clip.none, // This is crucial for overflow
      children: [
        Container(
          padding: EdgeInsets.all(30),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.green,
            // gradient: LinearGradient(
            //   begin: Alignment.topRight,
            //   end: Alignment.bottomLeft,
            //   colors: [
            //     Color.fromRGBO(63, 244, 81, 0.9),
            //     Color.fromRGBO(22, 160, 79, 0.9),
            //   ],
            // ),
            boxShadow: [
              BoxShadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Colors.black.withOpacity(0.5),
                  ),
            ],
          ),
          child: Row(
            mainAxisAlignment: alignment == 'right'
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 40,
                  height: 1.2,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius:10.0,  // shadow blur
                      color: Colors.black.withOpacity(0.5), // shadow color
                      offset: Offset(2.0,2.0), // how much shadow will be shown
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -120, // Adjust this value to control the overflow amount
          right: alignment == 'left' ? null : 10,
          left: alignment == 'left' ? 10 : null,
          child: Image.asset(
            'assets/Images/Catagory  Thumbnail (13).png',
            height: 300,
            width: 150,
          ),
        ),
      ],
    );
  }
}
