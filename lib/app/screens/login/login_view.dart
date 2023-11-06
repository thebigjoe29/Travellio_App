// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:travellio/app/utils/app_colors.dart';
import 'package:travellio/app/widgets/tile.dart';
import './login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.weirdBlue,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: SvgPicture.asset('assets/design/ion_earthearth.svg'),
            ),
            Positioned(
              bottom: 0,
              child: SvgPicture.asset('assets/design/ion_earth_bottom.svg'),
            ),
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 30),
                        child: const Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontFamily: 'inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 350,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 40,
                                  left: 70,
                                  right: 70,
                                  bottom: 20,
                                ),
                                child: SvgPicture.asset(
                                    'assets/design/card_earth.svg'),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                width: MediaQuery.of(context).size.width * 0.75,
                                decoration: BoxDecoration(
                                  color: AppColor.weirdBlue,
                                  borderRadius: BorderRadius.circular(33),
                                ),
                                child: TextField(
                                  controller: controller.emailc,
                                  cursorColor: Colors.white,
                                  cursorWidth: 1,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontFamily: 'inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "example@domain.com",
                                    hintStyle: const TextStyle(
                                      fontFamily: 'inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.mail_outlined,
                                      color: Colors.white,
                                    ),
                                    suffixIcon: Obx(
                                      () => controller.emailIsValid.isTrue
                                          ? const Icon(
                                              Icons.check_circle_outline,
                                              color: Colors.white,
                                            )
                                          : const SizedBox.shrink(),
                                    ),
                                  ),
                                  onChanged: (text) {
                                    controller.isEmailValid(text);
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                width: MediaQuery.of(context).size.width * 0.75,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.weirdBlue, width: 2),
                                  borderRadius: BorderRadius.circular(33),
                                ),
                                child: Obx(
                                  () => TextField(
                                    controller: controller.passwordc,
                                    cursorColor: Colors.black,
                                    obscureText: controller.obscureText.value,
                                    cursorWidth: 1,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontFamily: 'inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.weirdBlue,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "***********",
                                      hintStyle: TextStyle(
                                        fontFamily: 'inter',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.weirdBlue,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock_outlined,
                                        color: AppColor.accentGrey,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: controller.obscureText.value !=
                                                false
                                            ? SvgPicture.asset(
                                                'assets/icons/show.svg',
                                                color: AppColor.weirdBlue,
                                              )
                                            : SvgPicture.asset(
                                                'assets/icons/hide.svg',
                                                color: AppColor.weirdBlue,
                                              ),
                                        onPressed: () {
                                          controller.obscureText.value =
                                              !controller.obscureText.value;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Obx(
                                      () => Checkbox(
                                          activeColor: AppColor.weirdBlue,
                                          value: controller.rememberMe.value,
                                          onChanged: (value) {
                                            controller.rememberMe.value =
                                                value ?? false;
                                          }),
                                    ),
                                    Text(
                                      "Remember me",
                                      style: TextStyle(
                                        color: AppColor.accentGrey,
                                        fontFamily: "inter",
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(width: 50),
                                    GestureDetector(
                                      // Add onTap functionality
                                      child: Text(
                                        "Forgot Password?",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: AppColor.accentGrey,
                                          fontFamily: "inter",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                padding: const EdgeInsets.only(bottom: 90),
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Obx(
                                  () => ElevatedButton(
                                      onPressed: () async {
                                        if (controller.isLoading.isFalse) {
                                          await controller.login();
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 18),
                                        backgroundColor: AppColor.weirdBlue,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(33),
                                        ),
                                      ),
                                      child: Text(
                                        controller.isLoading.isFalse
                                            ? 'Sign In'
                                            : "Signing In..",
                                        style: const TextStyle(
                                          fontFamily: 'inter',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                tile(
                                  imagePath: 'assets/images/google.png',
                                  onTap: () {},
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                tile(
                                    imagePath: 'assets/images/meta.png',
                                    onTap: () {}),
                                const SizedBox(
                                  width: 20,
                                ),
                                tile(
                                    imagePath: 'assets/images/apple.png',
                                    onTap: () {}),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an Account?",
                                  style: TextStyle(
                                    fontFamily: 'inter',
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Sign up here",
                                  style: TextStyle(
                                    fontFamily: 'inter',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
