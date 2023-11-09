// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Widgets/CustomButton.dart';

class CommitmentMilestone extends StatefulWidget {
  const CommitmentMilestone({super.key});
  @override
  State<CommitmentMilestone> createState() => _CommitmentMilestoneState();
}

class _CommitmentMilestoneState extends State<CommitmentMilestone> {
  List title = [
    "Fill out your personal questionnaire",
    "Customize your document",
    "Obtain & sign finalized tyed agreement",
    "Save, print, download, share"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.04,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(size: 15, Icons.arrow_back_ios))),
              Image.asset(
                "assets/milestone.png",
                height: Get.height * 0.23,
              ),
              SizedBox(
                height: Get.height * 0.025,
              ),
              Text(
                "Embrace Your Upcoming \ntyed Commitment milestone",
                style: AppTextConstant.BoldStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Text(
                "you're on the verge of crafting a tyed agreement."
                "\nHere's a glimpse of the process ahead:",
                style: AppTextConstant.SimpleStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 2,
                            offset: Offset(1.1, 2.1),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.white,
                      ),
                      height: Get.height * 0.058,
                      width: Get.width * 0.5,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColorsConstants.AppMainColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              height: Get.height * 0.027,
                              width: Get.width * 0.1,
                              child: Center(
                                child: Text(
                                  "${index + 1} ",
                                  style: AppTextConstant.SimpleStyle.copyWith(
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.08),
                              child: Text("${title[index]}",
                                  style: AppTextConstant.SimpleStyle),
                            )
                          ]),
                    ),
                  );
                },
              ),
              SizedBox(
                height: Get.height * 0.07,
              ),
              CustomElevatedButton(
                  onpress: () {
                    Get.toNamed(RoutesName.PersonDetails);
                  },
                  text: "Start Survey",
                  height: Get.height * 0.045,
                  width: Get.width * 0.4,
                  colors: AppColorsConstants.AppMainColor),
            ],
          ),
        ),
      ),
    );
  }
}
