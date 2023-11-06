// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:travellio/app/utils/buildLayout/buildLayout_controller.dart';

class BuildLayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuildLayoutController>(
      () => BuildLayoutController(),
    );
  }
}
