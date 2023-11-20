// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Constant/Constants/colors/Constants.dart';
import '../../Constant/Constants/founts/Constants.dart';
import '../../Constant/Constants/routes/routesName.dart';
import '../../Widgets/CustomAppbar2.dart';
import '../../Widgets/OnboardButton.dart';

class PaymentPlanTyedAgreementScreen extends StatelessWidget {
  const PaymentPlanTyedAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar2(
            isBack: false,
            isArgument: true,
            height: Get.height * 0.10,
            titleText: "Tyed Agreement Plan",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                ),
                SvgPicture.asset(
                  "assets/tyed-plan.svg",
                  height: Get.height * 0.3,
                ),
                SizedBox(height: Get.height * 0.04),
                Text(
                  "Price tyed marriage agreement",
                  style: AppTextConstant.onBoardText.copyWith(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text(
                  '\$49.99',
                  style: AppTextConstant.SimpleStyle.copyWith(
                      fontSize: 18,
                      color: AppColorsConstants.AppMainColor,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    CustomElevatedButtonOnboardScreen(
                        label: 'Pay Now',
                        onPressed: () {
                          Get.toNamed(RoutesName.PaymentMethod,
                              arguments: ['Tyed', Get.arguments]);
                        }),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
