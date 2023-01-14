class API {
  static final String BASE_URL_PRO = 'https://sandbox.api.lettutor.com/';

  static final String BASE_URL_DEV = 'https://sandbox.api.lettutor.com/';

  static final String LOGIN = 'auth/login';
  static final LOGIN_OTHER_TYPE = 'auth/';
  static final String REGISTER = 'auth/register';
  static final String FORGOT_PASSWORD = 'user/forgotPassword';

  //tutor
  static final String ALL_TUTOR = 'tutor/more?perPage=9&page=%i';
  static final String SEARCH_TUTOR = 'tutor/search';
  static final String SCHEDULE = 'schedule';
  static final String GET_TUTOR = 'tutor/%s';
  static final String REVIEW_TUTOR = 'feedback/v2/%s?perPage=10&page=%i';
  static final String ADD_FAVOURITE_TEACHER = 'user/manageFavoriteTutor';
  static final String BOOKING = 'booking';
  static final String REPORT_TUTOR ='report';

  //scheduler
  static final String SCHEDULE_ALL = 'booking/list/student';
  static final String CANCEL_SCHEDULE =  'booking/schedule-detail';

  //course
  static final String CONTENT_CATEGORY_COURSE = 'content-category';
  static final String ALL_COURSE = 'course?page=%i&size=10&q=%s';
  static final String ALL_E_BOOK = 'e-book?page=%i&size=10&q=%s';
  static final String ALL_I_E_BOOk =
      'material/interactive-e-book?page=%i&size=10&q=%s';

  //profile
  static final String UP_AVATAR = 'user/uploadAvatar';
  static final String USER_INFO = 'user/info';

  static final TOTAL_TIME = 'call/total';

  //become teacher
  static final BECOME_TEACHER = 'tutor/register';
}
