import 'package:agritrade/model/requisition.dart';
import 'package:agritrade/pages/crate_form.dart';
import 'package:agritrade/pages/requisition_form.dart';
import 'package:agritrade/pages/vehicle_form.dart';
import 'package:agritrade/themes/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:  RequisitionForm(),
    );
  }
}
