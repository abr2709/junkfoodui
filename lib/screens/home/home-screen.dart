import 'package:flutter/material.dart';
import 'package:junk_food/screens/dashboard.dart';
import 'package:junk_food/screens/details/components/body.dart';
import 'package:junk_food/screens/login-screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Dashboard(),
      body: LoginPage(
        title: 'Junk Food',
      ),
    );
  }
}
