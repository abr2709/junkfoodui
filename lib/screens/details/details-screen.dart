import 'package:flutter/material.dart';
import 'package:junk_food/constants.dart';
import 'package:junk_food/screens/details/components/app_bar.dart';
import 'package:junk_food/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(context),
      body: Body(),
    );
  }
}
