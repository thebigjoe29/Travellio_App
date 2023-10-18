// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:travellio/app/screens/sign_up/sign_up_binding.dart';
import 'package:travellio/app/screens/sign_up/sign_up_view.dart';

import '../screens/login/login_binding.dart';
import '../screens/login/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => HomeView(),
    //   binding: HomeBinding(),
    //   transition: Transition.fadeIn,
    // ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
  ];
}
