import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/chatroom/chatroom_view.dart';
import 'package:travellio/app/screens/home/home_view.dart';
import 'package:travellio/app/screens/saved_trips/saved_trips_view.dart';
import 'package:travellio/app/utils/app_colors.dart';
import 'package:travellio/app/utils/buildLayout/buildLayout_controller.dart';

class BuildLayout extends GetView<BuildLayoutController> {
  final List<Widget> pageList = [
    HomeView(),
    SavedTrips(),
    Chatroom(),
    HomeView(),
    HomeView(),
  ];

  BuildLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: pageList[controller.selectedIndex.value],
        extendBody: true,
        bottomNavigationBar: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DotNavigationBar(
            itemPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            items: [
              DotNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: AppColor.botomNavBarItem,
                ),
              ),
              DotNavigationBarItem(
                icon: Icon(
                  Icons.location_on,
                  color: AppColor.botomNavBarItem,
                ),
              ),
              DotNavigationBarItem(
                icon: Icon(
                  Icons.chat_rounded,
                  color: AppColor.botomNavBarItem,
                ),
              ),
              DotNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: AppColor.botomNavBarItem,
                ),
              ),
              DotNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: AppColor.botomNavBarItem,
                ),
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: AppColor.weirdBlue,
            onTap: controller.changeIndex,
          ),
        ),
      );
    });
  }
}
