import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isVisable = false;
  bool isChacked = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  void visibilty() {
    isVisable = !isVisable;

    update();
  }

  void chacked() {
    isChacked = !isChacked;
    update();
  }

  void createAccount(String name,String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      update();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Error", "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", "The account already exists for that email");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      update();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Error", "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", "Wrong password provided for that user.");
      }
    }
  }

  void signOut() async {
    await auth.signOut();
  }

  void googleSignUp() {}

  void facebookSiginUp() {}

  void resetPassword() {}
}
