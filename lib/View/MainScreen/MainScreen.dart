// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';
import 'package:tyedapp/viewModel/GetUserDataController/GetFamilyDocumentsController.dart';

import '../../Widgets/MainScreenWidget.dart';
import '../../viewModel/GetUserDataController/GetTyedAgreementsController.dart';
import '../../viewModel/GetUserDataController/GetUserDataController.dart';
import '../../viewModel/PDFStoreInFirebaseController/pdfController.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // PDFController pdfController = Get.find(tag: 'pdfController');

  GetUserDataController getUserDataController =
      Get.find(tag: 'getUserDataController');
  GetTyedAgreementDataController tyedAgreementDataController =
      Get.find(tag: 'tyedAgreementDataController');
  GetFamilyDocumentsDataController getFamilyDocumentsDataController =
      Get.find(tag: 'getFamilyDocumentsDataController');

  getUserDataMethod() {
    if (getUserDataController.getUserDataRxModel.value == null) {
      getUserDataController.getUserData();
    }
  }

  getTyedAgreementMethod() {
    if (tyedAgreementDataController.getTyedAgreementsRxModel.value == null) {
      tyedAgreementDataController.getTyedAgreementsData();
    }
  }

  getFamilyDocumentsMethod() {
    if (getFamilyDocumentsDataController.getFamilyDocumentsRxModel.value ==
        null) {
      getFamilyDocumentsDataController.getFamilyDocumentsData();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserDataMethod();
    getTyedAgreementMethod();
    getFamilyDocumentsMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => getUserDataController.isGetUserDataLoading.value
          ? Scaffold(
              body: Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                      color: AppColorsConstants.AppMainColor),
                ),
              ),
            )
          : Scaffold(
              backgroundColor: AppColorsConstants.AppMainColor,
              body: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/profile.svg'),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello ${getUserDataController.getUserDataRxModel.value!.userFirstName!.trim()} ${getUserDataController.getUserDataRxModel.value!.userLastName!.trim()}!',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Welcome to Tyed',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: getUserDataController.getUserDataRxModel
                                      .value!.profileImage!.isNotEmpty
                                  ? Container(
                                      height: Get.height * 0.13,
                                      width: Get.width * 0.13,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                getUserDataController
                                                    .getUserDataRxModel
                                                    .value!
                                                    .profileImage
                                                    .toString())),
                                        color: Colors.grey.withOpacity(0.5),
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                  : Container(
                                      height: Get.height * 0.13,
                                      width: Get.width * 0.13,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                          "assets/profileimagefinal.jpg",
                                        )),
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                          ),
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(RoutesName.CommitmentMilestone);
                              },
                              child: CustomCard(
                                text: 'Tyed Marriage\nAgreement',
                                imagePath: 'assets/mainpageimage1.svg',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(RoutesName.IntroScreen);
                                // Get.toNamed(RoutesName.FamilyDocumentsFolder, arguments: true);
                              },
                              child: CustomCard(
                                text: 'Add Family\nDocuments',
                                imagePath: 'assets/mainipage2.svg',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
