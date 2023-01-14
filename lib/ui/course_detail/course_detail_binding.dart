class CourseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseDetailController>(() => CourseDetailController());
  }
}
