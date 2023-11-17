class TyedAgreementsModel {
  List<dynamic>? unpaidTyedAgreementsList;
  List<dynamic>? paidTyedAgreementsList;

  TyedAgreementsModel({
    this.unpaidTyedAgreementsList,
    this.paidTyedAgreementsList,
  });

  TyedAgreementsModel.fromJson(Map<String, Object?> json)
      : this(
          unpaidTyedAgreementsList:
              json['unpaidTyedAgreementsList'] as List<dynamic>?,
          paidTyedAgreementsList:
              json['paidTyedAgreementsList'] as List<dynamic>?,
        );

  Map<String, Object?> toJson() {
    return {
      'unpaidTyedAgreementsList': unpaidTyedAgreementsList ?? [],
      'paidTyedAgreementsList': paidTyedAgreementsList ?? [],
    };
  }
}
