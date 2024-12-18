import 'package:agritrade/pages/vehicle_form.dart';
import 'package:agritrade/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_Input.dart';

class CrateForm extends StatelessWidget {
  CrateForm({super.key});
  final TextEditingController noOfcrateController = TextEditingController();
  final TextEditingController crateNameController = TextEditingController();

  bool validate(BuildContext context) {
    if (noOfcrateController.text.isEmpty) {
      showError(context, 'Please provide Number of Crates');
      return false;
    }

    if (crateNameController.text.isEmpty) {
      showError(context, 'Please provide number of labour');
      return false;
    }

    return true;
  }

  void showError(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text(''),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crate Form'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomTextInputField(
              controller: crateNameController,
              keyboardType: TextInputType.text,
              placeholder: 'Name ',
            ),
            const SizedBox(height: 20),
            CustomTextInputField(
              controller: noOfcrateController,
              keyboardType: TextInputType.text,
              placeholder: ' Quantity',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (validate(context)) {
                  // Navigate to another page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VehicleForm()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: backgroundColor,
              ),
              child: const Text('Save',
                  style: TextStyle(fontSize: 12, color: Colors.black)),
            ),
          ],
        ),
      )),
    );
  }
}
