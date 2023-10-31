// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

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

  final PersonDetailController personDetailController = Get.put(PersonDetailController(),tag: 'personDetailController');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    "What is your full name?",
                    style: AppTextConstant.SimpleStyle,
                  ),
                  CustomTextField(
controller: personDetailController.personNameController,
                    keyboardType: TextInputType.name,
                    hintText: "Person Name",
                  ),
                  Text(
                    "What is your Spouse full name?",
                    style: AppTextConstant.SimpleStyle,
                  ),
                  CustomTextField(
                      controller: personDetailController.spouseNameController,keyboardType: TextInputType.name,
                      hintText: "Spouse Name"),
                  Text(
                    "What is your address?",
                    style: AppTextConstant.SimpleStyle,
                  ),
                  CustomTextField(
                      controller: personDetailController.addressController,keyboardType: TextInputType.text,
                      hintText: "eg city,street,state"),
                  Text(
                    "When are you getting tyed?",
                    style: AppTextConstant.SimpleStyle,
                  ),
                  CustomTextField(  onTap: () {
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
                          ShowDialogue.    showCustomDialog(context,
                              title: "Separate Assets", onpress: () {
                            Get.toNamed(RoutesName.AssetsScreen);
                          },
                              content:
                                  "Would you like to list any assets that will remain separate after tyed commitment?");
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
    );
  }
}
