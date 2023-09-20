import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/sign_in.dart';
import 'package:flutter_app/widgets/sign_up.dart';

class BottomTab extends StatefulWidget {
  static const String ROUTE_NAME = "/bottom-tab";
  const BottomTab({Key? key}) : super(key: key);

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _tNo = 0;
  final tabOption = const [
    SignInScreen(),
    SignUpScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabOption[_tNo],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.login), label: "Sign In"),
          BottomNavigationBarItem(icon: Icon(Icons.app_registration), label: "Sign Up"),
        ],
        onTap: (selected) {
          setState(() {
            _tNo = selected;
          });
        },
        currentIndex: _tNo,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.black12,
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
