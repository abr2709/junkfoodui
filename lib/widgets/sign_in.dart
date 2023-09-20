import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/dashboard.dart';
import 'package:flutter_app/widgets/custom_input.dart';

class SignInScreen extends StatefulWidget {
  static const String ROUTE_NAME = "/sign-in";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _fkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fkey,
      child: Column(
        children: [
          const Text("Sign In",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.25,
              )),
          const SizedBox(height: 2),
          CustomInputField(
            labelText: "Email",
            textController: _emailController,
            iconValue: Icons.email,
            notVisible: false,
            type: TextInputType.emailAddress,
          ),
          CustomInputField(
            labelText: "Password",
            textController: _passwordController,
            iconValue: Icons.password,
            notVisible: true,
            type: TextInputType.visiblePassword,
          ),
          const SizedBox(height: 2),
          ElevatedButton.icon(
            onPressed: () {
              if (_fkey.currentState!.validate()) {
                proceed(context);
              }
            },
            icon: const Icon(Icons.app_registration),
            label: const Text("Sign In."),
          ),
        ],
      ),
    );
  }

  Future<void> proceed(context) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
      Navigator.pushNamed(context, DashBoard.ROUTE_NAME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showMsg('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showMsg('Wrong password provided for that user.');
      }
    }
  }

  void showMsg(String e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e)),
    );
  }
}
