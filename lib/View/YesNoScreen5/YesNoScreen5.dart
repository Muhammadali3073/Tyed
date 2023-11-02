// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Widgets/CustomAppBar.dart';
import '../../Widgets/CustomButton.dart';
import '../../viewModel/TyedQuestionsController/TyedQuestionsController.dart';

class YesNoScreen5 extends StatefulWidget {
  const YesNoScreen5({super.key});

  @override
  State<YesNoScreen5> createState() => _YesNoScreenState();
}

class _YesNoScreenState extends State<YesNoScreen5> {
  TyedQuestionsController tyedQuestionsController =
      Get.find(tag: 'tyedQuestionsController');
  RxString selectedValue = "Yes".obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: const CustomAppBar(
            svgImagePath: 'assets/80%.svg',
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      tyedQuestionsController
                              .tyedQuestionsRxModel.value!.futureSpouseLive
                              .toString() ??
                          "Do you and your future spouse live together?",
                      style: AppTextConstant.SimpleStyle,
                    )),
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
                        activeColor: AppColorsConstants
                            .AppMainColor, // Use your custom color here
                        value: "Yes",
                        groupValue: selectedValue.value,

                        onChanged: (value) {
                          selectedValue.value = "Yes";
                        },
                      ),
                      Text(
                        "Yes",
                        style: TextStyle(
                          color: selectedValue.value == 'Yes'
                              // color: controller.selectedValue.value == 'Yes'
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
                  height: Get.height * 0.016,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors
                        .white, // Set the background color of the container
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
                        activeColor: AppColorsConstants
                            .AppMainColor, // Use your custom color here
                        value: "No",
                        groupValue: selectedValue.value,

                        onChanged: (value) {
                          selectedValue.value = "No";
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
                  height: Get.height * 0.06,
                ),
                CustomElevatedButton(
                  onpress: () {
                    Get.toNamed(RoutesName.PaySpousal);
                  },
                  text: "Next",
                  height: Get.height * 0.05,
                  width: Get.width * 0.4,
                  colors: AppColorsConstants.AppMainColor,
                ),
              ],
            ),
          ),
        ));
  }
}
