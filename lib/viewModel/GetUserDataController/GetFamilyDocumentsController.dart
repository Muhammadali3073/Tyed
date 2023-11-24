import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tyedapp/models/family_document_model.dart';

class GetFamilyDocumentsDataController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var isGetFamilyDocumentsDataLoading = false.obs;
  FamilyDocumentsModel? familyDocumentsModel;
  Rxn<FamilyDocumentsModel> getFamilyDocumentsRxModel =
      Rxn<FamilyDocumentsModel>();

  final familyDocuments = FirebaseFirestore.instance
      .collection('familyDocumentsData')
      .withConverter<FamilyDocumentsModel>(
        fromFirestore: (snapshot, _) =>
            FamilyDocumentsModel.fromJson(snapshot.data()!),
        toFirestore: (familyDocumentsModel, _) => familyDocumentsModel.toJson(),
      );

  getFamilyDocumentsData({userId}) async {
    isGetFamilyDocumentsDataLoading.value = true;
    familyDocumentsModel = (await familyDocuments
        .doc(userId ?? auth.currentUser!.uid)
        .get()
        .then((snapshot) => snapshot.data()));

    getFamilyDocumentsRxModel.value = familyDocumentsModel;

    isGetFamilyDocumentsDataLoading.value = false;
    log('getFamilyDocumentsRxModel is Coming Fine. ${getFamilyDocumentsRxModel.value!.familyDocumentsList}');
  }
}
