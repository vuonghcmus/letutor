class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<DashBoardListController>(() => DashBoardListController());
    Get.put(DashBoardListController());
  }
}
