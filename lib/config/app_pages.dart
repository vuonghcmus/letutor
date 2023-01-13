import 'package:get/get_navigation/src/routes/get_route.dart';

import '../ui/change_password/change_password.dart';
import '../ui/change_password/change_password_bingding.dart';
import '../ui/course_detail/course_detail.dart';
import '../ui/course_detail/course_detail_binding.dart';
import '../ui/courses/courses.dart';
import '../ui/courses/courses_binding.dart';
import '../ui/dash_board/dash_board_binding.dart';
import '../ui/dash_board/dash_board_list.dart';
import '../ui/drawer/drawer_list.dart';
import '../ui/drawer/drawer_list_binding.dart';
import '../ui/forgot_password/forgot_password_binding.dart';
import '../ui/forgot_password/forgot_password.dart';
import '../ui/login/login.dart';
import '../ui/login/login_binding.dart';
import '../ui/profile/profile.dart';
import '../ui/profile/profile_binding.dart';
import '../ui/register/register.dart';
import '../ui/register/register_binding.dart';
import '../ui/schedule/schedule.dart';
import '../ui/schedule/schedule_binding.dart';
import '../ui/teacher_detail/teacher_detail.dart';
import '../ui/teacher_detail/teacher_detail_binding.dart';

class AppRoutes {
  static String LOGIN = '/login';
  static String REGISTER = '/register';
  static String FORGOT_PASSWORD = '/forgot_password';
  static String PROFILE = '/profile';
  static String CHANGE_PASSWORD = '/change_password';
  static String TEACHER_DETAIL = '/teacher_detail';
  static String DASH_BOARD_LIST = '/dash_board_list';
  static String DRAWER = '/drawer';
  static String COURSES = '/courses';
  static String COURSE_DETAIL = '/course_detail';
  static String SCHEDULE = '/schedule';
}

class AppPages {
  static final pages = <GetPage>[
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => Login(),
        binding: LoginPageBinding()),
    GetPage(
        name: AppRoutes.REGISTER,
        page: () => Register(),
        binding: RegisterBinding()),
    GetPage(
        name: AppRoutes.FORGOT_PASSWORD,
        page: () => ForgotPassword(),
        binding: ForgotPasswordBinding()),
    GetPage(
        name: AppRoutes.DASH_BOARD_LIST,
        page: () => DashBoardList(),
        binding: DashBoardBinding()),
    GetPage(
        name: AppRoutes.TEACHER_DETAIL,
        page: () => TeacherDetail(),
        binding: TeacherDetailBinding()),
    GetPage(
        name: AppRoutes.DRAWER,
        page: () => DrawerList(),
        binding: DrawerListBinding()),
    GetPage(
        name: AppRoutes.CHANGE_PASSWORD,
        page: () => ChangePassword(),
        binding: ChangePasswordBinding()),
    GetPage(
        name: AppRoutes.PROFILE,
        page: () => Profile(),
        binding: ProfileBinding()),
    GetPage(
        name: AppRoutes.COURSES,
        page: () => Courses(),
        binding: CoursesBinding()),
    GetPage(
        name: AppRoutes.COURSE_DETAIL,
        page: () => CourseDetail(),
        binding: CourseDetailBinding()),
    GetPage(
        name: AppRoutes.SCHEDULE,
        page: () => Schedule(),
        binding: ScheduleBinding()),
  ];
}
