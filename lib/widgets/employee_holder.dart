import 'package:cosmocloud/models/employee_config.dart';
import 'package:cosmocloud/pages/employee_detail_page.dart';
import 'package:cosmocloud/utils/helper.dart';
import 'package:flutter/material.dart';

class EmployeeHolder extends StatelessWidget {
  final Employee employee;
  final bool isLast;
  const EmployeeHolder({super.key, required this.employee, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeDetailPage(empId: employee.id)));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: getColor(employee.empName),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    getShortName(employee.empName),
                    style: TextStyle(fontSize: 12, height: 16 / 12, fontWeight: FontWeight.w500, color: Colors.grey.shade900),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      employee.empName,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 20 / 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      employee.id,
                      style: TextStyle(
                        fontSize: 10,
                        height: 12 / 10,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 24,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          if (!isLast)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(
                thickness: 0.4,
                height: 0,
                color: Colors.grey.shade300,
              ),
            )
        ],
      ),
    );
  }
}
