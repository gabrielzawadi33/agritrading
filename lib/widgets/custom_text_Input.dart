import 'package:flutter/material.dart';

import '../themes/colors.dart';

class CustomTextInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String placeholder;
  final double? width;

  const CustomTextInputField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.placeholder,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width / 1.2,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: placeholder,
          labelStyle: const TextStyle(
            fontSize: 10.0,
            color: Colors.black,
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          // contentPadding: const EdgeInsets.all(12.0),
        ),
        style: const TextStyle(
          fontSize: 12.0,
          color: Colors.black,
        ),
        cursorColor: Colors.black,
      ),
    );
  }
}
