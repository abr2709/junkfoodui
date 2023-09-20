import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:junk_food/constants.dart';
import 'package:junk_food/screens/checkout.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class DishCard extends StatelessWidget {
  final String dishName, dishImage;
  double dishPrice, dishRating;
  final Function press;
  final db = FirebaseFirestore.instance;

  DishCard({
    Key? key,
    required this.press,
    required this.dishName,
    required this.dishImage,
    required this.dishRating,
    required this.dishPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = FlutterCart();
    // print(dishImage);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Checkout(price: cart.getTotalAmount().toString())));
          cart.addToCart(productId: dishName, unitPrice: dishPrice);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(dishName + " added to cart."),
              duration: const Duration(seconds: 1),
            ),
          );
          print("Updated Cart Value: ₹" + cart.getTotalAmount().toString());
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: dishImage,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      dishName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SmoothStarRating(
                      borderColor: kPrimaryColor,
                      rating: dishRating,
                    ),
                  ],
                ),
                Text(
                  "₹" + dishPrice.toString(),
                  style:
                      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: kTextColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
