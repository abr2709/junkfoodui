import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController textController;
  final IconData iconValue;
  final TextInputType type;
  final bool notVisible;
  const CustomInputField({Key? key, required this.labelText, required this.textController, required this.iconValue, required this.type, required this.notVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: type,
        obscureText: notVisible,
        controller: textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          label: Text(labelText),
          prefixIcon: Icon(iconValue),
        ),
        validator: (val) => (val!.isEmpty) ? "Enter the $labelText" : null,
      ),
    );
  }
}
