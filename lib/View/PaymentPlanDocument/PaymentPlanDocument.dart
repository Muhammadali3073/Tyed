// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constant/Constants/colors/Constants.dart';
import '../../Constant/Constants/routes/routesName.dart';
import '../../Widgets/CustomAppbar2.dart';
import '../../Widgets/OnboardButton.dart';

class PaymentPlanDocumentScreen extends StatefulWidget {
  const PaymentPlanDocumentScreen({super.key});

  @override
  State<PaymentPlanDocumentScreen> createState() =>
      _PaymentPlanDocumentScreenState();
}

class _PaymentPlanDocumentScreenState extends State<PaymentPlanDocumentScreen> {
  List paymentPlans = [
    '\$2.99 / 1 Document',
    '\$5.99 / 6 Document ',
    '\$9.99 / 12 Document '
  ];

  RxInt isSelectPlan = 0.obs;
  backToBottomNavBar() {
    Get.offAllNamed(RoutesName.CustomBottomNavigationBar);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () => backToBottomNavBar(),
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar2(
              onPressed: () => Get.offAllNamed(RoutesName.CustomBottomNavigationBar),
              isBack: false,
              isArgument: true,
              height: Get.height * 0.10,
              titleText: "Document Plans",
            ),
            Container(
              width: Get.width,
              margin: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.08),
                  Text(
                    "Current Plans",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: Get.height * 0.025),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: paymentPlans.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          isSelectPlan.value = index;
                        },
                        child: Obx(
                          () => Container(
                            width: Get.width,
                            margin: EdgeInsets.only(bottom: Get.height * 0.016),
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.height * 0.016,
                                vertical: Get.height * 0.024),
                            decoration: BoxDecoration(
                                color: isSelectPlan.value == index
                                    ? AppColorsConstants.AppMainColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: isSelectPlan.value == index
                                      ? AppColorsConstants.AppMainColor
                                      : Colors.grey.withOpacity(0.5),
                                )),
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: isSelectPlan.value == index
                                                ? Colors.white
                                                : Colors.grey,
                                            width: 1.5)),
                                    padding: EdgeInsets.all(2),
                                    child: Icon(Icons.circle_rounded,
                                        color: Colors.white, size: 10)),
                                SizedBox(
                                  width: Get.height * 0.008,
                                ),
                                Text(paymentPlans[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: isSelectPlan.value == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: Get.height * 0.040),
                  Align(
                    alignment: Alignment.center,
                    child: CustomElevatedButtonOnboardScreen(
                        label: 'Continue',
                        onPressed: () {
                          Get.toNamed(RoutesName.PaymentMethod);
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
