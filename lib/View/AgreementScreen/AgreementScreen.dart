// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';
import 'package:tyedapp/models/tyed_answers_model.dart';

import '../../Widgets/CustomAppBar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/Dialoge.dart';
import '../../Widgets/RoundButon2.dart';
import '../../viewModel/TyedQuestionsController/TyedQuestionsController.dart';

class AgreementScreen extends StatefulWidget {
  const AgreementScreen({super.key});

  @override
  State<AgreementScreen> createState() => _YesNoScreenState();
}

class _YesNoScreenState extends State<AgreementScreen> {
  TyedQuestionsController tyedQuestionsController =
      Get.find(tag: 'tyedQuestionsController');
  TextEditingController detailController = TextEditingController();
  RxString selectedValue = "Yes".obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: const CustomAppBar(
            svgImagePath: 'assets/90%.svg',
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: Get.height,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tyedQuestionsController
                            .tyedQuestionsRxModel.value!.anythingElseTyed
                            .toString() ??
                        "Is there anything else you would like to include in this tyed agreement?",
                    style: AppTextConstant.SimpleStyle,
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  Obx(
                    () => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
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
                            offset: Offset(0, 2), // Offset of the shadow
                          ),
                        ],
                      ),
                      height: Get.height * 0.06,
                      width: Get.width,
                      child: Row(
                        children: [
                          Radio(
                            activeColor: AppColorsConstants.AppMainColor,
                            // Use your custom color here
                            value: "Yes",
                            groupValue: selectedValue.value,
                            onChanged: (value) {
                              selectedValue.value = 'Yes';
                            },
                          ),
                          Text(
                            "Yes",
                            style: TextStyle(
                              color: selectedValue.value == 'Yes'
                                  ? AppColorsConstants
                                      .AppMainColor // Use your custom color here
                                  : Colors.black,
                              // Use your custom color here
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Obx(() => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
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
                              offset: Offset(0, 2), // Offset of the shadow
                            ),
                          ],
                        ),
                        height: Get.height * 0.06,
                        width: Get.width,
                        child: Row(
                          children: [
                            Radio(
                              activeColor: AppColorsConstants.AppMainColor,
                              // Use your custom color here
                              value: "No",
                              groupValue: selectedValue.value,
                              onChanged: (value) {
                                selectedValue.value = 'No';
                              },
                            ),
                            Text(
                              "No",
                              style: TextStyle(
                                color: selectedValue.value == 'No'
                                    ? AppColorsConstants
                                        .AppMainColor // Use your custom color here
                                    : Colors.black,
                                // Use your custom color here
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        tyedQuestionsController
                                .tyedQuestionsRxModel.value!.addAnything
                                .toString() ??
                            "What would you like to add?",
                        style: AppTextConstant.SimpleStyle),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // Set the background color of the container
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              .withOpacity(0.2), // Color of the shadow
                          spreadRadius: 5, // Spread radius
                          blurRadius: 7, // Blur radius
                          offset: Offset(0, 2), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: detailController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          hintText:
                              "E.g. All shared living expenses will be paid from the joint bank account that both Parties deposit monthly funds into.",
                          hintStyle: AppTextConstant.hintText,
                          border: InputBorder.none),
                      maxLines: 7,
                    ),
                  ),
                  // SizedBox(
                  //   height: Get.height * 0.02,
                  // ),
                  // RoundedButon2(
                  //   title: 'Add Another Clause',
                  // ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomElevatedButton(
                        onpress: () {
                          if (detailController.text.isNotEmpty) {
                            tyedQuestionsController.tyedAnswersModel
                                    .anythingElseIncludeAnswer =
                                selectedValue.value;
                            tyedQuestionsController.tyedAnswersModel
                                .likeToAddAnswer = detailController.text;

                            Get.toNamed(RoutesName.YourAndSpouseSign);
                          } else {
                            Get.snackbar('Required', 'All fields are Required',
                                colorText: Colors.white,
                                backgroundColor:
                                    AppColorsConstants.AppMainColor.withOpacity(
                                        0.5));
                          }
                        },
                        text: "Next",
                        height: Get.height * 0.05,
                        width: Get.width * 0.4,
                        colors: AppColorsConstants.AppMainColor),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
