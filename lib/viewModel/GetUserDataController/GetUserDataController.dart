import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tyedapp/models/user_model.dart';

class GetUserDataController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var isGetUserDataLoading = false.obs;
  UserModel? userModel;
  Rxn<UserModel> getUserDataRxModel = Rxn<UserModel>();


  final userData = FirebaseFirestore.instance
      .collection('users')
      .withConverter<UserModel>(
    fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
    toFirestore: (users, _) => users.toJson(),
  );

  getUserData({userId}) async {
    isGetUserDataLoading.value = true;
    userModel = (await userData
        .doc(userId ?? auth.currentUser!.uid)
        .get()
        .then((snapshot) => snapshot.data()));

    getUserDataRxModel.value = userModel;

    isGetUserDataLoading.value = false;
    log('getUserDataRxModel is Coming Fine. ${getUserDataRxModel.value!.userFirstName}');
  }


}
