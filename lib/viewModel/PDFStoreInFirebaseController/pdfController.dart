import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../../Constant/Constants/routes/routesName.dart';
import '../GetUserDataController/GetUserDataController.dart';

class PDFController extends GetxController {
  GetUserDataController getUserDataController =
      Get.put(GetUserDataController(), tag: 'getUserDataController');

  var isPDFControllerLoading = false.obs;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadTyedAgreementsToFirebaseStorage({pdfs}) async {
    try {
      isPDFControllerLoading.value = true;
      String tyedAgreementsListUrl;
      final pdf = pdfs;
      final fileName =
          '${auth.currentUser!.uid}_${getUserDataController.getUserDataRxModel.value!.tyedAgreementsList!.length + 1}.pdf';
      final Reference storageRef =
          storage.ref().child('tyed_agreement_folder/$fileName');
      UploadTask uploadTask = storageRef.putData(pdf);

      // Get the download URL for the uploaded image
      TaskSnapshot snap = await uploadTask;
      String downloadUrl = await snap.ref.getDownloadURL();
      tyedAgreementsListUrl = downloadUrl;

      // Now you can use 'imageUrl' for further processing, like storing it in Firestore
      log('Download URL for $fileName: $tyedAgreementsListUrl');

      // Add user data in fire-store
      final dataToUpdate = {
        "tyedAgreementsList": FieldValue.arrayUnion([
          tyedAgreementsListUrl,
        ])
      };

      return await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .update(dataToUpdate)
          .then(
        (value) {
          // Call Update User data
          getUserDataController.getUserData();

          // Route of Download Screen
          Get.toNamed(RoutesName.DownloadScreen);

          // Get.snackbar('Success', 'User Update Successfully.',
          //     colorText: Colors.white,
          //     backgroundColor:
          //         AppColorsConstants.AppMainColor.withOpacity(0.5));

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
