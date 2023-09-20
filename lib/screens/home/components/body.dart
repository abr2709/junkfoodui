import 'package:flutter/material.dart';
import 'package:junk_food/components/search_box.dart';
import 'package:junk_food/screens/home/components/discount_card.dart';
import 'package:junk_food/screens/home/components/dish_list.dart';
import 'package:junk_food/screens/home/components/item_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBox(
            onChanged: (value) {},
          ),
          // CategoryList(),
          ItemList(),
          DiscountCard(),
          DishList()
        ],
      ),
    );
  }
}
