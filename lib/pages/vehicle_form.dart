import 'package:agritrade/pages/requisition_form.dart';
import 'package:agritrade/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_Input.dart';

class VehicleForm extends StatelessWidget {
  VehicleForm({super.key});
  final TextEditingController vehicleNameController = TextEditingController();
  final TextEditingController plateNoController = TextEditingController();

  bool validate(BuildContext context) {
    if (plateNoController.text.isEmpty) {
      showError(context, 'Please provide Number of Crates');
      return false;
    }

    if (vehicleNameController.text.isEmpty) {
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
        title: const Text('Vehicle Form'),
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
              controller: plateNoController,
              keyboardType: TextInputType.text,
              placeholder: 'Name',
            ),
            const SizedBox(height: 20),
            CustomTextInputField(
              controller: vehicleNameController,
              keyboardType: TextInputType.text,
              placeholder: 'Plate Number',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (validate(context)) {
                  // Navigate to another page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RequisitionForm()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.brown.withOpacity(0.8),
                onPrimary: Colors.brown,
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
