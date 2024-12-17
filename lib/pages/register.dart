import 'package:agritrade/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/qc.dart';
import '../model/supervisor.dart';
import '../widgets/custom_textInput.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isAddSupervisor = false;
  bool isAddQc = false;
  List<Supervisor> supervisors = [];
  List<Qc> qcs = [];
  final _formKey = GlobalKey<FormState>();

  final TextEditingController locatioController = TextEditingController();

  final TextEditingController noOfcrateController = TextEditingController();

  final TextEditingController noOfLabourController = TextEditingController();

  final TextEditingController supervisorNameController =
      TextEditingController();

  final TextEditingController supervisorPhoneController =
      TextEditingController();

  final TextEditingController qcNameoller = TextEditingController();

  final TextEditingController qcPhoneController = TextEditingController();

  final TextEditingController totalCostController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 90),
                  CustomTextInputField(
                    prefixIcon: CupertinoIcons.location_solid,
                    controller: locatioController,
                    keyboardType: TextInputType.text,
                    placeholder: 'Area For Harvest',
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextInputField(
                        prefixIcon: CupertinoIcons.cube_box,
                        controller: noOfcrateController,
                        keyboardType: TextInputType.text,
                        placeholder: 'Number of  Crates',
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                      CustomTextInputField(
                        prefixIcon: CupertinoIcons.number_circle_fill,
                        controller: noOfLabourController,
                        keyboardType: TextInputType.text,
                        placeholder: 'Number of Labour',
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    color: Colors.brown,
                    thickness: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isAddSupervisor = true;
                      });
                    },
                    child: const SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.person_add,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Supervisor ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // showing the added suprevisor
                  if (supervisors.isNotEmpty) ...[
                    Wrap(
                      spacing: 2.0,
                      runSpacing: 2.0,
                      children: supervisors.map((supervisor) {
                        return Chip(
                          backgroundColor: Colors.brown,
                          label: Text(supervisor.name),
                        );
                      }).toList(),
                    ),
                  ],

                  if (isAddSupervisor) ...[
                    CustomTextInputField(
                      prefixIcon: CupertinoIcons.person,
                      controller: supervisorNameController,
                      keyboardType: TextInputType.text,
                      placeholder: 'Name of Supervisor',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextInputField(
                      prefixIcon: CupertinoIcons.phone,
                      controller: supervisorPhoneController,
                      keyboardType: TextInputType.text,
                      placeholder: 'Phone of the Supervisor',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CupertinoButton(
                      color: CupertinoColors.systemBrown.withOpacity(0.4),
                      onPressed: () {
                        final supervisor = Supervisor(
                          name: supervisorNameController.text,
                          phone: supervisorPhoneController.text,
                        );
                        setState(() {
                          supervisors.add(supervisor);
                          supervisorNameController.clear();
                          supervisorPhoneController.clear();
                          isAddSupervisor = false;
                        });
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.brown,
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        CupertinoIcons.person_2_square_stack,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'QC ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isAddQc = true;
                            });
                          },
                          icon: const Icon(Icons.add)),
                    ],
                  ),
                  // showing the added qcs
                      if (qcs.isNotEmpty) ...[
                    Wrap(
                      spacing: 2.0,
                      runSpacing: 2.0,
                      children: qcs.map((qc) {
                        return Chip(
                          backgroundColor: Colors.brown,
                          label: Text(qc.name),
                        );
                      }).toList(),
                    ),
                  ],
                  if (isAddQc) ...[
                    CustomTextInputField(
                      prefixIcon: CupertinoIcons.person_alt_circle,
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      placeholder: 'Name of QC',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    
                    CustomTextInputField(
                      prefixIcon: CupertinoIcons.phone_fill,
                      controller: TextEditingController(),
                      keyboardType: TextInputType.text,
                      placeholder: 'Phone of the QC',
                    ),
                    CupertinoButton(
                      color: CupertinoColors.systemBrown.withOpacity(0.4),
                      onPressed: () {
                        final qc = Qc(
                          name: qcNameoller.text,
                          phone: qcPhoneController.text,
                        );
                        setState(() {
                          qcs.add(qc);
                          qcNameoller.clear();
                          qcPhoneController.clear();
                          isAddQc = false;
                        });
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextInputField(
                    prefixIcon: CupertinoIcons.money_dollar_circle,
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                    placeholder: 'Total Cost',
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown.withOpacity(0.8),
                      onPrimary: Colors.brown,
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
