import 'package:agritrade/pages/crate_form.dart';
import 'package:agritrade/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/qc.dart';
import '../model/supervisor.dart';
import '../widgets/custom_textInput.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isAddSupervisor = true;
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

  bool validate() {
    if (locatioController.text.isEmpty) {
      showError('Please provide location');
      return false;
    }

    if (noOfcrateController.text.isEmpty) {
      showError('Please provide number of crates');
      return false;
    }

    if (noOfLabourController.text.isEmpty) {
      showError('Please provide number of labour');
      return false;
    }

    if (supervisors.isEmpty) {
      showError('Please provide supervisor');
      return false;
    }
    if (qcs.isEmpty) {
      showError('Please provide qc');
      return false;
    }

    return true;
  }

  // void clearFields() {
  //   emailController.clear();
  //   passwordController.clear();
  // }

  void showError(String message) {
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
                  const SizedBox(height: 50),
                  const Text(
                    'Register Harvest',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                        keyboardType: TextInputType.number,
                        placeholder: 'Number of  Crates',
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                      CustomTextInputField(
                        prefixIcon: CupertinoIcons.number_circle_fill,
                        controller: noOfLabourController,
                        keyboardType: TextInputType.number,
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
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isAddSupervisor = true;
                      });
                    },
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.add_circled_solid,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          if (!isAddSupervisor) ...[
                            const Text(
                              'Tap to Add Supervisor',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ] else ...[
                            const Text(
                              ' Add Supervisor ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isAddSupervisor = false;
                                });
                              },
                              icon: const Icon(
                                Icons.cancel_outlined,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                  const SizedBox(
                    height: 10,
                  ),
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
                        if (supervisorNameController.text.isEmpty) {
                          showError('Please provide supervisor name');
                          return;
                        } else if (supervisorPhoneController.text.isEmpty) {
                          showError('Please provide supervisor phone');
                          return;
                        } else {
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
                        }
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isAddQc = true;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.add_circled_solid,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        if (!isAddQc) ...[
                          const Text(
                            'Tap to Add sQC ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ] else ...[
                          const Text(
                            'Add QC ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isAddQc = false;
                              });
                            },
                            icon: const Icon(
                              Icons.cancel_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                  const SizedBox(
                    height: 10,
                  ),
                  if (isAddQc) ...[
                    CustomTextInputField(
                      prefixIcon: CupertinoIcons.person_alt_circle,
                      controller: qcNameoller,
                      keyboardType: TextInputType.text,
                      placeholder: 'Name of QC',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextInputField(
                      prefixIcon: CupertinoIcons.phone_fill,
                      controller: qcPhoneController,
                      keyboardType: TextInputType.text,
                      placeholder: 'Phone of the QC',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CupertinoButton(
                      color: CupertinoColors.systemBrown.withOpacity(0.4),
                      onPressed: () {
                        if (qcNameoller.text.isEmpty) {
                          showError('Please provide QC name');
                          return;
                        } else if (qcPhoneController.text.isEmpty) {
                          showError('Please provide QC phone');
                          return;
                        } else {
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
                        }
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextInputField(
                    prefixIcon: CupertinoIcons.money_dollar_circle,
                    controller: totalCostController,
                    keyboardType: TextInputType.text,
                    placeholder: 'Total Cost',
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      if (validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CrateForm()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown.withOpacity(0.8),
                      onPrimary: Colors.brown,
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
