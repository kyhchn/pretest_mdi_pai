import 'package:get/get.dart';
import 'package:pretest_mdi_pai/app/data/model/bulk_user.dart';
import 'package:pretest_mdi_pai/app/data/model/user.dart';
import 'package:pretest_mdi_pai/app/data/repository/user_repository.dart';

class UserDetailController extends GetxController {
  final bulkUser = Get.arguments as BulkUser;
  final repository = UserRepository();
  final user = Rxn<User>();
  final isLoading = false.obs;

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
    final data = await repository.getUser(bulkUser.id);
    if (data != null) {
      user.value = data;
    }
    isLoading(false);
  }
}
