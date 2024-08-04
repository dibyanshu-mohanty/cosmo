import 'package:cosmocloud/controllers/employee_controller.dart';
import 'package:cosmocloud/models/employee_config.dart';
import 'package:cosmocloud/utils/helper.dart';
import 'package:cosmocloud/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class EmployeeDetailPage extends StatefulWidget {
  final EmployeeController controller = EmployeeController();
  final String empId;
  EmployeeDetailPage({super.key, required this.empId});

  @override
  State<EmployeeDetailPage> createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  Employee employee = Employee.instance;
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      isLoading.value = true;
      Map<String, dynamic> response = await widget.controller.getEmployeeById(widget.empId);
      employee = Employee.fromJson(response);
      isLoading.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isLoading,
        builder: (context, isLoad, ch) {
          return Scaffold(
            body: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).viewPadding.top + 16, 16, 16),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(offset: const Offset(0, 2), color: Colors.black12.withOpacity(0.08), blurRadius: 4)],
                        color: Colors.white),
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
                          "Cosmonaut Details",
                          style: TextStyle(fontSize: 12, height: 16 / 12, color: Colors.black87, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Expanded(
                      child: isLoad
                          ? const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 1.2,
                                color: Colors.purpleAccent,
                              ),
                            )
                          : SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: getColor(employee.empName),
                                          shape: BoxShape.circle,
                                          border: Border.all(width: 0.4, color: Colors.grey.shade500)),
                                      child: Text(
                                        getShortName(employee.empName),
                                        style: TextStyle(fontSize: 20, height: 28 / 20, fontWeight: FontWeight.w600, color: Colors.grey.shade800),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      employee.empName,
                                      style: TextStyle(fontSize: 18, height: 26 / 18, color: Colors.grey.shade900, fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    PrimaryInput(label: "ID", hint: employee.id, enabled: false),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    PrimaryInput(
                                        label: employee.contactInfo.isEmail ? "Email ID" : "Mobile No.",
                                        hint: employee.contactInfo.contactInfo,
                                        enabled: false),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    PrimaryInput(label: "House No. / Street", hint: employee.lineOne, enabled: false),
                                    if (employee.lineTwo.isNotEmpty)
                                      const SizedBox(
                                        height: 24,
                                      ),
                                    if (employee.lineTwo.isNotEmpty) PrimaryInput(label: "Locality", hint: employee.lineTwo, enabled: false),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    PrimaryInput(label: "City", hint: employee.city, enabled: false),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    PrimaryInput(label: "State", hint: employee.state, enabled: false),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    PrimaryInput(label: "Country", hint: employee.country, enabled: false),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    PrimaryInput(label: "Pincode", hint: employee.pincode, enabled: false),
                                    const SizedBox(
                                      height: 48,
                                    ),
                                  ],
                                ),
                              ),
                            ))
                ],
              ),
            ),
          );
        });
  }
}
