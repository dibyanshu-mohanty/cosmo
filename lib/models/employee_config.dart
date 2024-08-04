import 'package:flutter/material.dart';

class ContactInfo {
  bool isEmail = false;
  String contactInfo = "";

  ContactInfo._privateConstructor();
  static final ContactInfo instance = ContactInfo._privateConstructor();

  ContactInfo.fromJson(dynamic data) {
    isEmail = data["type"] != null ? data["type"] == "email" : false;
    contactInfo = data["contactInfo"] ?? "";
  }

  toJson() => {
        "type": isEmail ? "email" : "phone",
        "contactInfo": contactInfo,
      };
}

class Employee {
  String id = "";
  String empName = "";
  String lineOne = "";
  String lineTwo = "";
  String city = "";
  String state = "";
  String country = "";
  String pincode = "";
  ContactInfo contactInfo = ContactInfo.instance;

  Employee._privateConstructor();
  static final Employee instance = Employee._privateConstructor();

  Employee.fromJson(dynamic data) {
    id = data["_id"] ?? "";
    empName = data["name"] ?? "";
    lineOne = data["line1"] ?? "";
    lineTwo = data["line2"] ?? "";
    city = data["city"] ?? "";
    state = data["state"] ?? "";
    country = data["country"] ?? "";
    pincode = data["pincode"] ?? "";
    contactInfo = data["contact"] != null ? ContactInfo.fromJson(data["contact"]) : ContactInfo.instance;
  }

  toJson() => {
        "name": empName,
        "line1": lineOne,
        "line2": lineTwo,
        "city": city,
        "state": state,
        "country": country,
        "pincode": pincode,
        "contact": contactInfo.toJson()
      };
}

class EmployeeMap with ChangeNotifier {
  List<Employee> employees = [];

  EmployeeMap._privateConstructor();
  static final EmployeeMap instance = EmployeeMap._privateConstructor();

  void setEmployees(dynamic response) {
    if (response != null) {
      if ((response as List<dynamic>).isNotEmpty) {
        employees = response.map((e) => Employee.fromJson(e)).toList();
      }
    }
    notifyListeners();
  }

  Employee getReponseById(String id) {
    return employees.firstWhere(
      (element) => element.id == id,
      orElse: () => Employee.instance,
    );
  }
}
