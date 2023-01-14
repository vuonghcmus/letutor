import 'dart:io';

import 'package:letutor/services/base_services.dart';
import 'package:dio/dio.dart' as dio;

import '../constants/api_constants.dart';
import '../models/certifications.dart';

class BecomeTeacherServices extends BaseService {
  Future<dynamic> becomeTeacher(
      File fileAvatar,
      String name,
      String country,
      String birthday,
      String interests,
      String education,
      String experience,
      List<String> languages,
      String bio,
      String targetStudent,
      String profession,
      File video,
      List<String> specialties,
      int price,
      List<Certification> certifications) async {
    String specialtiesString = '';
    for (int i = 0; i < specialties.length; i++) {
      specialtiesString += specialties[i];
      if (i != specialties.length - 1) {
        specialtiesString += ',';
      }
    }
    String languagesString = '';
    for (int i = 0; i < languages.length; i++) {
      languagesString += languages[i];
      if (i != languages.length - 1) {
        languagesString += ',';
      }
    }
    final dio.FormData formData = dio.FormData.fromMap({
      'avatar': await dio.MultipartFile.fromFile(fileAvatar.path),
      'name': name,
      'country': country,
      'birthday': birthday,
      'interests': interests,
      'profession': profession,
      'education': education,
      'experience': experience,
      'languages': languagesString,
      'bio': bio,
      'specialties': specialtiesString,
      'targetStudent': targetStudent,
      'certificate': await dio.MultipartFile.fromFile(
          certifications[0].fileCertification!.path),
      'certificateMapping': certifications
          .map((e) => {
                'certificateFileName': e.name,
                'certificateType': e.name,
              })
          .toList(),
      'price': price,
    });
    final response = await post(API.BECOME_TEACHER, data: formData);
    return response;
  }
}
