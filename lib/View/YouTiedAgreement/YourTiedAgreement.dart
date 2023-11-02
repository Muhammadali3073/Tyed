// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Widgets/CustomAppbar2.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomPdfRow.dart';

class YourTiedAgreement extends StatefulWidget {
  const YourTiedAgreement({super.key});

  @override
  State<YourTiedAgreement> createState() => _YourTiedAgreementState();
}

class _YourTiedAgreementState extends State<YourTiedAgreement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
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
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.05, vertical: 6),
                      child: CustomPdfRow(
                        column1: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "tyed agreement",
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
                                    Get.toNamed(RoutesName.PaymentMethod,);
                                    // Add your onPressed logic here
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
                                      Get.toNamed(
                                          RoutesName.ShareDocumentsScreen);
                                      // Add your onPressed logic here
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )); // Replace this with your actual widget
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
