import 'package:cosmocloud/controllers/employee_controller.dart';
import 'package:cosmocloud/models/employee_config.dart';
import 'package:cosmocloud/pages/add_employee_page.dart';
import 'package:cosmocloud/widgets/employee_holder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final EmployeeController controller = EmployeeController();
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ScrollController _controller = ScrollController();
  int offset = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      isLoading.value = true;
      await widget.controller.getAllEmployees(0);
      isLoading.value = false;
    });
  }

  void _scrollListener() async {
    if ((_controller.position.pixels == _controller.position.maxScrollExtent)) {
      offset += 10;
      await Future.delayed(Duration(seconds: 1)).then((value) {
        widget.controller.getAllEmployees(offset);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isLoading,
        builder: (context, isLoad, ch) {
          return Scaffold(
            body: Consumer<EmployeeMap>(builder: (context, eMap, ch) {
              return Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(16, MediaQuery.of(context).viewPadding.top + 16, 16, 16),
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(offset: const Offset(0, 2), color: Colors.black12.withOpacity(0.08), blurRadius: 4)],
                          color: Colors.white),
                      child: const Center(
                        child: Text(
                          "Cosmonauts",
                          style: TextStyle(fontSize: 14, height: 20 / 14, color: Colors.black87, fontWeight: FontWeight.w700),
                        ),
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
                            : eMap.employees.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "/Users/dibyanshu/development/AndroidStudio/cosmocloud/images/empty_illustration.jpg",
                                          height: 160,
                                          width: 160,
                                        ),
                                        const Text(
                                          "No Cosmonauts added yet",
                                          style: TextStyle(fontSize: 14, height: 20 / 14, color: Colors.black54, fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const Text(
                                          "Click the + button to get started",
                                          style: TextStyle(fontSize: 10, height: 12 / 10, color: Colors.black38, fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  )
                                : ListView(
                                    controller: _controller,
                                    padding: EdgeInsets.zero,
                                    children: eMap.employees
                                        .map((e) => EmployeeHolder(
                                              employee: e,
                                              isLast: e == eMap.employees.last,
                                            ))
                                        .toList(),
                                  ))
                  ],
                ),
              );
            }),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddEmployeeScreen()));
              },
              child: const Icon(
                Icons.add,
                size: 26,
                color: Colors.black,
              ),
            ),
          );
        });
  }
}
