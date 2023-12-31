// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';

import '../../Constant/Constants/founts/Constants.dart';
import '../../Constant/Constants/routes/routesName.dart';
import '../../Widgets/OnboardButton.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
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
                            "assets/firstonboard.svg",
                            height: Get.height * 0.3,
                          ),
                          SizedBox(
                            height: Get.height * 0.04,
                          ),
                          Text(
                            "Safeguard Your Family's\nDocuments with tyed",
                            style: AppTextConstant.onBoardText.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: Get.height * 0.012,
                          ),
                          Text(
                            "Our app employs top-notch encryption and \nadvanced security measures to keep your data safe \nfrom prying eyes",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 14),
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
                            "assets/secondonboard.svg",
                            height: Get.height * 0.3,
                          ),
                          SizedBox(height: Get.height * 0.04),
                          Text(
                            " Create Your Custom tyed\nAgreement",
                            style: AppTextConstant.onBoardText.copyWith(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: Get.height * 0.012,
                          ),
                          Text(
                            "Tyed Marriage Agreement, offering a legal alternative for\nmeaningful connections. Explore hassle-free prenuptial\nagreements, easily created and signed on-screen,\nensuring your love story is uniquely yours.",
                            style: AppTextConstant.SimpleStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
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
                          count: 2,
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
                          : Get.offAllNamed(RoutesName.SignIn);
                    }),
              ),
            ),
          ),
          Positioned(
            right: Get.width * 0.04,
            top: Get.height * 0.05,
            child: InkWell(
                onTap: () {
                  Get.offAllNamed(RoutesName.SignIn);
                },
                child: Text('Skip')),
          ),
        ],
      ),
    );
  }
}
