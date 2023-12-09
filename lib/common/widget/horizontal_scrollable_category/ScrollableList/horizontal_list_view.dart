import 'package:flutter/material.dart';

import '../../../../List/HomePage Lists/cartegory_products.dart';
import '../horizontal_scrollable_category.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/7.5,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductItemCategory(
            product: products[index],
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
    );
  }
}