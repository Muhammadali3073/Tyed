// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Widgets/CustomAppbar2.dart';
import '../../Widgets/CustomButton.dart';

class AddPeopleScreen extends StatelessWidget {
   AddPeopleScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar2(
            height: Get.height * 0.1,
            titleText: "Share",
            style: TextStyle(fontSize: 14),

          ),
          SizedBox(
            height: Get.height * 0.017,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: Size(Get.width * 0.87, Get.height * 0.04),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                Get.toNamed(RoutesName.ContactListScreen);
              },
              child: Row(
                children: [
                  Text(
                    "Add people you want to share with",
                    style: AppTextConstant.hintText,
                  ),
                ],
              )),
          SizedBox(
            height: Get.height * 0.017,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 3)
                ],
                color: Colors.white,
              ),
              height: Get.height * 0.23,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 5,
                                spreadRadius: 3)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      height: Get.height * 0.08,
                      width: double.infinity,
                      child: Row(
                        children: [
                          CustomElevatedButton(
                            onpress: () {},
                            text: "Document:",
                            style: AppTextConstant.SimpleStyle.copyWith(
                                color: Colors.white),
                            height: Get.height * 0.035,
                            width: Get.width * 0.26,
                            colors: AppColorsConstants.PrimaryColor,
                          ),
                          SizedBox(
                            width: Get.width * 0.025,
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            child: SvgPicture.asset(
                              "assets/docs.svg",
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Text("Document 1"),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 5,
                                spreadRadius: 3)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      height: Get.height * 0.08,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomElevatedButton(
                            onpress: () {},
                            text: "Owner",
                            style: const TextStyle(fontSize: 12),
                            height: Get.height * 0.035,
                            width: Get.width * 0.27,
                            colors: AppColorsConstants.PrimaryColor,
                          ),
                          SizedBox(
                            width: Get.width * 0.025,
                          ),
                          CircleAvatar(
                            radius: 14,
                            backgroundImage: AssetImage(
                                "assets/profile (2).jpg"), // need jpg.
                          ),
                          SizedBox(
                            width: Get.width * 0.015,
                          ),
                          Text("John Michelle"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.07,
          ),
          CustomElevatedButton(
              onpress: () { Get.toNamed(RoutesName.ContactListScreen);},
              text: "Share",
              height: Get.height * 0.05,
              width: Get.width * 0.4,
              colors: AppColorsConstants.AppMainColor)
        ],
      ),
    );
  }
}
