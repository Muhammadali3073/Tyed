import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tyedapp/models/tyed_agreement_model.dart';

class GetTyedAgreementDataController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var isGetTyedAgreementDataLoading = false.obs;
  TyedAgreementsModel? tyedAgreementsModel;
  Rxn<TyedAgreementsModel> getTyedAgreementsRxModel =
      Rxn<TyedAgreementsModel>();

  final tyedAgreements = FirebaseFirestore.instance
      .collection('tyedAgreements')
      .withConverter<TyedAgreementsModel>(
        fromFirestore: (snapshot, _) =>
            TyedAgreementsModel.fromJson(snapshot.data()!),
        toFirestore: (tyedAgreement, _) => tyedAgreement.toJson(),
      );

  getTyedAgreementsData({userId}) async {
    isGetTyedAgreementDataLoading.value = true;
    tyedAgreementsModel = (await tyedAgreements
        .doc(userId ?? auth.currentUser!.uid)
        .get()
        .then((snapshot) => snapshot.data()));

    getTyedAgreementsRxModel.value = tyedAgreementsModel;

    isGetTyedAgreementDataLoading.value = false;
    log(getTyedAgreementsRxModel.value!.unpaidTyedAgreementsList.toString());
    log(getTyedAgreementsRxModel.value!.paidTyedAgreementsList.toString());
  }
}
