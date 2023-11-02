// ignore_for_file: must_be_immutable, invalid_use_of_protected_member

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Widgets/CustomAppBar.dart';
import '../../Widgets/CustomButton.dart';

import '../../Widgets/RectangularButton.dart';

import '../../Widgets/RoundedButton2.dart';
import '../../viewModel/TyedQuestionsController/TyedQuestionsController.dart';

class AssetsScreen extends StatefulWidget {
  const AssetsScreen({Key? key}) : super(key: key);

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  TyedQuestionsController tyedQuestionsController =
      Get.find(tag: 'tyedQuestionsController');
  List images = ["assets/house.svg", "assets/car.svg", "assets/money.svg"];

  List title = ["Real Estate", "Vehicle", "Financial (investment, etc.)"];

  TextEditingController detailRSController = TextEditingController();

  RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: CustomAppBar(
            svgImagePath: 'assets/30%.svg',
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
                        color: Colors
                            .white, // Set the background color of the container

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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  tyedQuestionsController.tyedQuestionsRxModel
                                          .value!.assetsBelongOnlyYou
                                          .toString() ??
                                      "What assets belong only to you?",
                                  style: AppTextConstant.SimpleStyle,
                                ),
                                Image.asset("assets/group3.png")
                              ],
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
                                    child: GestureDetector(
                                      onTap: () {
                                        selectedIndex.value = index;
                                      },
                                      child: Obx(() => Container(
                                            width: Get.width,
                                            height: Get.height * 0.065,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: selectedIndex.value ==
                                                          index
                                                      ? AppColorsConstants
                                                          .AppMainColor
                                                      : Colors.white),
                                              color: Colors.white,
                                              // Set the background color of the container

                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  // Color of the shadow

                                                  spreadRadius: 5,
                                                  // Spread radius

                                                  blurRadius: 7,
                                                  // Blur radius

                                                  offset: Offset(0,
                                                      2), // Offset of the shadow
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          Get.width * 0.02,
                                                      vertical:
                                                          Get.height * 0.01),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Transform.scale(
                                                            scaleX: 1.2,
                                                            scaleY: 1.2,
                                                            child: SvgPicture
                                                                .asset(
                                                              images[index],
                                                            )),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 20),
                                                          child: Text(
                                                            title[index],
                                                            style:
                                                                AppTextConstant
                                                                    .SimpleStyle,
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.014,
                            ),
                            Obx(
                              () => Text(
                                "What are the details of this ${title[selectedIndex.value]}?",
                                style: AppTextConstant.SimpleStyle,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.008,
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
                                controller: detailRSController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    border: InputBorder.none),
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
                      title: "Add another separate asset",
                      onpress: () {},
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomElevatedButton(
                        onpress: () {
                          Get.toNamed(RoutesName.YesNoScreen);
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
