class UserModel {
  String? userFirstName;
  String? userLastName;
  String? userEmail;
  String? userPhoneNumber;
  String? userAddress;
  String? userDOB;
  String? userPassword;
  String? userId;
  String? profileImage;
  String? timeStamp;
  TyedAgreements? tyedAgreementsList;

  UserModel({
    this.userFirstName,
    this.userLastName,
    this.userEmail,
    this.userPhoneNumber,
    this.userAddress,
    this.userDOB,
    this.userPassword,
    this.timeStamp,
    this.userId,
    this.profileImage,
    this.tyedAgreementsList,
  });

  UserModel.fromJson(Map<String, Object?> json)
      : this(
          userFirstName: json['firstName'] as String?,
          userLastName: json['lastName'] as String?,
          userEmail: json['email'] as String?,
          userPhoneNumber: json['phoneNumber'] as String?,
          userAddress: json['address'] as String?,
          userDOB: json['dOB'] as String?,
          userPassword: json['password'] as String?,
          userId: json['userId'] as String?,
          profileImage: json['profileImage'] as String?,
          timeStamp: json['timeStamp'] as String?,
          tyedAgreementsList: json['tyedAgreementsList'] != null
              ? TyedAgreements.fromJson(
              json['tyedAgreementsList'] as Map<String, Object?>)
              : null,
        );

  Map<String, Object?> toJson() {
    return {
      'firstName': userFirstName ?? '',
      'lastName': userLastName ?? '',
      'email': userEmail ?? '',
      'phoneNumber': userPhoneNumber ?? '',
      'address': userAddress ?? '',
      'dOB': userDOB ?? '',
      'password': userPassword ?? '',
      'timeStamp': timeStamp ?? '',
      'profileImage': profileImage ?? '',
      'userId': userId ?? '',
      'tyedAgreementsList': tyedAgreementsList?.toJson(),
    };
  }
}

class TyedAgreements {
  List<dynamic>? tyedAgreementPayment;
  List<dynamic>? tyedAgreements;

  TyedAgreements({
    this.tyedAgreementPayment,
    this.tyedAgreements,
  });

  TyedAgreements.fromJson(Map<String, Object?> json)
      : this(
          tyedAgreementPayment: json['tyedAgreementPayment'] as List<dynamic>?,
          tyedAgreements: json['tyedAgreements'] as List<dynamic>?,
        );

  Map<String, Object?> toJson() {
    return {
      'tyedAgreementPayment': tyedAgreementPayment ?? [],
      'tyedAgreements': tyedAgreements ?? [],
    };
  }
}
