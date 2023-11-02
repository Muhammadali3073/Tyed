import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tyedapp/viewModel/GetUserDataController/GetUserDataController.dart';
import '../../models/sign_up_model.dart';

class EditProfileController extends GetxController {
  GetUserDataController getUserDataController =
      Get.put(GetUserDataController(), tag: 'getUserDataController');

  // EditProfileScreen TextEditing Controllers
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  var selectedImage = Rx<File?>(null);

  var isUpdateProfileLoading = false.obs;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  String? profileImageUrl;

  // Update Fire-store date to Model
  final userData = FirebaseFirestore.instance
      .collection('users')
      .withConverter<UserModel>(
        fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
        toFirestore: (users, _) => users.toJson(),
      );

  // Update Profile Handler
  updateProfileHandler({
    userFirstName,
    userLastName,
    userEmail,
    userAddress,
    userDOB,
  }) async {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        dateController.text.isNotEmpty) {
      try {
        isUpdateProfileLoading.value = true;
        uploadProfileImageToFirebaseStorage(
          selectedImage.value,
          userFirstName: userFirstName,
          userLastName: userLastName,
          userEmail: userEmail,
          userAddress: userAddress,
          userDOB: userDOB,
        );
      } on FirebaseAuthException catch (e) {
        Get.snackbar('Error', e.toString());
        isUpdateProfileLoading.value = false;
      }
    } else {
      Get.snackbar('Required', 'All fields are Required');
    }
  }

  // Add user data in fire-store
  updateUserData({
    profileImage,
    userFirstName,
    userLastName,
    userEmail,
    userAddress,
    userDOB,
  }) async {
    final dataToUpdate = {
      'profileImage': profileImage,
      'firstName': userFirstName,
      'lastName': userLastName,
      'email': userEmail,
      'address': userAddress,
      'dOB': userDOB,
    };

    return await userData.doc(auth.currentUser!.uid).update(dataToUpdate).then(
      (value) {
        getUserDataController.getUserData();
        Get.snackbar('Success', 'User Update Successfully.');
        isUpdateProfileLoading.value = false;
        log("User Updated");
      },
    ).catchError((error) {
      isUpdateProfileLoading.value = false;
      log("Failed to add user: $error");
    });
  }

  // Upload Profile Image To FirebaseStorage
  Future<void> uploadProfileImageToFirebaseStorage(
    image, {
    userFirstName,
    userLastName,
    userEmail,
    userAddress,
    userDOB,
  }) async {
    try {
      final storage = FirebaseStorage.instance;

      final fileName = '${auth.currentUser!.uid}_image.jpg';
      final Reference storageRef = storage.ref().child('profile_images_folder/$fileName');
      await storageRef.putFile(image);

      // Get the download URL for the uploaded image
      profileImageUrl = await storageRef.getDownloadURL();
      log('Download URL for $fileName: $profileImageUrl');

      // Now you can use 'imageUrl' for further processing, like storing it in Firestore.
      await updateUserData(
        profileImage: profileImageUrl,
        userFirstName: userFirstName,
        userLastName: userLastName,
        userEmail: userEmail,
        userAddress: userAddress,
        userDOB: userDOB,
      );
    } catch (e) {
      log('Error uploading images to Firebase Storage: $e');
      isUpdateProfileLoading.value = false;
    }
  }

  // Select Date in View
  selectDOB(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      String formattedDate = DateFormat('dd MMM yyyy').format(picked);
      dateController.text = formattedDate.toString();
    }
  }

  // picking profile image
  pickedImage() async {
    final picker = ImagePicker();
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
        log(selectedImage.value.toString());
      } else {
        Get.snackbar("No Image", "Please Select Image");
      }
    } catch (e) {
      Get.snackbar("An Error", " ${e.toString()}");
    }
  }
}
