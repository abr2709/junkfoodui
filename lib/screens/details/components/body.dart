import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:junk_food/constants.dart';
import 'package:junk_food/screens/checkout.dart';
import 'package:junk_food/screens/details/components/item_image.dart';
import 'package:junk_food/screens/details/components/order_button.dart';
import 'package:junk_food/screens/details/components/title_price_rating.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemImage(
          imgSrc: "assets/images/burger.png",
        ),
        Expanded(
          child: ItemInfo(),
        ),
      ],
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          shopName(name: "Burger Singh"),
          TitlePriceRating(
            name: "Tikka Burger",
            numOfReviews: 24,
            rating: 4,
            price: 259,
            onRatingChanged: (value) {},
          ),
          Text(
            "jhfbseyuh hubfqwuyghuwej KJQSOIjd iuhdu ayfguy asdgtyfws fbuyhguye buhegfuyw asuycgsytgvy suydtgyt tyeegfytsy uyfgytnbgfvynnv pawokdoi yuguy yufgytv ytfytfu ytuftyf",
            style: TextStyle(
              height: 1.5,
            ),
          ),
          SizedBox(height: size.height * 0.1),
          OrderButton(
            size: size,
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Checkout(
                    price: '0',
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Row shopName({required String name}) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: ksecondaryColor,
        ),
        SizedBox(width: 10),
        Text(name),
      ],
    );
  }
}
