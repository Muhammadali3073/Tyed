// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Widgets/CustomAppBar.dart';
import '../../Widgets/CustomButton.dart';
import '../../viewModel/TyedQuestionsController/TyedQuestionsController.dart';

class YourAndSpouseSign extends StatefulWidget {
  const YourAndSpouseSign({Key? key}) : super(key: key);

  @override
  State<YourAndSpouseSign> createState() => _YourAndSpouseSignState();
}

class _YourAndSpouseSignState extends State<YourAndSpouseSign> {
  TyedQuestionsController tyedQuestionsController =
      Get.find(tag: 'tyedQuestionsController');
  final yourSignatureController = SignatureController(
    penStrokeWidth: 1.5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
  );

  final spouseSignatureController = SignatureController(
    penStrokeWidth: 1.5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
  );

  clearYourSignature() {
    yourSignatureController.clear();
  }

  clearSpouseSignature() {
    spouseSignatureController.clear();
  }

  spouseSignatureImage() async {
    if (spouseSignatureController.isNotEmpty) {
      tyedQuestionsController.tyedAnswersModel.spouseSignatureImage =
          await spouseSignatureController.toPngBytes();
    }
    log(tyedQuestionsController.tyedAnswersModel.spouseSignatureImage
        .toString());
  }

  personSignatureImage() async {
    if (yourSignatureController.isNotEmpty) {
      tyedQuestionsController.tyedAnswersModel.personSignatureImage =
          await yourSignatureController.toPngBytes();
    }
    log(tyedQuestionsController.tyedAnswersModel.personSignatureImage
        .toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsConstants.SecondaryColor,
      appBar: CustomAppBar(
        svgImagePath: 'assets/100%.svg',
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Your Signature'),
                    InkWell(
                      onTap: () {
                        clearYourSignature();
                      },
                      child: Text('clear',
                          style: TextStyle(
                              color: AppColorsConstants.AppMainColor)),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Signature(
                    controller: yourSignatureController,
                    height: Get.height * 0.18,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Spouse\'s Signature'),
                    InkWell(
                      onTap: () {
                        clearSpouseSignature();
                      },
                      child: Text('clear',
                          style: TextStyle(
                              color: AppColorsConstants.AppMainColor)),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Signature(
                    controller: spouseSignatureController,
                    height: Get.height * 0.18,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                CustomElevatedButton(
                  onpress: () {
                    if (spouseSignatureController.isNotEmpty &&
                        yourSignatureController.isNotEmpty) {
                      spouseSignatureImage();
                      personSignatureImage();
                      Get.toNamed(RoutesName.PaymentMethod, arguments: 'Tyed');
                    } else {
                      Get.snackbar('Required', 'Signature Required',
                          colorText: Colors.white,
                          backgroundColor:
                              AppColorsConstants.AppMainColor.withOpacity(0.5));
                    }
                  },
                  text: "Done",
                  height: Get.height * 0.05,
                  width: Get.width * 0.4,
                  colors: AppColorsConstants.AppMainColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
