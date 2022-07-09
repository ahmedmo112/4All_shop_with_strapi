import 'package:firebase_auth/firebase_auth.dart';
import 'package:fshop/routes/routes.dart';
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

  User? get   userProfile =>  auth.currentUser;


  @override
  void onInit()async {
    await getUserData();
    super.onInit();
  }

 
  getUserData()async{
    userData = await authBox.read("userData")??{};
    displayUserName.value = userData["name"]??"";
    userEmail.value = userData["email"];
    userImage.value = userData["image"]??"";
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
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async{
        displayUserName.value = name;
        userEmail.value = email;
        authBox.write("userData", {
          "name":name,
          "email":email,
          "image": "",
        });
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
          .then((value) async{
        displayUserName.value = "";
        userEmail.value = email;
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
      }else{
        Get.snackbar("Error", e.toString());

      }
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
          "name":value.displayName!,
          "email":value.email,
          "image": value.photoUrl!,
        });

      GoogleSignInAuthentication googleSignInAuthentication = await value.authentication;
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
