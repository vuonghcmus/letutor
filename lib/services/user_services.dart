import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:intl/intl.dart';
import '../constants/api_constants.dart';
import '../models/user_model.dart';
import 'base_services.dart';

class UserService extends BaseService {
  Future<void> loginAccount(
      {required String email, required String password}) async {
    final body = {"email": email, "password": password};
    final response = await post(API.LOGIN, data: body);

    saveUser(response);
  }

  Future<void> registerAccount(
      {required String email, required String password}) async {
    final body = {"email": email, "password": password};
    final response = await post(API.REGISTER, data: body);
  }

  Future<void> forgotPassword({required String email}) async {
    final body = {"email": email};
    final response = await post(API.FORGOT_PASSWORD, data: body);
  }

  Future<dynamic> getTotalTime() async {
    final response = await get(API.TOTAL_TIME);
    return response;
  }

  Future<dynamic> getSchedule({page = 1, type = 0}) async {
    final data = type == 0
        ? {
            'page': page,
            'perPage': 20,
            'dateTimeGte': DateTime.now()
                .millisecondsSinceEpoch
                .toString()
                .substring(0, 13),
            'orderBy': 'meeting',
            'sortBy': 'desc',
          }
        : {
            'page': page,
            'perPage': 20,
            'dateTimeLte': DateTime.now()
                .millisecondsSinceEpoch
                .toString()
                .substring(0, 13),
            'orderBy': 'meeting',
            'sortBy': 'desc',
          };
    final response = await get(API.SCHEDULE_ALL, params: data);
    return response;
  }

  Future<dynamic> uploadImage(File file) async {
    final dio.FormData formData = dio.FormData.fromMap(
        {'avatar': await dio.MultipartFile.fromFile(file.path)});

    final response = await post(API.UP_AVATAR, data: formData);
    appController.userModel.value = UserModel.fromJson(response);
    return response;
  }

  Future<UserModel> getUserInfo() async {
    final response = await get(API.USER_INFO);
    UserModel userModel =UserModel.fromJson(response['user']);
    appController.userModel.value = userModel;
    return userModel;
  }

  Future<void> updateUserInfo({required UserModel user}) async {
    final body = {
      'name': user.name,
      // 'email': user.email,
      'country': user.country,
      // 'learnTopics': user.learnTopics,
      'phone': user.phone,
      'birthday': DateFormat('yyyy-MM-dd').format(user.birthday),
      'level': user.level,
      'studySchedule': user.studySchedule,
      // 'testPreparations': user.testPreparations
    };
    final response = await put(API.USER_INFO, data: body);
    appController.userModel.value = UserModel.fromJson(response);
  }

  Future<void> loginByOtherType(
      {required String accessToken, required String type}) async {
    final response =
    await post(API.LOGIN_OTHER_TYPE + type, data: {"access_token": accessToken});
    saveUser(response);
  }

  Future<dynamic> cancelSchedule(
      {required String scheduleDetailId, required int i}) async {
    final Map<String, dynamic> body = {
      'cancelInfo': {'cancelReasonId': i},
      'scheduleDetailId': scheduleDetailId
    };

    return await delete(API.CANCEL_SCHEDULE, data: body);
  }
}
