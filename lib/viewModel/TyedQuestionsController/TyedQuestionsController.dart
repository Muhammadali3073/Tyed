import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../models/tyed_questions_model.dart';

class TyedQuestionsController extends GetxController {
  var getTyedQuestionsLoading = false.obs;
  TyedQuestionsModel? tyedQuestionsModel;
  final tyedQuestionsRxModel = Rxn<TyedQuestionsModel>();

  final tyedQuestions = FirebaseFirestore.instance
      .collection('tyedMarriageAgreement')
      .withConverter<TyedQuestionsModel>(
        fromFirestore: (snapshot, _) =>
            TyedQuestionsModel.fromJson(snapshot.data()!),
        toFirestore: (users, _) => users.toJson(),
      );

  getTyedQuestions() async {
    getTyedQuestionsLoading.value = true;
    tyedQuestionsModel = (await tyedQuestions
        .doc('tyedQuestions')
        .get()
        .then((snapshot) => snapshot.data()));
    tyedQuestionsRxModel.value = tyedQuestionsModel!;
    getTyedQuestionsLoading.value = false;
  }
}
