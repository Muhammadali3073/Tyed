// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';

import '../../Constant/Constants/routes/routesName.dart';
import '../../Widgets/OnboardButton.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var pageController = PageController().obs;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: Get.height * 0.135,
              decoration: BoxDecoration(color: Colors.black),
            ),
          ),
          Positioned(
            bottom: Get.height * 0.11,
            left: 0,
            right: 0,
            child: Container(
              height: Get.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20))),
              child: Stack(
                children: [
                  PageView(
                    physics: ScrollPhysics(),
                    controller: pageController.value,
                    onPageChanged: (value) {
                      currentIndex = value;
                    },
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.25,
                          ),
                          SvgPicture.asset(
                            "assets/intro1.svg",
                            height: Get.height * 0.3,
                          ),
                          SizedBox(
                            height: Get.height * 0.04,
                          ),
                          Text(
                            "Welcome to tyed your trusted companion for\nsafeguarding and sharing vital family\ndocuments. Effortlessly share wills, essential\npapers, and more with close family and friends.",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                                fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.25,
                          ),
                          SvgPicture.asset(
                            "assets/intro2.svg",
                            height: Get.height * 0.3,
                          ),
                          SizedBox(
                            height: Get.height * 0.04,
                          ),
                          Text(
                            "Designate administrators and securely store\neverything in your private wallet, protected by a\npassword that can only be changed through\nunanimous agreement",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                                fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.25,
                          ),
                          SvgPicture.asset(
                            "assets/intro3.svg",
                            height: Get.height * 0.3,
                          ),
                          SizedBox(
                            height: Get.height * 0.04,
                          ),
                          Text(
                            "Embrace peace of mind with tyed  – where\nsharing memories and securing\nlegacies is simplified.",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                                fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),

                    ],
                  ),
                  Positioned(
                    bottom: Get.height * 0.20,
                    child: SizedBox(
                      width: Get.width,
                      child: Align(
                        alignment: Alignment.center,
                        child: SmoothPageIndicator(
                          effect: SlideEffect(
                            activeDotColor: AppColorsConstants.AppMainColor,
                            dotHeight: 10,
                            dotWidth: 10,
                          ),
                          controller: pageController.value,
                          count: 3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: Get.height * 0.085,
            child: SizedBox(
              width: Get.width,
              child: Align(
                alignment: Alignment.center,
                child: CustomElevatedButtonOnboardScreen(
                    label: 'Next  >>>',
                    onPressed: () {
                      currentIndex == 0
                          ? pageController.value.nextPage(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.linear)
                          : currentIndex == 1
                              ? pageController.value.nextPage(
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.linear)
                              : Get.toNamed(RoutesName.PaymentPlanDocumentScreen);
                      log(currentIndex.toString());
                    }),
              ),
            ),
          ),
          Positioned(
            right: Get.width * 0.04,
            top: Get.height * 0.05,
            child: InkWell(
                onTap: () {
                  Get.toNamed(RoutesName.PaymentPlanDocumentScreen);
                },
                child: Text('Skip')),
          ),
        ],
      ),
    );
  }
}
