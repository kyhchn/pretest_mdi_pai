import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_mdi_pai/app/data/repository/firebase_repository.dart';

class RegisterController extends GetxController {
  final repository = FirebaseRepository();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final key = GlobalKey<FormState>();

  void register() {
    if (key.currentState!.validate() &&
        passwordController.text == passwordConfirmController.text) {
      repository.register(emailController.text, passwordController.text);
    }
  }
}
