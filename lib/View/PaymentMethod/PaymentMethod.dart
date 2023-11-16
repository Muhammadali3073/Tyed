// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors_in_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Widgets/CustomAppbar2.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/PaymentField.dart';

class PaymentMethod extends StatefulWidget {
  PaymentMethod({
    super.key,
  });

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  RxBool? isSelectedDebitCard = true.obs;
  RxBool? isSelectedCreditCard = false.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar2(isBack: false,
                isArgument: true,
                height: Get.height * 0.1,
                titleText: 'Payment Method',
                customWidth: 0.13),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  Image.asset('assets/paymentmethodimage.png'),
                  SizedBox(height: Get.height * 0.04),
                  CustomOptionContainer(
                    onpress: () {
                      isSelectedDebitCard!.value=true;
                      isSelectedCreditCard!.value=false;
                    },
                    color: isSelectedDebitCard!.value == true
                        ? AppColorsConstants.AppMainColor
                        : Colors.white,
                    text: 'By Credit Card',
                  ),
                  SizedBox(height: Get.height * 0.02),
                  CustomOptionContainer(
                    onpress: () {
                      isSelectedDebitCard!.value=false;
                      isSelectedCreditCard!.value=true;
                    },
                    color: isSelectedCreditCard!.value == true
                        ? AppColorsConstants.AppMainColor
                        : Colors.white,
                    text: 'By Debit Card',
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  CustomElevatedButton(
                    onpress: () {
                      Get.toNamed(RoutesName.PaymentMethodProcess,arguments: Get.arguments);
                    },
                    text: "Continue",
                    height: Get.height * 0.05,
                    width: Get.width * 0.4,
                    colors: AppColorsConstants.AppMainColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
