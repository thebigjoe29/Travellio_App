import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/utils/app_colors.dart';
import 'package:travellio/app/utils/buildLayout/buildLayout_controller.dart';
import 'home_controller.dart';

class HomeView extends GetView<BuildLayoutController> {
  final HomeController homeController = Get.put(HomeController());

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.pageColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.05),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.05),
                            child: Text(
                              "Location",
                              style: TextStyle(
                                fontFamily: "inter",
                                color: AppColor.accentGrey,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.033),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 30,
                                  color: AppColor.locIconColor,
                                ),
                                Obx(() {
                                  final locationText =
                                      '${homeController.location.value}, ${homeController.country_obs.value} ';
                                  return Text(
                                    locationText,
                                    style: const TextStyle(
                                      fontFamily: "inter",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: screenWidth * 0.05, top: screenHeight * 0.02),
                      child: Icon(
                        Icons.notifications,
                        size: 25,
                        color: AppColor.notifIconColor,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
