import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/dashboard.dart';
import 'package:flutter_app/widgets/custom_input.dart';

class SignUpScreen extends StatefulWidget {
  static const String ROUTE_NAME = "/sign-up";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _fkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fkey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 150,
              margin: const EdgeInsets.all(2),
              child: Image.asset(
                "assets/images/logo.jpg",
                fit: BoxFit.cover,
              ),
            ),
            const Text("Sign Up",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.25,
                )),
            CustomInputField(
              labelText: "Name",
              textController: _nameController,
              iconValue: Icons.person,
              notVisible: false,
              type: TextInputType.name,
            ),
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
            CustomInputField(
              labelText: "Retype Password",
              textController: _repeatController,
              iconValue: Icons.password,
              notVisible: true,
              type: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 5),
            ElevatedButton.icon(
              onPressed: () {
                if (_fkey.currentState!.validate()) {
                  proceed();
                }
              },
              icon: const Icon(Icons.app_registration),
              label: const Text("Proceed to Sign Up."),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> proceed() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (credential != null) {
        String userId = credential.user!.uid;
        addtoDB(userId);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showMsg('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showMsg('The account already exists for that email.');
      }
    } catch (e) {
      showMsg(e.toString());
    }
  }

  void showMsg(String e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e)),
    );
  }

  void addtoDB(String userId) async {
    CollectionReference userCollection = FirebaseFirestore.instance.collection('accounts');
    await userCollection
        .doc('userId')
        .set({
          'name': _nameController.text,
          'email': _emailController.text,
        })
        .then((_) => Navigator.pushNamed(context, DashBoard.ROUTE_NAME))
        .catchError((error) => showMsg("Failed to add user: $error"));
  }
}
