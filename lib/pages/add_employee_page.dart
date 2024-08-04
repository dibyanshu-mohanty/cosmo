import 'package:cosmocloud/controllers/employee_controller.dart';
import 'package:cosmocloud/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AddEmployeeScreen extends StatefulWidget {
  final EmployeeController controller = EmployeeController();
  AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController line1Controller = TextEditingController();
  TextEditingController line2Controller = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  List<String> types = ["Email", "Mobile"];
  String selectedType = "Email";
  TextEditingController contactInfoController = TextEditingController();
  ValueNotifier<bool> onLoad = ValueNotifier(false);

  bool isEnabled() {
    if (nameController.text.isNotEmpty &&
        line1Controller.text.isNotEmpty &&
        pinController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        stateController.text.isNotEmpty &&
        countryController.text.isNotEmpty &&
        contactInfoController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).viewPadding.top + 16, 16, 16),
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(offset: const Offset(0, 2), color: Colors.black12.withOpacity(0.08), blurRadius: 4)], color: Colors.white),
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shadowColor: Colors.transparent,
                          surfaceTintColor: Colors.white,
                          elevation: 0,
                          splashFactory: NoSplash.splashFactory,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                          side: const BorderSide(width: 0.4, color: Colors.black),
                          fixedSize: const Size(32, 32)),
                      child: const Icon(
                        Icons.chevron_left_rounded,
                        color: Colors.black,
                      )),
                  const Text(
                    "Add Cosmonaut",
                    style: TextStyle(fontSize: 12, height: 16 / 12, color: Colors.black87, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    PrimaryInput(
                      controller: nameController,
                      label: "Name*",
                      hint: "John Doe",
                      enabled: true,
                      keyboardType: TextInputType.name,
                      inpFormatter: [
                        FilteringTextInputFormatter.allow(RegExp("[A-Za-z]")),
                      ],
                      onChanged: (p0) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PrimaryInput(
                      controller: line1Controller,
                      label: "House no. / Street*",
                      hint: "11/6, Harrsions Road",
                      enabled: true,
                      keyboardType: TextInputType.streetAddress,
                      inpFormatter: [
                        FilteringTextInputFormatter.allow(RegExp("[A-Za-z,. ]")),
                      ],
                      onChanged: (p0) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PrimaryInput(
                      controller: line2Controller,
                      label: "Locality",
                      hint: "HSR Layout",
                      enabled: true,
                      keyboardType: TextInputType.streetAddress,
                      inpFormatter: [
                        FilteringTextInputFormatter.allow(RegExp("[A-Za-z, ]")),
                      ],
                      onChanged: (p0) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PrimaryInput(
                      controller: pinController,
                      label: "Pincode*",
                      hint: "123456",
                      enabled: true,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      inpFormatter: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      ],
                      onChanged: (p0) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: PrimaryInput(
                          controller: cityController,
                          label: "City*",
                          hint: "Bengaluru",
                          enabled: true,
                          keyboardType: TextInputType.name,
                          inpFormatter: [
                            FilteringTextInputFormatter.allow(RegExp("[a-zA-z]")),
                          ],
                          onChanged: (p0) {
                            setState(() {});
                          },
                        )),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                            child: PrimaryInput(
                          controller: stateController,
                          label: "State*",
                          hint: "Karnataka",
                          enabled: true,
                          keyboardType: TextInputType.name,
                          inpFormatter: [
                            FilteringTextInputFormatter.allow(RegExp("[a-zA-z]")),
                          ],
                          onChanged: (p0) {
                            setState(() {});
                          },
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PrimaryInput(
                      controller: countryController,
                      label: "Country",
                      hint: "India",
                      enabled: true,
                      keyboardType: TextInputType.name,
                      inpFormatter: [
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-z]")),
                      ],
                      onChanged: (p0) {
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact*",
                          style: TextStyle(fontSize: 12, height: 16 / 12, fontWeight: FontWeight.w500, color: Colors.grey.shade800),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.4, color: Colors.grey.shade600), borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Radio<String>(
                                          value: types[0],
                                          groupValue: selectedType,
                                          activeColor: Colors.black,
                                          onChanged: (val) {
                                            setState(() {
                                              selectedType = types[0];
                                            });
                                          }),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      types[0],
                                      style: const TextStyle(fontSize: 12, height: 16 / 12, color: Colors.black, fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.4, color: Colors.grey.shade600), borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: Radio<String>(
                                          value: types[1],
                                          groupValue: selectedType,
                                          activeColor: Colors.black,
                                          onChanged: (val) {
                                            setState(() {
                                              selectedType = types[1];
                                            });
                                          }),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      types[1],
                                      style: const TextStyle(fontSize: 12, height: 16 / 12, color: Colors.black, fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        PrimaryInput(
                          controller: contactInfoController,
                          label: selectedType == "Email" ? "Email ID*" : "Mobile no.*",
                          hint: selectedType == "Email" ? "johdoe@email.com" : "1234567890",
                          enabled: true,
                          inpFormatter: [
                            selectedType == "Email"
                                ? FilteringTextInputFormatter.allow(RegExp("[a-zA-z@.]"))
                                : FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                          ],
                          onChanged: (p0) {
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: Wrap(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () async {
              if (isEnabled()) {
                Map<String, dynamic> requestBody = {
                  "name": nameController.text,
                  "line1": line1Controller.text,
                  "line2": line2Controller.text,
                  "city": cityController.text,
                  "state": stateController.text,
                  "country": countryController.text,
                  "pincode": pinController.text,
                  "contact": {
                    "type": selectedType.toLowerCase(),
                    "contactInfo": selectedType == "Mobile" ? "+91${contactInfoController.text}" : contactInfoController.text,
                  }
                };
                onLoad.value = true;
                await widget.controller.createEmployee(requestBody);
                onLoad.value = false;

                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              }
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), offset: const Offset(0, -2), blurRadius: 12)]),
              child: ValueListenableBuilder(
                  valueListenable: onLoad,
                  builder: (context, load, ch) {
                    return Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: isEnabled() ? Colors.black87 : Colors.grey.shade400),
                      child: load
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1.4,
                            )
                          : const Text(
                              "Continue",
                              style: TextStyle(fontSize: 12, height: 16 / 12, color: Colors.white, fontWeight: FontWeight.w500),
                            ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
