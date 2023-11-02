import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tyedapp/models/sign_up_model.dart';

class GetUserDataController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var getUserDataLoading = false.obs;
  UserModel? userModel;
   Rxn<UserModel> getUserDataRxModel = Rxn<UserModel>();


  final userData = FirebaseFirestore.instance
      .collection('users')
      .withConverter<UserModel>(
    fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
    toFirestore: (users, _) => users.toJson(),
  );

  getUserData({userId}) async {
    getUserDataLoading.value = true;
    userModel = (await userData
        .doc(userId ?? auth.currentUser!.uid)
        .get()
        .then((snapshot) => snapshot.data()));
    getUserDataRxModel.value = userModel!;
    getUserDataLoading.value = false;
    log(getUserDataRxModel.value!.userEmail.toString());
  }


}
