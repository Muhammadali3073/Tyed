import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Constant/Constants/colors/Constants.dart';
import '../../Constant/Constants/routes/routesName.dart';
import '../../validations/validations.dart';
import '../GetUserDataController/GetFamilyDocumentsController.dart';
import '../GetUserDataController/GetTyedAgreementsController.dart';
import '../GetUserDataController/GetUserDataController.dart';

class SignInController extends GetxController {
  GetUserDataController getUserDataController =
      Get.put(GetUserDataController(), tag: 'getUserDataController');
  GetTyedAgreementDataController tyedAgreementDataController = Get.put(
      GetTyedAgreementDataController(),
      tag: 'tyedAgreementDataController');
  GetFamilyDocumentsDataController getFamilyDocumentsDataController = Get.put(
      GetFamilyDocumentsDataController(),
      tag: 'getFamilyDocumentsDataController');

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isShowPassword = true.obs;
  var isSignInLoading = false.obs;
  var isSignOutLoading = false.obs;

  final FirebaseAuth auth = FirebaseAuth.instance;

  signInHandler({userEmail, userPassword}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        isSignInLoading.value = true;

        final userCredential = await auth.signInWithEmailAndPassword(
            email: userEmail, password: userPassword);

        final User user = userCredential.user!;

        if (user.toString().isNotEmpty) {
          await prefs.setBool('isLogin', true);
          getUserDataController.getUserData(userId: user.uid);
          tyedAgreementDataController.getTyedAgreementsData(userId: user.uid);
          getFamilyDocumentsDataController.getFamilyDocumentsData(userId: user.uid);

          Get.offAllNamed(RoutesName.CustomBottomNavigationBar);
          isSignInLoading.value = false;
          log('Login Successfully');
          log('Login: ${prefs.getBool('isLogin')} ');
        }
      } on FirebaseAuthException catch (e) {
        Get.snackbar('Error', Validations.handleFirebaseAuthError(e.toString()),
            colorText: Colors.white,
            backgroundColor: AppColorsConstants.AppMainColor.withOpacity(0.5));
        isSignInLoading.value = false;
      }
    } else {
      Get.snackbar('Required', 'All fields are Required',
          colorText: Colors.white,
          backgroundColor: AppColorsConstants.AppMainColor.withOpacity(0.5));
    }
  }

  signOutHandler() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      isSignOutLoading.value = true;
      await auth.signOut().then(
        (value) async {
          await prefs.remove('isLogin');
          Get.offAllNamed(RoutesName.SignIn);
          Get.snackbar('Success', 'Signout Successfully.',
              colorText: Colors.white,
              backgroundColor:
                  AppColorsConstants.AppMainColor.withOpacity(0.5));
          log('Signout Successfully.');
          isSignOutLoading.value = false;
        },
      );
    } catch (e) {
      Get.snackbar('Error', Validations.handleFirebaseAuthError(e.toString()),
          colorText: Colors.white,
          backgroundColor: AppColorsConstants.AppMainColor.withOpacity(0.5));
      log(e.toString());
      isSignOutLoading.value = false;
    }
  }
}
