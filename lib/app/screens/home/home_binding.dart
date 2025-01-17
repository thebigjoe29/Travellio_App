import 'package:get/get.dart';
import 'package:travellio/app/utils/buildLayout/buildLayout_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuildLayoutController>(
      () => BuildLayoutController(),
    );
  }
}
