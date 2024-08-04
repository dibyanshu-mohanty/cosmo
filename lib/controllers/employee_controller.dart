import 'package:cosmocloud/models/employee_config.dart';
import 'package:cosmocloud/services/network_service.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EmployeeController {
  Future<void> getAllEmployees(int offset) async {
    try {
      Response response = await NetworkService().getData("/employee?limit=10&offset=$offset");

      if (response.data != null) {
        EmployeeMap.instance.setEmployees(response.data["data"]);
      } else {
        throw Exception("Something went seriously wrong");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode! >= 300) {
          Fluttertoast.showToast(msg: "Something went wrong !");
        }
      }
    } catch (err) {
      // Add some Logger (Sentry)
    }
  }

  Future<dynamic> getEmployeeById(String id) async {
    try {
      Response response = await NetworkService().getData("/employee/$id");

      if (response.data != null) {
        return response.data;
      } else {
        throw Exception("Something went seriously wrong");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode! >= 300) {
          Fluttertoast.showToast(msg: "Something went wrong !");
        }
      }
    } catch (err) {
      // Add some Logger (Sentry)
    }
  }

  Future<void> createEmployee(Map<String, dynamic> data) async {
    try {
      Response response = await NetworkService().postData("/employee", data);

      if (response.data != null) {
        await getAllEmployees(0);
      } else {
        throw Exception("Something went seriously wrong");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode! >= 300) {
          Fluttertoast.showToast(msg: "Something went wrong !");
        }
      }
    } catch (err) {
      // Add some Logger (Sentry)
    }
  }
}
