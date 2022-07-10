import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fshop/models/auth_model.dart';
import 'package:fshop/routes/routes.dart';
import 'package:fshop/services/auth_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisable = false;
  bool isChacked = false;
  bool isSignedIn = false;

  RxString displayUserName = "".obs;
  RxString userImage = "".obs;
  RxString userEmail = "".obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();

  final GetStorage authBox = GetStorage();
  Map userData = {};

  @override
  void onInit() async {
    await getUserData();
    super.onInit();
  }

  getUserData() async {
    userData = await authBox.read("userData") ?? {};
    displayUserName.value = userData["name"] ?? "";
    userEmail.value = userData["email"];
    userImage.value = userData["image"] ?? "";
    update();
  }

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
      await AuthServices.register(name: name, email: email, password: password)
          .then((value) async {
        AuthModel data = AuthModel.fromJson(json.decode(value));
        displayUserName.value = data.user!.username!;
        userEmail.value = data.user!.email!;
        userImage.value = data.user!.image!;
        authBox.write("userData", {
          "name": data.user!.username!,
          "email": data.user!.email!,
          "image": data.user!.image!,
        });
      });
      update();
      Get.offNamed(Routes.mainScreen);
      isSignedIn = true;
      authBox.write("IsLogedIn", isSignedIn);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await AuthServices.login(email: email, password: password).then((value) {
        AuthModel data = AuthModel.fromJson(json.decode(value));
        displayUserName.value = data.user!.username!;
        userEmail.value = data.user!.email!;
        userImage.value = data.user!.image!;
        authBox.write("userData", {
          "name": data.user!.username!,
          "email": data.user!.email!,
          "image": data.user!.image!,
        });
      });

      update();
      Get.offNamed(Routes.mainScreen);
      isSignedIn = true;
      authBox.write("IsLogedIn", isSignedIn);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      displayUserName.value = '';
      userImage.value = '';
      authBox.remove("userData");
      update();
      Get.offNamed(Routes.welcomeScreen);
      isSignedIn = false;
      authBox.write("IsLogedIn", isSignedIn);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void googleSignUp() async {
    await googleSignIn.signIn().then((value) async {
      displayUserName.value = value!.displayName!;
      userEmail.value = value.email;
      userImage.value = value.photoUrl!;
      authBox.write("userData", {
        "name": value.displayName!,
        "email": value.email,
        "image": value.photoUrl!,
      });

      GoogleSignInAuthentication googleSignInAuthentication =
          await value.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await auth.signInWithCredential(authCredential);

      Get.offNamed(Routes.mainScreen);

      isSignedIn = true;
      authBox.write("IsLogedIn", isSignedIn);
      update();
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
