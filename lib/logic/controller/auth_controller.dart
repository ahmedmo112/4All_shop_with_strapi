import 'package:firebase_auth/firebase_auth.dart';
import 'package:fshop/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisable = false;
  bool isChacked = false;
  bool isSignedIn = false;

  String? displayUserName;
  var userImage;

  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();

  final GetStorage authBox = GetStorage();

  void visibilty() {
    isVisable = !isVisable;

    update();
  }

  void chacked() {
    isChacked = !isChacked;
    update();
  }

  void createAccount(String name, String email, String password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayUserName = name;
        auth.currentUser!.updateDisplayName(displayUserName);
      });
      update();
      Get.offNamed(Routes.mainScreen);
      isSignedIn = true;
      authBox.write("IsLogedIn", isSignedIn);
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
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName = auth.currentUser!.displayName;
      });
      update();
      Get.offNamed(Routes.mainScreen);
      isSignedIn = true;
      authBox.write("IsLogedIn", isSignedIn);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Error", "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", "Wrong password provided for that user.");
      }
    }
  }

  void signOut() async {
    try {
      await auth.signOut();  
      await googleSignIn.signOut();
      displayUserName = '';
      userImage = '';
      update();
      Get.offNamed(Routes.welcomeScreen);
      isSignedIn = false;
      authBox.write("IsLogedIn", isSignedIn);

    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void googleSignUp() async {
    await googleSignIn.signIn().then((value) {
      displayUserName = value!.displayName;
      userImage = value.photoUrl;

      update();

      Get.offNamed(Routes.mainScreen);

      isSignedIn = true;
      authBox.write("IsLogedIn", isSignedIn);

    }).catchError((e) {
      Get.snackbar("Error", e.toString());
    });
  }

  void facebookSiginUp() {}

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
      Get.snackbar(
          "Reset Password", "Please check your Email to reset your password..");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Error", "No user found for that email.");
      } else {
        Get.snackbar("Error", "There is something wrong.. ");
      }
    }
  }
}
