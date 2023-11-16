// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Widgets/CustomAppbar2.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomPdfRow.dart';
import '../../viewModel/GetUserDataController/GetUserDataController.dart';

class YourTiedAgreement extends StatefulWidget {
  const YourTiedAgreement({super.key});

  @override
  State<YourTiedAgreement> createState() => _YourTiedAgreementState();
}

class _YourTiedAgreementState extends State<YourTiedAgreement> {
  GetUserDataController getUserDataController =
      Get.find(tag: 'getUserDataController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            CustomAppBar2(
              isBack: true,
              height: Get.height * 0.1,
              titleText: 'Your Tyed Agreement',
            ),
            SizedBox(
              height: Get.height * 0.015,
            ),
            getUserDataController.getUserDataRxModel.value!.tyedAgreementsList!
                        .tyedAgreements !=
                    null
                ? Flexible(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: getUserDataController.getUserDataRxModel.value!
                          .tyedAgreementsList!.tyedAgreements!.length,
                      itemBuilder: (BuildContext context, int index) {
                        List<String> isPaymentCheck = getUserDataController
                            .getUserDataRxModel
                            .value!
                            .tyedAgreementsList!
                            .tyedAgreementPayment![index]
                            .toString()
                            .split(',')
                            .toList();
                        log(isPaymentCheck.toString());

                        return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.05, vertical: 6),
                            child: CustomPdfRow(
                              onTap: () {
                                if (isPaymentCheck[1] == 'false') {
                                  Get.toNamed(RoutesName
                                      .PaymentPlanTyedAgreementScreen);
                                } else {
                                  Get.toNamed(RoutesName.NetworkPdfViewer,
                                      arguments: getUserDataController
                                          .getUserDataRxModel
                                          .value!
                                          .tyedAgreementsList!
                                          .tyedAgreements![index]);
                                }
                              },
                              column1: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Tyed agreement ${index + 1}",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CustomElevatedButton(
                                        style: TextStyle(fontSize: 8),
                                        text: "Download",
                                        height: 17,
                                        colors: AppColorsConstants.AppMainColor,
                                        onpress: () {
                                          if (isPaymentCheck[1] == 'false') {
                                            Get.toNamed(RoutesName
                                                .PaymentPlanTyedAgreementScreen);
                                          } else {
                                            Get.toNamed(
                                                RoutesName.NetworkPdfViewer,
                                                arguments: getUserDataController
                                                    .getUserDataRxModel
                                                    .value!
                                                    .tyedAgreementsList!
                                                    .tyedAgreements![index]);
                                          }
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: Get.width * 0.03),
                                        child: CustomElevatedButton(
                                          style: TextStyle(
                                            fontSize: 8,
                                          ),
                                          text: "Share",
                                          height: 17,
                                          colors:
                                              AppColorsConstants.AppMainColor,
                                          onpress: () {
                                            if (isPaymentCheck[1] == 'false') {
                                              Get.toNamed(RoutesName
                                                  .PaymentPlanTyedAgreementScreen);
                                            } else {
                                              Get.toNamed(
                                                  RoutesName.NetworkPdfViewer,
                                                  arguments: getUserDataController
                                                      .getUserDataRxModel
                                                      .value!
                                                      .tyedAgreementsList!
                                                      .tyedAgreements![index]);
                                            }
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
                                  isPaymentCheck[1] == 'false'
                                      ? 'Buy'
                                      : 'View',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: isPaymentCheck[1] == 'false'
                                        ? AppColorsConstants.AppMainColor
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            )); // Replace this with your actual widget
                      },
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: Text(
                        'You have no Tyed Agreement yet.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
