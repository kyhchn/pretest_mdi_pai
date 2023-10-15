import 'package:get/get.dart';
import 'package:pretest_mdi_pai/app/data/constants/dummy.dart';
import 'package:pretest_mdi_pai/app/data/model/bulk_user.dart';
import 'package:pretest_mdi_pai/app/data/model/user.dart';
import 'package:pretest_mdi_pai/app/data/repository/user_repository.dart';
import 'package:url_launcher/url_launcher.dart';

enum CoordinateType { personal, company }

class UserDetailController extends GetxController {
  final dummyUser = Dummy.dummyUser;
  final bulkUser = Get.arguments as BulkUser;
  final repository = UserRepository();
  final user = Rxn<User>();
  final isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    fetch();
  }

  Future<void> fetch() async {
    isLoading(true);
    final data = await repository.getUser(bulkUser.id);
    if (data != null) {
      user.value = data;
    }
    isLoading(false);
  }

  void mail() {
    if (user.value == null) return;

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: user.value!.email,
    );

    launchUrl(emailLaunchUri);
  }

  void call() {
    if (user.value == null) return;

    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: user.value!.phone,
    );

    launchUrl(phoneLaunchUri);
  }

  Future<void> openMap(CoordinateType coordinateType) async {
    if (user.value == null) return;

    final lat = coordinateType == CoordinateType.personal
        ? user.value!.address.coordinates.lat
        : user.value!.company.address.coordinates.lat;

    final lng = coordinateType == CoordinateType.company
        ? user.value!.company.address.coordinates.lng
        : user.value!.address.coordinates.lng;
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    // ignore: deprecated_member_use
    if (await canLaunch(googleUrl)) {
      // ignore: deprecated_member_use
      await launch(googleUrl);
    } else {
      Get.snackbar('Error', 'Could not open the map.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
