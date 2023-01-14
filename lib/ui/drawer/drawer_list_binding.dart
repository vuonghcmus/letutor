class DrawerListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DrawerListController>(() => DrawerListController());
  }
}
