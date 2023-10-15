import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_mdi_pai/app/data/repository/firebase_repository.dart';

class RegisterController extends GetxController {
  final repository = FirebaseRepository();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final isLoading = false.obs;
  final key = GlobalKey<FormState>();

  void register() async {
    if (key.currentState!.validate() &&
        passwordController.text == passwordConfirmController.text) {
      isLoading(true);
      await repository.register(emailController.text, passwordController.text);
      isLoading(false);
    }
  }
}
