import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_mdi_pai/app/data/model/bulk_user.dart';
import 'package:pretest_mdi_pai/app/data/repository/user_repository.dart';
import 'package:pretest_mdi_pai/app/modules/auth/controllers/auth_controller.dart';
import 'package:pretest_mdi_pai/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final authController = AuthController.i;
  final repository = UserRepository();
  final isLoading = false.obs;
  final limit = TextEditingController();
  final nameEditingController = TextEditingController();
  final RxList<BulkUser> users = <BulkUser>[].obs;
  final key = GlobalKey<FormState>();

  String get name => nameEditingController.text;
  bool get isAll => limit.text == '0' || limit.text.isEmpty;
  int? get limitInt => int.tryParse(limit.text);

  @override
  void onReady() {
    super.onReady();
    fetch();
  }

  Future<void> fetch() async {
    isLoading(true);
    if (!key.currentState!.validate()) {
      isLoading(false);
      return;
    }
    if (name.isNotEmpty) {
      final data = await repository.searchUsers(name, limit: limitInt ?? 0);
      if (data != null) {
        users.assignAll(data);
      }
    } else {
      final data = await repository.getUsers(limit: limitInt ?? 0);
      if (data != null) {
        users.assignAll(data);
      }
    }
    isLoading(false);
  }

  void logout() async {
    authController.logOut();
  }

  void showDetail(int index) {
    Get.toNamed(Routes.USER_DETAIL, arguments: users[index]);
  }

  void clear() {
    if (nameEditingController.text.isNotEmpty || limit.text.isNotEmpty) {
      nameEditingController.clear();
      limit.clear();
      fetch();
    }
  }
}
