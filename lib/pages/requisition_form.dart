import 'package:agritrade/pages/crate_form.dart';
import 'package:agritrade/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/qc.dart';
import '../model/supervisor.dart';
import '../widgets/custom_text_Input.dart';

class RequisitionForm extends StatefulWidget {
  const RequisitionForm({super.key});

  @override
  State<RequisitionForm> createState() => _RequisitionFormState();
}

class _RequisitionFormState extends State<RequisitionForm> {
  bool isAddSupervisor = true;
  bool isAddQualityController = false;
  List<Supervisor> supervisors = [];
  List<QualityController> qualityControllers = [];

  final TextEditingController locatioController = TextEditingController();

  final TextEditingController noOfcrateController = TextEditingController();

  final TextEditingController noOfLabourController = TextEditingController();

  final TextEditingController supervisorNameController =
      TextEditingController();

  final TextEditingController supervisorPhoneController =
      TextEditingController();

  final TextEditingController qcNameController = TextEditingController();

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
    if (qualityControllers.isEmpty) {
      showError('Please provide quality Controller');
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
      appBar: AppBar(
        title: const Text(
          'Harvest Requisition Form',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      // resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  CustomTextInputField(
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
                        controller: noOfcrateController,
                        keyboardType: TextInputType.number,
                        placeholder: 'Number of  Crates',
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                      CustomTextInputField(
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
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.add,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        if (!isAddSupervisor) ...[
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isAddSupervisor = true;
                              });
                            },
                            child: const Text(
                              'Tap to Add Supervisor ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: textColor),
                            ),
                          )
                        ] else ...[
                          const Text(
                            ' Add Supervisor Details ',
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
                  const SizedBox(
                    height: 10,
                  ),
                  // showing the added suprevisor
                  if (supervisors.isNotEmpty) ...[
                    Wrap(
                      children: supervisors.map((supervisor) {
                        return Container(
                          margin: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.grey,
                            border: Border.all(
                              color: Colors.black,),),
                          // color: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name: ${supervisor.name}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Phone: ${supervisor.phone}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                  const SizedBox(
                    height: 10,
                  ),
                  if (isAddSupervisor) ...[
                    CustomTextInputField(
                      controller: supervisorNameController,
                      keyboardType: TextInputType.text,
                      placeholder: 'Name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextInputField(
                      controller: supervisorPhoneController,
                      keyboardType: TextInputType.text,
                      placeholder: 'phone',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the border radius as needed
                      ),
                      child: CupertinoButton(
                        color: backgroundColor,
                        onPressed: () {
                          if (supervisorNameController.text.isEmpty) {
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
                          'Add',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    )
                  ],
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isAddQualityController = true;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          CupertinoIcons.add,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        if (!isAddQualityController) ...[
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isAddQualityController = true;
                              });
                            },
                            child: const Text(
                              'Tap to Add Quality Controller ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                            ),
                          )
                        ] else ...[
                          const Text(
                            'Add Quality Controller ',
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
                                isAddQualityController = false;
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
                  if (qualityControllers.isNotEmpty) ...[
                      Wrap(
                      children: qualityControllers.map((qs) {
                        return Container(
                          margin: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.grey,
                            border: Border.all(
                              color: Colors.black,),),
                          // color: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal:8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name: ${qs.name}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Phone: ${qs.phone}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                  const SizedBox(
                    height: 10,
                  ),
                  if (isAddQualityController) ...[
                    CustomTextInputField(
                      controller: qcNameController,
                      keyboardType: TextInputType.text,
                      placeholder: 'Name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextInputField(
                      controller: qcPhoneController,
                      keyboardType: TextInputType.text,
                      placeholder: 'Phone',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the border radius as needed
                      ),
                      child: CupertinoButton(
                        color: backgroundColor,
                        onPressed: () {
                          if (qcNameController.text.isEmpty) {
                            showError('Please provide QC name');
                            return;
                          } else if (qcPhoneController.text.isEmpty) {
                            showError('Please provide QC phone');
                            return;
                          } else {
                            final qc = QualityController(
                              name: qcNameController.text,
                              phone: qcPhoneController.text,
                            );
                            setState(() {
                              qualityControllers.add(qc);
                              qcNameController.clear();
                              qcPhoneController.clear();
                              isAddQualityController = false;
                            });
                          }
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextInputField(
                    controller: totalCostController,
                    keyboardType: TextInputType.text,
                    placeholder: 'Total Harvest Cost',
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
                    style: ElevatedButton.styleFrom(primary: backgroundColor),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
