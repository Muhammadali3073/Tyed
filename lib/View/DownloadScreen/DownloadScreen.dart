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
import '../../viewModel/GetUserDataController/GetUserDataController.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  GetUserDataController getUserDataController =
      Get.find(tag: 'getUserDataController');

  back() {
    Get.offAllNamed(RoutesName.CustomBottomNavigationBar);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
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
                      Get.offAllNamed(RoutesName.CustomBottomNavigationBar);
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
                      List<String> isPaymentCheck = getUserDataController
                          .getUserDataRxModel
                          .value!
                          .tyedAgreementsList!
                          .tyedAgreementPayment![getUserDataController
                                  .getUserDataRxModel
                                  .value!
                                  .tyedAgreementsList!
                                  .tyedAgreements!
                                  .length -
                              1]
                          .toString()
                          .split(',')
                          .toList();
                      log(isPaymentCheck[1].toString());

                      isPaymentCheck[1] == 'false'
                          ? Get.toNamed(
                              RoutesName.PaymentPlanTyedAgreementScreen)
                          : Get.toNamed(RoutesName.PdfViewer,
                              arguments: getUserDataController
                                  .getUserDataRxModel
                                  .value!
                                  .tyedAgreementsList!
                                  .tyedAgreements![getUserDataController
                                      .getUserDataRxModel
                                      .value!
                                      .tyedAgreementsList!
                                      .tyedAgreements!
                                      .length -
                                  1]);
                    },
                    column1: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tyed Agreement ${getUserDataController.getUserDataRxModel.value!.tyedAgreementsList!.tyedAgreements!.length}",
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
                                List<String> isPaymentCheck =
                                    getUserDataController
                                        .getUserDataRxModel
                                        .value!
                                        .tyedAgreementsList!
                                        .tyedAgreementPayment![
                                            getUserDataController
                                                    .getUserDataRxModel
                                                    .value!
                                                    .tyedAgreementsList!
                                                    .tyedAgreements!
                                                    .length -
                                                1]
                                        .toString()
                                        .split(',')
                                        .toList();
                                log(isPaymentCheck[1].toString());
                                isPaymentCheck[1] == 'false'
                                    ? Get.toNamed(RoutesName
                                        .PaymentPlanTyedAgreementScreen)
                                    : Get.toNamed(RoutesName.PdfViewer,
                                        arguments: getUserDataController
                                                .getUserDataRxModel
                                                .value!
                                                .tyedAgreementsList!
                                                .tyedAgreements![
                                            getUserDataController
                                                    .getUserDataRxModel
                                                    .value!
                                                    .tyedAgreementsList!
                                                    .tyedAgreements!
                                                    .length -
                                                1]);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.03),
                              child: CustomElevatedButton(
                                style: TextStyle(
                                  fontSize: 8,
                                ),
                                text: "Share",
                                height: 17,
                                colors: AppColorsConstants.AppMainColor,
                                onpress: () {
                                  List<String> isPaymentCheck =
                                      getUserDataController
                                          .getUserDataRxModel
                                          .value!
                                          .tyedAgreementsList!
                                          .tyedAgreementPayment![
                                              getUserDataController
                                                      .getUserDataRxModel
                                                      .value!
                                                      .tyedAgreementsList!
                                                      .tyedAgreements!
                                                      .length -
                                                  1]
                                          .toString()
                                          .split(',')
                                          .toList();
                                  log(isPaymentCheck[1].toString());
                                  isPaymentCheck[1] == 'false'
                                      ? Get.toNamed(RoutesName
                                          .PaymentPlanTyedAgreementScreen)
                                      : Get.toNamed(RoutesName.PdfViewer,
                                          arguments: getUserDataController
                                                  .getUserDataRxModel
                                                  .value!
                                                  .tyedAgreementsList!
                                                  .tyedAgreements![
                                              getUserDataController
                                                      .getUserDataRxModel
                                                      .value!
                                                      .tyedAgreementsList!
                                                      .tyedAgreements!
                                                      .length -
                                                  1]);
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
                        "Unpaid",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppColorsConstants.AppMainColor,
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
