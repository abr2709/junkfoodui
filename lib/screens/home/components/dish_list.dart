import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:junk_food/screens/home/components/dish_card.dart';
import 'package:flutter_cart/flutter_cart.dart';

import '../../../constants.dart';

class DishList extends StatelessWidget {
  final Stream<QuerySnapshot> dataStream =
      FirebaseFirestore.instance.collection("dishes").snapshots();

  DishList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Popular Dishes",
            style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
          ),
          ViewDishes(),
        ],
      ),
    );
  }

  ViewDishes() {
    return StreamBuilder<QuerySnapshot>(
        stream: dataStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List docs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map map = document.data() as Map<String, dynamic>;
            docs.add(map);
          }).toList();
          return Column(
            children: List.generate(
                docs.length,
                (i) => Column(
                      children: [
                        DishCard(
                            press: () {}, // Add Func Later
                            dishName: docs[i]['dishName'],
                            dishImage: docs[i]['dishImage'],
                            dishRating: docs[i]['dishRating'],
                            dishPrice: docs[i]['dishPrice'])
                      ],
                    )),
          );
        });
  }
}
