import 'package:agritrade/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/custom_textInput.dart';

class VehicleForm extends StatelessWidget {
  VehicleForm({super.key});
  final TextEditingController plateNumberController = TextEditingController();
  final TextEditingController plateNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(height: 250),
            const Text(
              'Register Vehicle',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            CustomTextInputField(
              prefixIcon: CupertinoIcons.car_fill,
              controller: plateNoController,
              keyboardType: TextInputType.text,
              placeholder: 'Name of Vehicle',
            ),
            const SizedBox(height: 20),
            CustomTextInputField(
              prefixIcon: CupertinoIcons.capsule_fill,
              controller: plateNumberController,
              keyboardType: TextInputType.text,
              placeholder: 'Plate Number',
            ),
          ],
        ),
      )),
    );
  }
}
