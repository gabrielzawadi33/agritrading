import 'package:agritrade/pages/register.dart';
import 'package:agritrade/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_textInput.dart';

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
    return  Scaffold(
        backgroundColor: backgroundColor, 
        body: SingleChildScrollView(
          child: SafeArea(
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
                        MaterialPageRoute(builder: (context) => const Register()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown.withOpacity(0.8),
                    onPrimary: Colors.brown,
                  ),
                  child: const Text('Submit',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                ),
              ],
            ),
          )),
        ),
      
    );
  }
}