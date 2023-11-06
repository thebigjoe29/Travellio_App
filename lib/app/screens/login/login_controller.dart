import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../routes/app_pages.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool obscureText = true.obs;
  RxBool emailIsValid = false.obs;
  RxBool rememberMe = false.obs;

  TextEditingController emailc = TextEditingController();
  TextEditingController passwordc = TextEditingController();
  RxBool isGoogleSignInLoading = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  void isEmailValid(String email) {
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
    );
    if (emailRegex.hasMatch(email)) {
      emailIsValid.value = emailRegex.hasMatch(email);
    }
  }

  Future<void> login() async {
    if (emailc.text.isNotEmpty && passwordc.text.isNotEmpty) {
      isLoading.value = true;
      try {
        final credential = await auth.signInWithEmailAndPassword(
            email: emailc.text.trim(), password: passwordc.text);

        if (credential.user != null) {
          if (credential.user!.emailVerified) {
            isLoading.value = false;
            Get.offAllNamed(Routes.CHATROOM);
          } else {
            Get.defaultDialog(
              content: const Text("Send verification Email"),
              title: "Email Not Yet Verified!",
              textConfirm: "Send",
              textCancel: "Back",
              onCancel: () => Get.back(),
              onConfirm: () async {
                try {
                  await credential.user!.sendEmailVerification();
                  Get.back();
                  Get.snackbar("Success", "We've sent a verification email!");
                  isLoading.value = false;
                } catch (e) {
                  Get.snackbar("Success",
                      "Cant send verification email. Error because : ${e.toString()}");
                }
              },
              confirmTextColor: Colors.white,
              cancelTextColor: Colors.black,
              buttonColor: Colors.black,
            );
          }
        }
        isLoading.value = false;
       
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        if (e.code == 'user-not-found') {
          Get.snackbar("Error", "Account not found");
        } else if (e.code == 'wrong-password') {
          Get.snackbar("Error", "Wrong Password");
        }
      } catch (e) {
        Get.snackbar("Error", "Error because : ${e.toString()}");
      }
    } else {
      Get.snackbar("Error", "Empty Fields!");
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      isGoogleSignInLoading.value = true;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication gAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: gAuth.accessToken, idToken: gAuth.idToken);
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        if (userCredential.user != null) {
          if (userCredential.user!.emailVerified) {
            isGoogleSignInLoading.value = false;
            Get.offAllNamed(Routes.HOME);
          } else {
            // ignore: avoid_print
            print("BreakPoint");
          }
        }
        isGoogleSignInLoading.value = false;
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", "Error because : ${e.toString()}");

      isGoogleSignInLoading.value = false;
    }
  }
}
