import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextInputField extends StatelessWidget {
  final IconData? prefixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String placeholder;
  final double? width;

  const CustomTextInputField({
    Key? key,
    this.prefixIcon,
    required this.controller,
    required this.keyboardType,
    required this.placeholder,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 108, 145, 125),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: width ?? MediaQuery.of(context).size.width / 1.2,
      height: 50,
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        style: const TextStyle(
          fontSize: 12.0,
          color: CupertinoColors.black,
        ),
        placeholderStyle: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 10.0,
        ),
        prefix: prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  prefixIcon,
                  color: CupertinoColors.black,
                ),
              )
            : null,
        cursorColor: CupertinoColors.black,
        clearButtonMode: OverlayVisibilityMode.editing,
        keyboardType: keyboardType,
      ),
    );
  }
}