// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Constant/Constants/founts/Constants.dart';
import '../../Widgets/CustomAppBar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomTextField.dart';
import '../../viewModel/PDFStoreInFirebaseController/pdfController.dart';
import '../../viewModel/TyedQuestionsController/TyedQuestionsController.dart';
import '../PdfViewer/text_to_pdf.dart';

class YourAndSpouseSign extends StatefulWidget {
  const YourAndSpouseSign({Key? key}) : super(key: key);

  @override
  State<YourAndSpouseSign> createState() => _YourAndSpouseSignState();
}

class _YourAndSpouseSignState extends State<YourAndSpouseSign> {
  PDFController pdfController = Get.find(tag: 'pdfController');

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

  // Date Code
  TextEditingController dateController = TextEditingController();

  selectDOB(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      String formattedDate = DateFormat('dd MMM yyyy').format(picked);
      dateController.text = formattedDate.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Signature',
                        style: AppTextConstant.SimpleStyle,
                      ),
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
                      Text(
                        'Spouse\'s Signature',
                        style: AppTextConstant.SimpleStyle,
                      ),
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
                  Text(
                    "Select Date",
                    style: AppTextConstant.SimpleStyle,
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Container(
                      width: 130,
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
                      child: TextFormField(
                          textAlign: TextAlign.center,
                          onTap: () {
                            selectDOB(context);
                          },
                          controller: dateController,
                          keyboardType: TextInputType.datetime,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: "DD  MM YYY",
                            hintStyle: AppTextConstant.hintText,
                            border:
                                InputBorder.none, // Remove the outline border
                          ))),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: pdfController.isPDFControllerLoading.value
                        ? SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                                color: AppColorsConstants.AppMainColor),
                          )
                        : CustomElevatedButton(
                            onpress: () async {
                              Get.toNamed(RoutesName.DownloadScreen);



                              // if (spouseSignatureController.isNotEmpty &&
                              //     yourSignatureController.isNotEmpty) {
                              //   if (dateController.text.isNotEmpty) {
                              //     pdfController.isPDFControllerLoading.value =
                              //         true;
                              //     spouseSignatureImage();
                              //     personSignatureImage();
                              //     tyedQuestionsController.tyedAnswersModel
                              //             .dateSignatureAnswer =
                              //         dateController.text;
                              //
                              //     await pdfController
                              //         .uploadTyedAgreementsToFirebaseStorage(
                              //             pdfs: await makePdf());
                              //   } else {
                              //     Get.snackbar('Required', 'Date is Required',
                              //         colorText: Colors.white,
                              //         backgroundColor: AppColorsConstants
                              //             .AppMainColor.withOpacity(0.5));
                              //   }
                              // } else {
                              //   Get.snackbar('Required', 'Signature Required',
                              //       colorText: Colors.white,
                              //       backgroundColor: AppColorsConstants
                              //           .AppMainColor.withOpacity(0.5));
                              // }
                            },
                            text: "Done",
                            height: Get.height * 0.05,
                            width: Get.width * 0.4,
                            colors: AppColorsConstants.AppMainColor,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
