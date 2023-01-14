import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:letutor/models/favourite_tutor.dart';

import '../../config/app_pages.dart';
import '../../constants/constants.dart';
import '../../constants/title_string.dart';
import '../../models/schedule.dart';
import '../../models/tutor.dart';
import '../../services/tutor_services.dart';
import '../../services/user_services.dart';
import '../base/base_controller.dart';

class DashBoardListController extends BaseController {
  RxBool isLoading = false.obs;

  final _tutorService = Get.find<TutorService>();
  final _userService = Get.find<UserService>();

  RxList<Tutor> listTutor = <Tutor>[].obs;
  RxList<FavouriteTutor> listFavouriteTutor = <FavouriteTutor>[].obs;

  RxList<String> valueContriesSelected = <String>[].obs;

  RxList<Schedule> schedules = <Schedule>[].obs;
  RxInt totalTime = 0.obs;
  Rx<String> upComming = ''.obs;

  RxInt pageSelected = 0.obs;
  RxInt totalPage = 1.obs;

  final listType = [
    TitleString.all,
    TitleString.englishForKids,
    TitleString.englishForBusiness,
    TitleString.conversational,
    TitleString.starters,
    TitleString.movers,
    TitleString.flyers,
    TitleString.ket,
    TitleString.pet,
    TitleString.ielts,
    TitleString.toefl,
    TitleString.toeic
  ];
  RxString currentType = TitleString.all.obs;

  final Map<String, String> mapListType = {
    TitleString.all: 'All',
    TitleString.englishForKids: 'english-for-kids',
    TitleString.englishForBusiness: 'business-english',
    TitleString.conversational: 'conversational-english',
    TitleString.starters: 'starters',
    TitleString.movers: 'movers',
    TitleString.flyers: 'flyers',
    TitleString.ket: 'ket',
    TitleString.pet: 'pet',
    TitleString.ielts: 'ielts',
    TitleString.toefl: 'toefl',
    TitleString.toeic: 'toeic'
  };

  final Map<String, bool> nationality = {
    'isVietNamese': false,
    'isNative': false
  };
  final List<String> listNation = [
    'isVietNamese',
    'isNative',
  ];

  final Map<String, TextEditingController> controllers = Map.fromEntries(
    [nameField, dateField, dateStartField, dateEndField].map(
      (value) => MapEntry(
        value,
        TextEditingController(),
      ),
    ),
  );

  @override
  void onInit() async {
    pageSelected = 0.obs;
    isLoading = true.obs;
    super.onInit();
    initData();
    getDataSchedule();

    Timer.periodic(Duration(seconds: 1), (Timer t) => renderUpComming());
    isLoading = false.obs;
  }

  @override
  void onReloadData() {}

  void initData() async {
    final res = await _tutorService.getAllTutorByPage();
    listTutor.value =
        (res['tutors']['rows'] as List).map((e) => Tutor.fromJson(e)).toList();
    listFavouriteTutor.value = (res['favoriteTutor'] as List).map((e) {
      FavouriteTutor favouriteTutor;
      try {
        favouriteTutor = FavouriteTutor.fromJson(e);
      } catch (e1) {
        favouriteTutor = FavouriteTutor();
      }
      // FavouriteTutor favouriteTutor = FavouriteTutor.fromJson(e);
      return favouriteTutor;
    }).toList();
    int total = res['tutors']['count'];
    totalPage.value = (total ~/ 9 + 1);
    final resTotal = await _userService.getTotalTime();
    totalTime.value = resTotal['total'];
    sortTutorList();
  }

  void search() async {
    try {
      final res = await _tutorService.getAllTutorBySearch(
          page: pageSelected.value + 1,
          // nationality: nationality,
          search: controllers[nameField]!.text,
          specialties: [
            if (currentType.value != TitleString.all)
              mapListType[currentType.value]!
          ]);
      int total = res['count'];
      totalPage.value = (total ~/ 9 + 1);
      listTutor.value =
          (res['rows'] as List).map((e) => Tutor.fromJson(e)).toList();
      update();
    } catch (e) {
      e.printError();
    }
  }

  void clearSearch() {
    controllers.forEach((key, value) {
      controllers[key]!.text = "";
    });
    valueContriesSelected.clear();
    nationality.forEach((key, value) {
      nationality[key] = false;
    });
    currentType = TitleString.all.obs;
    initData();
  }

  void navigateTutorDetail(Tutor tutor) {
    Get.toNamed(AppRoutes.TEACHER_DETAIL, arguments: {'id': tutor.userId});
  }

  void getDataSchedule({page = 1}) async {
    try {
      final res = await _userService.getSchedule(page: page);
      schedules.value = (res['data'] == null)
          ? []
          : (res['data']['rows'] as List)
              .map((e) => Schedule.fromJson(e))
              .toList();
    } catch (e) {
      print(e);
    }
  }

  void renderUpComming() {
    if (schedules.value.isNotEmpty) {
      int timeStart =
          schedules[0].scheduleDetailInfo?.scheduleInfo?.startTimestamp ?? 0;
      upComming.value = DateFormat("HH:mm ss").format(
          DateTime.fromMillisecondsSinceEpoch(
              timeStart - DateTime.now().millisecondsSinceEpoch));
    }
  }

  void manageTeacherFavorite(String id) {
    _tutorService.manageTeacherFavorite(id);
  }

  bool favouriteTutor(String id) {
    for (var item in listFavouriteTutor) {
      if (item.secondId == id) {
        return true;
      }
    }
    return false;
  }

  void manageListFavouriteTutor(String id) {
    if (favouriteTutor(id)) {
      listFavouriteTutor.removeWhere((element) => element.secondId == id);
    } else {
      listFavouriteTutor.add(FavouriteTutor(secondId: id));
    }
  }

  void sortTutorList() {
    listTutor.sort((a, b) => a.rating.compareTo(b.rating) < 0 ? 1 : -1);
    listTutor.sort((a, b) => favouriteTutor(b.userId) ? 1 : -1);
  }
}
