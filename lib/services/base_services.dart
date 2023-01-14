import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:letutor/services/rest_client.dart';
import 'package:dio/dio.dart' as dio;

import '../handler/exception/data_exception.dart';
import '../handler/response/api_response.dart';
import '../models/user_model.dart';
import '../ui/controllers/app_controller.dart';

enum JsonType { FULL_RESPONSE, JSON_RESPONSE, BODY_BYTES, STRING_RESPONSE }

abstract class BaseService {
  final appController = Get.find<AppController>();

  Future<dynamic> get(String path,
      {Map<String, dynamic>? params,
      JsonType responseType = JsonType.FULL_RESPONSE}) async {
    final response =
        await RestClient.getDio().get(path, queryParameters: params);
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> post(String path,
      {data,
      bool enableCache = false,
      JsonType responseType = JsonType.FULL_RESPONSE}) async {
    final response = await RestClient.getDio().post(path, data: data);
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> patch(String path,
      {data, JsonType responseType = JsonType.FULL_RESPONSE}) async {
    final response = await RestClient.getDio().patch(path, data: data);
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> put(String path,
      {data, JsonType responseType = JsonType.FULL_RESPONSE}) async {
    final response = await RestClient.getDio().put(path, data: data);
    return _handleResponse(response, responseType: responseType);
  }

  Future<dynamic> delete(String path,
      {data, JsonType responseType = JsonType.FULL_RESPONSE}) async {
    final response = await RestClient.getDio().delete(path, data: data);
    return _handleResponse(response, responseType: responseType);
  }

  bool isSuccess(statusCode) => statusCode! >= 200 && statusCode! <= 299;

  dynamic _handleResponse(dio.Response response,
      {JsonType responseType = JsonType.JSON_RESPONSE}) {
    if (isSuccess(response.statusCode)) {
      if (responseType == JsonType.JSON_RESPONSE) {
        return ApiResponse.fromJson(response.data).data;
      } else if (responseType == JsonType.FULL_RESPONSE) {
        return response.data;
      } else if (responseType == JsonType.STRING_RESPONSE) {
        return ApiResponse(
            statusCode: response.statusCode,
            message: response.data,
            error: response.data);
      } else if (responseType == JsonType.BODY_BYTES) {
        return ApiResponse(
            statusCode: response.statusCode,
            message: response.data,
            error: response.data);
      } else {
        return DataException.fromJson(jsonDecode(response.data));
      }
    } else {
      return DataException.fromJson(jsonDecode(response.data));
    }
  }

  String queryParam(String? id) {
    Map<String, String?> queryParams = {'status': 'ACTIVE', 'root': id};
    return jsonEncode(queryParams);
  }

  void saveUser(response) {
    appController.userModel.value = UserModel.fromJson(response['user']);
    RestClient.instance.setToken(response['tokens']['access']['token']);
  }
//
// void saveLanguages(response) {
//   _appController.saveLanguages(response);
// }
}
