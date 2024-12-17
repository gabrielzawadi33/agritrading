import 'package:agritrade/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_textInput.dart';

class CrateForm extends StatelessWidget {
  CrateForm({super.key});
  final TextEditingController noOfcrateController = TextEditingController();
  final TextEditingController crateNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(height: 200),
            const Text('Register Crate', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            CustomTextInputField(
              prefixIcon: CupertinoIcons.location_solid,
              controller: crateNameController,
              keyboardType: TextInputType.text,
              placeholder: 'Name of Crate',
            ),
            const SizedBox(height: 20),
            CustomTextInputField(
              // prefixIcon: CupertinoIcons.location_solid,
              controller: noOfcrateController,
              keyboardType: TextInputType.text,
              placeholder: 'Crate Quantity',
            ),
          ],
        ),
      )),
    );
  }
}
