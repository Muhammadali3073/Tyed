// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';

import 'package:tyedapp/Constant/Constants/founts/Constants.dart';

import '../../Constant/Constants/routes/routesName.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomPdfRow.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  backToBottomNavBar(){
    Get.offAllNamed(RoutesName.CustomBottomNavigationBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return backToBottomNavBar();
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.offAllNamed(RoutesName.CustomBottomNavigationBar);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new,
                        size: 15), // Fixed icon size
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.25,
                width: Get.width * 0.5,
                child: SvgPicture.asset("assets/downloadimage.svg"),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Text(
                textAlign: TextAlign.center,
                "Almost done! Download and share your custom tyed agreement!",
                style: AppTextConstant.SimpleStyle,
              ),
              SizedBox(
                height: Get.height * 0.028,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomPdfRow(
                    onTap: () => Get.toNamed(RoutesName.PdfViewer),
                    column1: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "tyed agreement",
                              style: TextStyle(fontSize: 12),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.only(left: Get.width * 0.03),
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 3),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        color: Colors.grey.withOpacity(0.2),
                                      )
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Transform.scale(
                                      scale: 1.8,
                                      child: SvgPicture.asset(
                                        "assets/pencilicon.svg",
                                        height: Get.height * 0.05,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomElevatedButton(
                              style: TextStyle(fontSize: 8),
                              text: "Download",
                              height: 17,
                              colors: AppColorsConstants.AppMainColor,
                              onpress: () {
                                // Add your onPressed logic here
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.03),
                              child: CustomElevatedButton(
                                style: TextStyle(
                                  fontSize: 8,
                                ),
                                text: "Share",
                                height: 17,
                                colors: AppColorsConstants.AppMainColor,
                                onpress: () {
                                  // Add your onPressed logic here
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
