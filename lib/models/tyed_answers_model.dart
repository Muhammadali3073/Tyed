import 'dart:typed_data';

class TyedAnswersModel {
  String personNameQuestion;
  String personNameAnswer;

  String spouseNameQuestion;
  String spouseNameAnswer;

  String yourAddressQuestion;
  String yourAddressAnswer;

  String tyedDateQuestion;
  String tyedDateAnswer;

  String assetsBelongOnlyYouQuestion;
  String assetsBelongOnlyYouAnswer;

  String coOwnAssetsQuestion;
  String coOwnAssetsAnswer;

  String responsibleForPayingQuestion;
  String responsibleForPayingAnswer;

  String jointCreditCardQuestion;
  String jointCreditCardAnswer;

  String haveChildrenQuestion;
  String haveChildrenAnswer;

  String havePetQuestion;
  String havePetAnswer;

  String liveTogetherQuestion;
  String liveTogetherAnswer;

  String tyedEndsQuestion;
  String tyedEndsAnswer;

  String spousalSupportQuestion;
  String spousalSupportAnswer;

  String spousalSupportEndsQuestion;
  String spousalSupportEndsAnswer;

  String youPassedQuestion;
  String youPassedAnswer;

  String anythingElseIncludeQuestion;
  String anythingElseIncludeAnswer;

  String likeToAddQuestion;
  String likeToAddAnswer;

  Uint8List? personSignatureImage;
  Uint8List? spouseSignatureImage;

  TyedAnswersModel({
    this.personNameQuestion = 'What is your full name?',
    this.personNameAnswer = '',
    this.spouseNameQuestion = 'What is your Spouse full name?',
    this.spouseNameAnswer = '',
    this.yourAddressQuestion = 'What is your address?',
    this.yourAddressAnswer = '',
    this.tyedDateQuestion = 'When are you getting tyed?',
    this.tyedDateAnswer = '',
    this.assetsBelongOnlyYouQuestion = 'What assets belong only to you?',
    this.assetsBelongOnlyYouAnswer = '',
    this.coOwnAssetsQuestion = 'Do you co-own any assets?',
    this.coOwnAssetsAnswer = '',
    this.responsibleForPayingQuestion =
        'What debt are you responsible for paying?',
    this.responsibleForPayingAnswer = '',
    this.jointCreditCardQuestion =
        'Do you share any debt such as a joint credit card?',
    this.jointCreditCardAnswer = '',
    this.haveChildrenQuestion = 'Do either of you have children?',
    this.haveChildrenAnswer = '',
    this.havePetQuestion = 'Do you have any pets?',
    this.havePetAnswer = '',
    this.liveTogetherQuestion = 'Do you and your future spouse live together?',
    this.liveTogetherAnswer = '',
    this.tyedEndsQuestion =
        'If the tyed marriage ends, will either of you pay spousal support to the other?',
    this.tyedEndsAnswer = '',
    this.spousalSupportQuestion = 'What spousal support will be provided?',
    this.spousalSupportAnswer = '',
    this.spousalSupportEndsQuestion =
        'Will spousal support end if the spouse receiving support enters a new commitment or common-law relationship?',
    this.spousalSupportEndsAnswer = '',
    this.youPassedQuestion =
        'If one of you passed away, what would the tyed surviving spouse inherit?',
    this.youPassedAnswer = '',
    this.anythingElseIncludeQuestion =
        'Is there anything else you would like to include in this tyed agreement?',
    this.anythingElseIncludeAnswer = '',
    this.likeToAddQuestion = 'What would you like to add?',
    this.likeToAddAnswer = '',
    this.personSignatureImage,
    this.spouseSignatureImage,
  });
}
