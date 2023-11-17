// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Widgets/CustomAppbar2.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomPdfRow.dart';
import '../../viewModel/GetUserDataController/GetTyedAgreementsController.dart';

class YourTiedAgreement extends StatefulWidget {
  const YourTiedAgreement({super.key});

  @override
  State<YourTiedAgreement> createState() => _YourTiedAgreementState();
}

class _YourTiedAgreementState extends State<YourTiedAgreement> {
  GetTyedAgreementDataController tyedAgreementDataController =
      Get.find(tag: 'tyedAgreementDataController');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: Get.height * 0.08,
            centerTitle: true,
            elevation: 1.5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(15),
                    bottomStart: Radius.circular(15))),
            leading: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            title: const Text('Your Tyed Agreement',
                style: TextStyle(fontSize: 14, color: Colors.black)),
            backgroundColor: Colors.white),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
              child: AppBar(
                backgroundColor: Colors.white,
                bottom: TabBar(
                  indicatorColor: AppColorsConstants.AppMainColor,
                  tabs: const [
                    Tab(
                      child:
                          Text('Unpaid', style: TextStyle(color: Colors.black)),
                    ),
                    Tab(
                      child:
                          Text('Paid', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: tyedAgreementDataController
                        .getTyedAgreementsRxModel
                        .value!
                        .unpaidTyedAgreementsList!
                        .length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.05, vertical: 6),
                          child: CustomPdfRow(
                            onTap: () {
                              Get.toNamed(
                                  RoutesName.PaymentPlanTyedAgreementScreen);
                            },
                            column1: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        Get.toNamed(RoutesName
                                            .PaymentPlanTyedAgreementScreen);
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
                                        colors: AppColorsConstants.AppMainColor,
                                        onpress: () {
                                          Get.toNamed(RoutesName
                                              .PaymentPlanTyedAgreementScreen);
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            // column2: Container(
                            //   margin: EdgeInsets.only(right: 10),
                            //   child: Text(
                            //     'Pay',
                            //     style: TextStyle(
                            //       fontSize: 10,
                            //       fontWeight: FontWeight.bold,
                            //       color: AppColorsConstants.AppMainColor,
                            //     ),
                            //   ),
                            // ),
                          )); // Replace this with your actual widget
                    },
                  ),
                  ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: tyedAgreementDataController
                            .getTyedAgreementsRxModel
                            .value!
                            .paidTyedAgreementsList!
                            .isEmpty
                        ? 0
                        : tyedAgreementDataController.getTyedAgreementsRxModel
                            .value!.paidTyedAgreementsList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.05, vertical: 6),
                          child: CustomPdfRow(
                            onTap: () {
                              Get.toNamed(RoutesName.NetworkPdfViewer,
                                  arguments: tyedAgreementDataController
                                      .getTyedAgreementsRxModel
                                      .value!
                                      .paidTyedAgreementsList![0]);
                            },
                            column1: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        Get.toNamed(RoutesName.NetworkPdfViewer,
                                            arguments: tyedAgreementDataController
                                                .getTyedAgreementsRxModel
                                                .value!
                                                .paidTyedAgreementsList![0]);
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
                                        colors: AppColorsConstants.AppMainColor,
                                        onpress: () {
                                          Get.toNamed(
                                              RoutesName.NetworkPdfViewer,
                                              arguments: tyedAgreementDataController
                                                  .getTyedAgreementsRxModel
                                                  .value!
                                                  .paidTyedAgreementsList![0]);
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            // column2: Container(
                            //   margin: EdgeInsets.only(right: 10),
                            //   child: Text(
                            //     'Pay',
                            //     style: TextStyle(
                            //       fontSize: 10,
                            //       fontWeight: FontWeight.bold,
                            //       color: Colors.black,
                            //     ),
                            //   ),
                            // ),
                          )); // Replace this with your actual widget
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
