
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseProvider{
  FirebaseAuth auth = FirebaseAuth.instance;
  
  Future<void> register(String email, String password)async{
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

  Future<void> login(String email, String password)async{
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar(
        "Success",
        "Login successfully",
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

  Future<void> googleSignIn()async{
    try {
      //trigger the authentication flow
      final googleUser = await GoogleSignIn().signIn();

      //obtain the auth details from the request
      final googleAuth = await googleUser!.authentication;

      //create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      //once signed in, return the userCredential
      await auth.signInWithCredential(credential);
      
      Get.snackbar(
        "Success",
        "Logged in successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
      
    } on FirebaseAuthException catch (e) {
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

  Future<void> signOut() async{
      await GoogleSignIn().signOut();
      await auth.signOut();
  }
}