// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';
import 'package:tyedapp/viewModel/TyedQuestionsController/TyedQuestionsController.dart';

import '../../Widgets/CustomAppBar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomTextField.dart';
import '../../Widgets/Dialoge.dart';
import '../../viewModel/PersonDetailsController/PersonDetailController.dart';

class PersonDetails extends StatefulWidget {
  const PersonDetails({super.key});

  @override
  State<PersonDetails> createState() => _PersonDetailsState();
}

class _PersonDetailsState extends State<PersonDetails> {
  TyedQuestionsController tyedQuestionsController =
      Get.find(tag: 'tyedQuestionsController');
  PersonDetailController personDetailController =
      Get.put(PersonDetailController(), tag: 'personDetailController');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          backgroundColor: AppColorsConstants.SecondaryColor,
          appBar: const CustomAppBar(
            svgImagePath: 'assets/10%.svg',
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SingleChildScrollView(
              child: SizedBox(
                height: Get.height * 0.5,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      tyedQuestionsController
                              .tyedQuestionsRxModel.value!.personName
                              .toString() ??
                          "What is your full name?",
                      style: AppTextConstant.SimpleStyle,
                    ),
                    CustomTextField(
                      controller: personDetailController.personNameController,
                      keyboardType: TextInputType.name,
                      hintText: "Person Name",
                    ),
                    Text(
                      tyedQuestionsController
                              .tyedQuestionsRxModel.value!.spouseName
                              .toString() ??
                          "What is your Spouse's full name?",
                      style: AppTextConstant.SimpleStyle,
                    ),
                    CustomTextField(
                        controller: personDetailController.spouseNameController,
                        keyboardType: TextInputType.name,
                        hintText: "Spouse's Name"),
                    Text(
                      tyedQuestionsController
                              .tyedQuestionsRxModel.value!.personAddress
                              .toString() ??
                          "What is your address?",
                      style: AppTextConstant.SimpleStyle,
                    ),
                    CustomTextField(
                        controller: personDetailController.addressController,
                        keyboardType: TextInputType.text,
                        hintText: "eg city,street,state"),
                    Text(
                      tyedQuestionsController
                              .tyedQuestionsRxModel.value!.gettingTyedDate
                              .toString() ??
                          "When are you getting tyed?",
                      style: AppTextConstant.SimpleStyle,
                    ),
                    CustomTextField(
                        onTap: () {
                          personDetailController.selectDOB(context);
                        },
                        controller: personDetailController.dateController,
                        keyboardType: TextInputType.datetime,
                        readOnly: true,
                        hintText: "DD  MM YYY"),
                    SizedBox(
                      height: Get.height * 0.023,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomElevatedButton(
                          onpress: () {
                            if (personDetailController.personNameController.text.isNotEmpty &&
                                personDetailController
                                    .spouseNameController.text.isNotEmpty &&
                                personDetailController
                                    .addressController.text.isNotEmpty &&
                                personDetailController
                                    .dateController.text.isNotEmpty) {
                              ShowDialogue.showCustomDialog(context,
                                  title: "Separate Assets", onPress: () {
                                tyedQuestionsController
                                        .tyedAnswersModel.personNameAnswer =
                                    personDetailController
                                        .personNameController.text;
                                tyedQuestionsController
                                        .tyedAnswersModel.spouseNameAnswer =
                                    personDetailController
                                        .spouseNameController.text;
                                tyedQuestionsController
                                        .tyedAnswersModel.yourAddressAnswer =
                                    personDetailController
                                        .addressController.text;
                                tyedQuestionsController
                                        .tyedAnswersModel.tyedDateAnswer =
                                    personDetailController.dateController.text;
                                Get.back();
                                Get.toNamed(RoutesName.AssetsScreen);
                              },
                                  onPressForNo: () {
                                    Get.back();
                                    Get.toNamed(RoutesName.YesNoScreen);
                                  },
                                  content: tyedQuestionsController
                                          .tyedQuestionsRxModel
                                          .value!
                                          .separateAssets
                                          .toString() ??
                                      "Would you like to list any assets that will remain separate after tyed commitment?");
                            } else {
                              Get.snackbar(
                                  'Required', 'All fields are Required',
                                  colorText: Colors.white,
                                  backgroundColor: AppColorsConstants
                                      .AppMainColor.withOpacity(0.5));
                            }
                          },
                          text: "Next",
                          height: Get.height * 0.05,
                          width: Get.width * 0.4,
                          colors: AppColorsConstants.AppMainColor),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
