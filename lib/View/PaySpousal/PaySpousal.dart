// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';
import 'package:tyedapp/models/tyed_answers_model.dart';

import '../../Widgets/CustomAppBar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomContainer.dart';
import '../../viewModel/TyedQuestionsController/TyedQuestionsController.dart';

class PaySpousal extends StatefulWidget {
  const PaySpousal({super.key});

  @override
  State<PaySpousal> createState() => _PaySpousalState();
}

class _PaySpousalState extends State<PaySpousal> {
  TyedAnswersModel tyedAnswersModel = TyedAnswersModel();
  TyedQuestionsController tyedQuestionsController =
      Get.find(tag: 'tyedQuestionsController');
  RxString selectedValue = "Yes, specify".obs;
  RxString selectedValue1 = "Yes".obs;
  TextEditingController supportDetailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: AppColorsConstants.SecondaryColor,
          appBar: const CustomAppBar(
            svgImagePath: 'assets/90%.svg',
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        tyedQuestionsController
                                .tyedQuestionsRxModel.value!.tyedMarriageEnds
                                .toString() ??
                            "If the tyed marriage ends, will either of you pay spousal support to the other?",
                        style: AppTextConstant.SimpleStyle,
                      )),
                  SizedBox(
                    height: Get.height * 0.012,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors
                          .white, // Set the background color of the container
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
                    height: Get.height * 0.06,
                    width: Get.width,
                    child: Row(
                      children: [
                        Radio(
                          activeColor: AppColorsConstants
                              .AppMainColor, // Use your custom color here
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
                                : Colors.black, // Use your custom color here
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors
                          .white, // Set the background color of the container
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
                    height: Get.height * 0.06,
                    width: Get.width,
                    child: Row(
                      children: [
                        Radio(
                          activeColor: AppColorsConstants
                              .AppMainColor, // Use your custom color here
                          value: "Yes, specify",
                          groupValue: selectedValue.value,
                          onChanged: (value) {
                            selectedValue.value = 'Yes, specify';
                          },
                        ),
                        Text(
                          "Yes, specify",
                          style: TextStyle(
                            color: selectedValue.value == 'Yes, specify'
                                ? AppColorsConstants
                                    .AppMainColor // Use your custom color here
                                : Colors.black, // Use your custom color here
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  Text(
                    tyedQuestionsController
                            .tyedQuestionsRxModel.value!.spousalSupport
                            .toString() ??
                        'What spousal support will be provided?',
                    style: AppTextConstant.SimpleStyle,
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  CustomContainer(
                    child: TextFormField(
                      controller: supportDetailController,
                      decoration: InputDecoration(border: InputBorder.none),
                      maxLines: 4,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    tyedQuestionsController
                            .tyedQuestionsRxModel.value!.spouseReceivingSupport
                            .toString() ??
                        'Will spousal support end if the spouse receiving support enters a new commitment or common-law relationship?',
                    style: AppTextConstant.SimpleStyle,
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors
                          .white, // Set the background color of the container
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
                    height: Get.height * 0.06,
                    width: Get.width,
                    child: Row(
                      children: [
                        Radio(
                          activeColor: AppColorsConstants
                              .AppMainColor, // Use your custom color here
                          value: "Yes",
                          groupValue: selectedValue1.value,
                          onChanged: (value) {
                            selectedValue1.value = 'Yes';
                          },
                        ),
                        Text(
                          "Yes",
                          style: TextStyle(
                            color: selectedValue1.value == 'Yes'
                                ? AppColorsConstants
                                    .AppMainColor // Use your custom color here
                                : Colors.black, // Use your custom color here
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors
                          .white, // Set the background color of the container
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
                    height: Get.height * 0.06,
                    width: Get.width,
                    child: Row(
                      children: [
                        Radio(
                          activeColor: AppColorsConstants
                              .AppMainColor, // Use your custom color here
                          value: "No",
                          groupValue: selectedValue1.value,
                          onChanged: (value) {
                            selectedValue1.value = 'No';
                          },
                        ),
                        Text(
                          "No",
                          style: TextStyle(
                            color: selectedValue1.value == 'No'
                                ? AppColorsConstants
                                    .AppMainColor // Use your custom color here
                                : Colors.black, // Use your custom color here
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomElevatedButton(
                        onpress: () {
                          tyedAnswersModel.tyedEndsAnswer = selectedValue.value;
                          tyedAnswersModel.spousalSupportAnswer = supportDetailController.text;
                          tyedAnswersModel.spousalSupportEndsAnswer = selectedValue1.value;
                          Get.toNamed(RoutesName.InheritScreen);
                        },
                        text: "Next",
                        height: Get.height * 0.05,
                        width: Get.width * 0.4,
                        colors: AppColorsConstants.AppMainColor),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
