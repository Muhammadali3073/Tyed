class TyedQuestionsModel {
  String? addAnything;
  String? anythingElseTyed;
  String? assetsBelongOnlyYou;
  String? belongAssets;
  String? coOwnAssets;
  String? debtResponsible;
  String? futureSpouseLive;
  String? gettingTyedDate;
  String? jointCreditCard;
  String? personAddress;
  String? personName;
  String? separateAssets;
  String? separateDebt;
  String? spousalSupport;
  String? spouseName;
  String? spouseReceivingSupport;
  String? tyedMarriageEnds;
  String? youHaveChildren;
  String? youHavePets;
  String? youPassedAway;

  TyedQuestionsModel({
    this.addAnything,
    this.anythingElseTyed,
    this.assetsBelongOnlyYou,
    this.belongAssets,
    this.coOwnAssets,
    this.debtResponsible,
    this.futureSpouseLive,
    this.gettingTyedDate,
    this.jointCreditCard,
    this.personAddress,
    this.personName,
    this.separateAssets,
    this.separateDebt,
    this.spousalSupport,
    this.spouseName,
    this.spouseReceivingSupport,
    this.tyedMarriageEnds,
    this.youHaveChildren,
    this.youHavePets,
    this.youPassedAway,
  });

  TyedQuestionsModel.fromJson(Map<String, Object?> json)
      : this(
          youPassedAway: json['youPassedAway'] as String,
          addAnything: json['addAnything'] as String,
          anythingElseTyed: json['anythingElseTyed'] as String,
          assetsBelongOnlyYou: json['assetsBelongOnlyYou'] as String,
          belongAssets: json['belongAssets'] as String,
          youHavePets: json['youHavePets'] as String,
          youHaveChildren: json['youHaveChildren'] as String,
          tyedMarriageEnds: json['tyedMarriageEnds'] as String,
          spouseName: json['spouseName'] as String,
          spousalSupport: json['spousalSupport'] as String,
          separateDebt: json['separateDebt'] as String,
          separateAssets: json['separateAssets'] as String,
          personName: json['personName'] as String,
          personAddress: json['personAddress'] as String,
          jointCreditCard: json['jointCreditCard'] as String,
          coOwnAssets: json['coOwnAssets'] as String,
          futureSpouseLive: json['futureSpouseLive'] as String,
          debtResponsible: json['debtResponsible'] as String,
          gettingTyedDate: json['gettingTyedDate'] as String,
          spouseReceivingSupport: json['spouseReceivingSupport'] as String,
        );

  Map<String, Object?> toJson() {
    return {
      'youPassedAway': youPassedAway,
      'addAnything': addAnything,
      'anythingElseTyed': anythingElseTyed,
      'assetsBelongOnlyYou': assetsBelongOnlyYou,
      'belongAssets': belongAssets,
      'youHavePets': youHavePets,
      'youHaveChildren': youHaveChildren,
      'tyedMarriageEnds': tyedMarriageEnds,
      'spouseName': spouseName,
      'spousalSupport': spousalSupport,
      'separateDebt': separateDebt,
      'separateAssets': separateAssets,
      'personName': personName,
      'personAddress': personAddress,
      'jointCreditCard': jointCreditCard,
      'coOwnAssets': coOwnAssets,
      'futureSpouseLive': futureSpouseLive,
      'debtResponsible': debtResponsible,
      'gettingTyedDate': gettingTyedDate,
      'spouseReceivingSupport': spouseReceivingSupport,
    };
  }
}
