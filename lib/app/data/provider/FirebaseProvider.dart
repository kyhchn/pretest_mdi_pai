import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseProvider{
  FirebaseAuth auth = FirebaseAuth.instance;
  
  void register(String email, String password)async{
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar(
        "Success",
        "Account created successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    } 
    on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
      );
    }catch(e){
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}