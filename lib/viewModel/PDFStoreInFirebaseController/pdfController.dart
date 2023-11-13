import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constant/Constants/colors/Constants.dart';
import '../GetUserDataController/GetUserDataController.dart';

class PDFController extends GetxController {
  GetUserDataController getUserDataController =
      Get.put(GetUserDataController(), tag: 'getUserDataController');

  var isPDFControllerLoading = false.obs;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadTyedAgreementsToFirebaseStorage({pdfs}) async {
    try {
      List<String> tyedAgreementsListUrl = [];
      for (int i = getUserDataController
              .getUserDataRxModel.value!.tyedAgreementsList!.length;
          i < getUserDataController
              .getUserDataRxModel.value!.tyedAgreementsList!.length+1;
          i++) {
        final pdf = pdfs;
        final fileName = '${auth.currentUser!.uid}_$i.pdf';
        final Reference storageRef =
            storage.ref().child('tyed_agreement_folder/$fileName');
        await storageRef.putData(pdf);

        // Get the download URL for the uploaded image
        String imageUrl = await storageRef.getDownloadURL();
        tyedAgreementsListUrl.add(imageUrl);
        // Now you can use 'imageUrl' for further processing, like storing it in Firestore.

        log('Download URL for $fileName: $tyedAgreementsListUrl');
      }

      // Add user data in fire-store
      final dataToUpdate = {
        'tyedAgreementsList': tyedAgreementsListUrl,
      };

      return await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .update(dataToUpdate)
          .then(
        (value) {
          getUserDataController.getUserData();
          Get.snackbar('Success', 'User Update Successfully.',
              colorText: Colors.white,
              backgroundColor:
                  AppColorsConstants.AppMainColor.withOpacity(0.5));
          isPDFControllerLoading.value = false;
          log("User Updated");
        },
      ).catchError((error) {
        isPDFControllerLoading.value = false;
        log("Failed to add user: $error");
      });
    } catch (e) {
      isPDFControllerLoading.value = false;
      log('Error uploading images to Firebase Storage: $e');
    }
  }
}
