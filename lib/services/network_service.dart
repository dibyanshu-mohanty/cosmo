import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkService {
  static String projectId = dotenv.env["PROJECT_ID"] ?? "";
  static String envId = dotenv.env["ENVIRONMENT_ID"] ?? "";

  Dio dio = Dio(BaseOptions(
    baseUrl: "https://free-ap-south-1.cosmocloud.io/development/api",
  ));

  Options dioOptions = Options(
    receiveTimeout: const Duration(seconds: 5),
    headers: {"projectId": projectId, "environmentId": envId},
  );

  getData(String path) async {
    dynamic response = await dio.get(path, options: dioOptions).onError((error, stackTrace) => throw error!);
    return response;
  }

  postData(String path, Map<String, dynamic> data) async {
    dynamic response = await dio.post(path, data: data, options: dioOptions).onError((error, stackTrace) => throw error!);
    return response;
  }
}
