// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';
import 'package:tyedapp/models/tyed_answers_model.dart';

import '../../Widgets/AssetListviewBuilder.dart';
import '../../Widgets/CustomAppBar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/RoundedButton2.dart';
import '../../viewModel/TyedQuestionsController/TyedQuestionsController.dart';

class InheritScreen extends StatefulWidget {
  const InheritScreen({super.key});

  @override
  State<InheritScreen> createState() => _InheritScreenState();
}

class _InheritScreenState extends State<InheritScreen> {

  TyedQuestionsController tyedQuestionsController =
      Get.find(tag: 'tyedQuestionsController');
  List images = [
    "assets/spouse.svg",
    "assets/law.svg",
    "assets/spouse.svg",
  ];
  List title = [
    "Only what's specified in the Last Will\nof the deceased spouse",
    "A portion of the estate as determined\nby local law",
    "What's in the Last Will and additional\nitems"
  ];
  TextEditingController additionalInheritanceController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: CustomAppBar(
            svgImagePath: 'assets/90%.svg',
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.025,
            ),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // Set the background color of the container

                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.2), // Color of the shadow

                            spreadRadius: 5, // Spread radius

                            blurRadius: 7, // Blur radius

                            offset: const Offset(0, 2), // Offset of the shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height * 0.015,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    tyedQuestionsController.tyedQuestionsRxModel
                                            .value!.youPassedAway
                                            .toString() ??
                                        "If one of you passed away, what would the\ntyed surviving spouse inherit?",
                                    style: AppTextConstant.SimpleStyle,
                                  ),
                                ),
                                Image.asset("assets/group3.png")
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.015,
                            ),
                            SizedBox(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: images.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 4),
                                    child: Container(
                                      width: Get.width,
                                      height: Get.height * 0.065,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        // Set the background color of the container

                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            // Color of the shadow

                                            spreadRadius: 5,
                                            // Spread radius

                                            blurRadius: 7,
                                            // Blur radius

                                            offset: Offset(
                                                0, 2), // Offset of the shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Get.width * 0.02,
                                                vertical: Get.height * 0.01),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Transform.scale(
                                                      scaleX: 1.2,
                                                      scaleY: 1.2,
                                                      child: SvgPicture.asset(
                                                        images[index],
                                                      )),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20),
                                                    child: Text(
                                                      title[index],
                                                      style: AppTextConstant
                                                          .SimpleStyle,
                                                    ),
                                                  ),
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.014,
                            ),
                            Text(
                              "What additional inheritance rights would you like to include?",
                              style: AppTextConstant.SimpleStyle,
                            ),
                            SizedBox(
                              height: Get.height * 0.010,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // Set the background color of the container
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(
                                        0.2), // Color of the shadow
                                    spreadRadius: 5, // Spread radius
                                    blurRadius: 7, // Blur radius
                                    offset:
                                        Offset(0, 2), // Offset of the shadow
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: additionalInheritanceController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: Get.height * 0.010,
                                      vertical: Get.height * 0.010,
                                    )),
                                maxLines: 5,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.008,
                    ),
                    RoundedButton2(
                      title: "Add another inheritance right",
                      onpress: () {},
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomElevatedButton(
                        onpress: () {
                          Get.toNamed(RoutesName.AgreementScreen);
                        },
                        text: "Next",
                        height: Get.height * 0.05,
                        width: Get.width * 0.4,
                        colors: AppColorsConstants.AppMainColor,
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }
}
