import 'package:get/get.dart';
import 'package:travellio/app/screens/chatroom/chatroom_controller.dart';
class ChatroomBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => Chatroomcontroller());
  }
}