// ignore_for_file: file_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tyedapp/models/sign_up_model.dart';

import '../../Constant/Constants/routes/routesName.dart';
import '../../validations/validations.dart';

class SignupController extends GetxController {
  // TextEditingController for SignUp Field
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dOBController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isCheckedTC = false.obs;
  var isShowPassword = true.obs;
  var isSignUpLoading = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Set Fire-store date to Model
  final userData = FirebaseFirestore.instance
      .collection('users')
      .withConverter<UserModel>(
        fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
        toFirestore: (users, _) => users.toJson(),
      );

  // Sign Up Method
  signUpHandler(
      {userFirstName,
      userLastName,
      userEmail,
      userAddress,
      userPhoneNumber,
      userDOB,
      userPassword,
      timeStamp}) async {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        dOBController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        isCheckedTC.value != false) {
      try {
        isSignUpLoading.value = true;

        final userCredential = await auth.createUserWithEmailAndPassword(
            email: userEmail, password: userPassword);

        final User user = userCredential.user!;

        if (user.toString().isNotEmpty) {
          addUser(user.uid,
              profileImage: '',
              userFirstName: userFirstName,
              userLastName: userLastName,
              userEmail: userEmail,
              userAddress: userAddress,
              userPhoneNumber: userPhoneNumber,
              userDOB: userDOB,
              userPassword: userPassword,
              timeStamp: timeStamp);
        }
      } on FirebaseAuthException catch (e) {
        Get.snackbar(
            'Error', Validations.handleFirebaseAuthError(e.toString()));
        isSignUpLoading.value = false;
      }
    } else {
      Get.snackbar('Required', 'All fields are Required');
    }
  }

  // Add user data in fire-store
  Future<void> addUser(userID,
      {profileImage,
      userFirstName,
      userLastName,
      userEmail,
      userPhoneNumber,
      userAddress,
      userDOB,
      userPassword,
      timeStamp}) async {
    return await userData
        .doc(userID)
        .set(UserModel(
            userId: userID,
            profileImage: profileImage,
            userFirstName: userFirstName,
            userLastName: userLastName,
            userEmail: userEmail,
            userPhoneNumber: userPhoneNumber,
            userAddress: userAddress,
            userDOB: userDOB,
            userPassword: userPassword,
            timeStamp: timeStamp))
        .then(
      (value) {
        Get.snackbar('Success', 'User Registered Successfully.');
        Get.offAllNamed(RoutesName.SignIn);
        isSignUpLoading.value = false;
        log("User Added");
      },
    ).catchError((error) {
      isSignUpLoading.value = false;
      log("Failed to add user: $error");
    });
  }

  // Select DOB in View
  selectDOB(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      String formattedDate = DateFormat('dd MMM yyyy').format(picked);
      dOBController.text = formattedDate.toString();
    }
  }
}
