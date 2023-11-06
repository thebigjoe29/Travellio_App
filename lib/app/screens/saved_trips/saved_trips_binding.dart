import 'package:get/get.dart';
import 'package:travellio/app/screens/saved_trips/saved_trips_controller.dart';

class SavedTripsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedTripsController>(
      () => SavedTripsController(),
    );
  }
}
