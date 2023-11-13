// ignore_for_file: must_be_immutable, invalid_use_of_protected_member
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Widgets/CustomAppBar.dart';
import '../../Widgets/CustomButton.dart';
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

  RxInt currentIndex = 1.obs;
  List listOfAssets = [1].obs;

  TextEditingController detailRSController0 = TextEditingController();
  TextEditingController detailRSController1 = TextEditingController();
  TextEditingController detailRSController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: CustomAppBar(
            svgImagePath: 'assets/30%.svg',
          ),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ListView.builder(
                itemCount: listOfAssets.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, outerIndex) {
                  RxInt selectedIndex = 0.obs;
                  return Column(
                    children: [
                      outerIndex != 0
                          ? Divider(
                              color: Colors.grey,
                              height: 5,
                              thickness: 1,
                              indent: Get.height * 0.01,
                              endIndent: Get.height * 0.01,
                            )
                          : Container(),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.025,
                          vertical: Get.height * 0.01,
                        ),
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

                              offset:
                                  const Offset(0, 2), // Offset of the shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.03),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: outerIndex == 0
                                            ? Get.height * 0.012
                                            : 0),
                                    child: Text(
                                      tyedQuestionsController
                                              .tyedQuestionsRxModel
                                              .value!
                                              .assetsBelongOnlyYou
                                              .toString() ??
                                          "What assets belong only to you?",
                                      style: AppTextConstant.SimpleStyle,
                                    ),
                                  ),
                                  outerIndex == 0
                                      ? Container()
                                      : InkWell(
                                          onTap: () {
                                            listOfAssets.removeAt(outerIndex);
                                          },
                                          child:
                                              Image.asset("assets/group3.png"))
                                ],
                              ),
                              SizedBox(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: images.length,
                                  itemBuilder: (context, innerIndex) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4),
                                      child: GestureDetector(
                                        onTap: () {
                                          selectedIndex.value = innerIndex;
                                        },
                                        child: Obx(
                                          () => Container(
                                            width: Get.width,
                                            height: Get.height * 0.065,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: selectedIndex.value ==
                                                          innerIndex
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
                                                              images[
                                                                  innerIndex],
                                                            )),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 20),
                                                          child: Text(
                                                            title[innerIndex],
                                                            style:
                                                                AppTextConstant
                                                                    .SimpleStyle,
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
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
                                "What are the details?",
                                style: AppTextConstant.SimpleStyle,
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
                                      color: Colors.grey.withOpacity(0.2),
                                      // Color of the shadow
                                      spreadRadius: 5,
                                      // Spread radius
                                      blurRadius: 7,
                                      // Blur radius
                                      offset:
                                          Offset(0, 2), // Offset of the shadow
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: outerIndex == 0
                                      ? detailRSController0
                                      : outerIndex == 1
                                          ? detailRSController1
                                          : detailRSController2,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
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
                    ],
                  );
                },
              ),
              SizedBox(
                height: Get.height * 0.008,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Get.width * 0.025,
                ),
                child: RoundedButton2(
                  title: "Add another separate asset",
                  onpress: () {
                    if (listOfAssets.length < 3) {
                      listOfAssets.add(currentIndex.value++);
                    }
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(
                  onpress: () {
                    if (detailRSController0.text.isNotEmpty ||
                        detailRSController1.text.isNotEmpty ||
                        detailRSController2.text.isNotEmpty) {
                      tyedQuestionsController
                              .tyedAnswersModel.assetsBelongOnlyYouAnswer =
                          '${detailRSController0.text}${'\n${detailRSController1.text}'}${'\n${detailRSController2.text}'}';
                      Get.toNamed(RoutesName.YesNoScreen);
                    } else {
                      Get.snackbar('Required', 'All fields are Required',
                          colorText: Colors.white,
                          backgroundColor:
                              AppColorsConstants.AppMainColor.withOpacity(0.5));
                    }
                  },
                  text: "Next",
                  height: Get.height * 0.05,
                  width: Get.width * 0.4,
                  colors: AppColorsConstants.AppMainColor,
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
            ]),
          )),
    );
  }
}
