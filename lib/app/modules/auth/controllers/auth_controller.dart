import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  static AuthController get i => Get.find<AuthController>();

  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

   _setInitialScreen(User? user) async {
    if (user != null) {
      await Get.offAllNamed("/home");
    } else {
      await Get.offAllNamed("/auth/login");
    }
  }

}
