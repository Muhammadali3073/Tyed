class FamilyDocumentsModel {
  bool? isPayment;
  String? activePlan;
  String? currentPlanUploadedDocuments;
  List<dynamic>? familyDocumentsList;

  FamilyDocumentsModel({
    this.isPayment,
    this.activePlan,
    this.currentPlanUploadedDocuments,
    this.familyDocumentsList,
  });

  FamilyDocumentsModel.fromJson(Map<String, Object?> json)
      : this(
          isPayment: json['isPayment'] as bool?,
          activePlan: json['activePlan'] as String?,
          currentPlanUploadedDocuments:
              json['currentPlanUploadedDocuments'] as String?,
          familyDocumentsList: json['familyDocumentsList'] as List<dynamic>?,
        );

  Map<String, Object?> toJson() {
    return {
      'isPayment': isPayment ?? false,
      'activePlan': activePlan ?? '',
      'currentPlanUploadedDocuments': currentPlanUploadedDocuments ?? '',
      'familyDocumentsList': familyDocumentsList ?? [],
    };
  }
}
