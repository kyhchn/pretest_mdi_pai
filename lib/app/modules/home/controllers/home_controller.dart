import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest_mdi_pai/app/data/model/bulk_user.dart';
import 'package:pretest_mdi_pai/app/data/repository/user_repository.dart';

class HomeController extends GetxController {
  final repository = UserRepository();
  final isLoading = false.obs;
  final limit = 0.obs;
  final nameEditingController = TextEditingController();
  final RxList<BulkUser> users = <BulkUser>[].obs;

  String get name => nameEditingController.text;
  bool get isAll => limit.value == 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    fetch();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetch() async {
    isLoading(true);
    if (name.isNotEmpty) {
      final data = await repository.searchUsers(name, limit: limit.value);
      if (data != null) {
        users.assignAll(data);
      }
    } else {
      final data = await repository.getUsers(limit: limit.value);
      if (data != null) {
        users.assignAll(data);
      }
    }
    isLoading(false);
  }

  Future<void> search() async {
    isLoading(true);
    final data = await repository.searchUsers(name, limit: limit.value);
    if (data != null) {
      users.assignAll(data);
    }
    isLoading(false);
  }
}
