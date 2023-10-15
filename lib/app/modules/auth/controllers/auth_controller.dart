import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_mdi_pai/app/data/repository/firebase_repository.dart';
import 'package:pretest_mdi_pai/app/routes/app_pages.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final repository = FirebaseRepository();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final key = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  static AuthController get i => Get.find<AuthController>();

  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    print('called');
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    print('called');
    if (user != null) {
      await Get.offAllNamed(Routes.HOME);
    } else {
      if (Get.currentRoute != Routes.AUTH) {
        Get.offAllNamed(Routes.AUTH);
      }
    }
  }

  void login() async {
    if (key.currentState!.validate()) {
      isLoading(true);
      await repository.login(emailController.text, passwordController.text);
      isLoading(false);
    }
  }

  void googleLogin() {
    repository.googleSignIn();
  }

  void logOut() async {
    await repository.signOut();
  }
}
