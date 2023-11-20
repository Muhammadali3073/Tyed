// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';

import 'package:tyedapp/Constant/Constants/founts/Constants.dart';

import '../../Constant/Constants/routes/routesName.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomPdfRow.dart';
import '../../viewModel/GetUserDataController/GetTyedAgreementsController.dart';
import '../../viewModel/PDFStoreInFirebaseController/pdfController.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  GetTyedAgreementDataController tyedAgreementDataController =
      Get.find(tag: 'tyedAgreementDataController');

  back() {
    Get.offAllNamed(RoutesName.CustomBottomNavigationBar);
  }

  @override
  Widget build(BuildContext context) {
    var currentSelectUrl = tyedAgreementDataController.getTyedAgreementsRxModel
        .value!.unpaidTyedAgreementsList![tyedAgreementDataController
            .getTyedAgreementsRxModel.value!.unpaidTyedAgreementsList!.length -
        1];
    log(currentSelectUrl.toString());

    return Obx(
      () => tyedAgreementDataController.isGetTyedAgreementDataLoading.value
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
          : WillPopScope(
              onWillPop: () => back(),
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(children: [
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.offAllNamed(
                                RoutesName.CustomBottomNavigationBar);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new,
                              size: 15), // Fixed icon size
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.25,
                      width: Get.width * 0.5,
                      child: SvgPicture.asset("assets/downloadimage.svg"),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Almost done! Download and share your custom tyed agreement!",
                      style: AppTextConstant.SimpleStyle,
                    ),
                    SizedBox(
                      height: Get.height * 0.028,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomPdfRow(
                          onTap: () {
                            tyedAgreementDataController.getTyedAgreementsRxModel
                                    .value!.unpaidTyedAgreementsList!.isEmpty
                                ? Get.toNamed(
                                    RoutesName.PdfViewer,
                                    arguments: currentSelectUrl.toString()
                                  )
                                : tyedAgreementDataController
                                        .getTyedAgreementsRxModel
                                        .value!
                                        .unpaidTyedAgreementsList!
                                        .contains(currentSelectUrl)
                                    ? Get.toNamed(
                                        RoutesName
                                            .PaymentPlanTyedAgreementScreen,
                                        arguments: tyedAgreementDataController
                                                .getTyedAgreementsRxModel
                                                .value!
                                                .unpaidTyedAgreementsList!
                                                .length -
                                            1)
                                    : Get.toNamed(
                                        RoutesName.PdfViewer,
                                        arguments: currentSelectUrl.toString(),
                                      );
                          },
                          column1: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tyedAgreementDataController
                                        .getTyedAgreementsRxModel
                                        .value!
                                        .unpaidTyedAgreementsList!
                                        .isEmpty
                                    ? "Tyed Agreement ${tyedAgreementDataController.getTyedAgreementsRxModel.value!.paidTyedAgreementsList!.length}"
                                    : tyedAgreementDataController
                                            .getTyedAgreementsRxModel
                                            .value!
                                            .unpaidTyedAgreementsList!
                                            .contains(currentSelectUrl)
                                        ? "Tyed Agreement ${tyedAgreementDataController.getTyedAgreementsRxModel.value!.unpaidTyedAgreementsList!.length}"
                                        : "Tyed Agreement ${tyedAgreementDataController.getTyedAgreementsRxModel.value!.paidTyedAgreementsList!.length}",
                                style: TextStyle(fontSize: 12),
                              ),
                              Row(
                                children: [
                                  CustomElevatedButton(
                                    style: TextStyle(fontSize: 8),
                                    text: "Download",
                                    height: 17,
                                    colors: AppColorsConstants.AppMainColor,
                                    onpress: () {
                                      tyedAgreementDataController.getTyedAgreementsRxModel
                                          .value!.unpaidTyedAgreementsList!.isEmpty
                                          ? Get.toNamed(
                                          RoutesName.PdfViewer,
                                          arguments: currentSelectUrl.toString()
                                      )
                                          : tyedAgreementDataController
                                          .getTyedAgreementsRxModel
                                          .value!
                                          .unpaidTyedAgreementsList!
                                          .contains(currentSelectUrl)
                                          ? Get.toNamed(
                                          RoutesName
                                              .PaymentPlanTyedAgreementScreen,
                                          arguments: tyedAgreementDataController
                                              .getTyedAgreementsRxModel
                                              .value!
                                              .unpaidTyedAgreementsList!
                                              .length -
                                              1)
                                          : Get.toNamed(
                                        RoutesName.PdfViewer,
                                        arguments: currentSelectUrl.toString(),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: Get.width * 0.03),
                                    child: CustomElevatedButton(
                                      style: TextStyle(
                                        fontSize: 8,
                                      ),
                                      text: "Share",
                                      height: 17,
                                      colors: AppColorsConstants.AppMainColor,
                                      onpress: () {
                                        tyedAgreementDataController.getTyedAgreementsRxModel
                                            .value!.unpaidTyedAgreementsList!.isEmpty
                                            ? Get.toNamed(
                                            RoutesName.PdfViewer,
                                            arguments: currentSelectUrl.toString()
                                        )
                                            : tyedAgreementDataController
                                            .getTyedAgreementsRxModel
                                            .value!
                                            .unpaidTyedAgreementsList!
                                            .contains(currentSelectUrl)
                                            ? Get.toNamed(
                                            RoutesName
                                                .PaymentPlanTyedAgreementScreen,
                                            arguments: tyedAgreementDataController
                                                .getTyedAgreementsRxModel
                                                .value!
                                                .unpaidTyedAgreementsList!
                                                .length -
                                                1)
                                            : Get.toNamed(
                                          RoutesName.PdfViewer,
                                          arguments: currentSelectUrl.toString(),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          column2: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text(
                              tyedAgreementDataController
                                      .getTyedAgreementsRxModel
                                      .value!
                                      .unpaidTyedAgreementsList!
                                      .isEmpty
                                  ? "View"
                                  : tyedAgreementDataController
                                          .getTyedAgreementsRxModel
                                          .value!
                                          .unpaidTyedAgreementsList!
                                          .contains(currentSelectUrl)
                                      ? "Pay"
                                      : "View",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: tyedAgreementDataController
                                        .getTyedAgreementsRxModel
                                        .value!
                                        .unpaidTyedAgreementsList!
                                        .isEmpty
                                    ? Colors.black
                                    : tyedAgreementDataController
                                            .getTyedAgreementsRxModel
                                            .value!
                                            .unpaidTyedAgreementsList!
                                            .contains(currentSelectUrl)
                                        ? AppColorsConstants.AppMainColor
                                        : Colors.black,
                              ),
                            ),
                          ),
                        ))
                  ]),
                ),
              ),
            ),
    );
  }
}
