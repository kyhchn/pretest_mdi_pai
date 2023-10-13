import 'package:pretest_mdi_pai/app/data/provider/firebase_provider.dart';

class FirebaseRepository{
  final FirebaseProvider _firebaseProvider = FirebaseProvider();

  Future<void> register(String email, String password)async{
    await _firebaseProvider.register(email, password);
  }

  Future<void> login(String email, String password)async{
    await _firebaseProvider.login(email, password);
  }

  Future<void> googleSignIn()async{
    await _firebaseProvider.googleSignIn();
  }

  Future<void> signOut()async{
    await _firebaseProvider.signOut();
  }
}