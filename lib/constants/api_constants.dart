class API {
  static final String LOGIN = 'auth/login';
  static final String REGISTER = 'auth/register';
  static final String FORGOT_PASSWORD = 'user/forgotPassword';

  //tutor
  static final String ALL_TUTOR = 'tutor/more?perPage=9&page=%i';
  static final String SEARCH_TUTOR = 'tutor/search';
  static final String SCHEDULE = 'schedule';
  static final String GET_TUTOR = 'tutor/%s';
  static final String REVIEW_TUTOR = 'feedback/v2/%s?perPage=10&page=%i';

  //scheduler
  static final String SCHEDULE_ALL = 'booking/list/student';

  //course
  static final String CONTENT_CATEGORY_COURSE = 'content-category';
  static final String ALL_COURSE = 'course?page=%i&size=100';
  static final String ALL_E_BOOK = 'e-book?page=%i&size=10';
  static final String ALL_I_E_BOOk =
      'material/interactive-e-book?page=%i&size=10';

  //profile
  static final String UP_AVATAR = 'user/uploadAvatar';
  static final String USER_INFO = 'user/info';

  static final TOTAL_TIME = 'call/total';
}
