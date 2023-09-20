import 'package:flutter/material.dart';
import 'package:junk_food/components/bottom_nav_bar.dart';
import 'package:junk_food/screens/home/components/app_bar.dart';
import 'package:junk_food/screens/home/components/body.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      bottomNavigationBar: BottomNavBar(),
      body: Body(),
    );
  }
}
