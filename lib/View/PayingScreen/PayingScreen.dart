// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Widgets/CustomAppBar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/Dialoge.dart';
import '../../Widgets/RectangularButton.dart';
import '../../Widgets/RoundedButton2.dart';
import '../../viewModel/TyedQuestionsController/TyedQuestionsController.dart';

class PayingScreen extends StatefulWidget {
  const PayingScreen({super.key});

  @override
  State<PayingScreen> createState() => _PersonDetailsState();
}

class _PersonDetailsState extends State<PayingScreen> {
  TyedQuestionsController tyedQuestionsController =
      Get.find(tag: 'tyedQuestionsController');
  List images = [
    "assets/creditcard.svg",
    "assets/loan.svg",
    "assets/credit.svg",
    "assets/debit.svg"
  ];
  List title = [
    "credit card",
    "Loan or mortgage",
    "Line of credit",
    "Other debt"
  ];
  RxInt selectedIndex = 0.obs;
  TextEditingController detailPaymentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: CustomAppBar(
            svgImagePath: 'assets/60%.svg',
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.025,
            ),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        tyedQuestionsController
                                .tyedQuestionsRxModel.value!.debtResponsible
                                .toString() ??
                            "What debt are you responsible for paying?",
                        style: AppTextConstant.SimpleStyle,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // Set the background color of the container

                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.2), // Color of the shadow

                            spreadRadius: 5, // Spread radius

                            blurRadius: 7, // Blur radius

                            offset: const Offset(0, 2), // Offset of the shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  tyedQuestionsController.tyedQuestionsRxModel
                                          .value!.assetsBelongOnlyYou
                                          .toString() ??
                                      "What assets belong only to you?",
                                  style: AppTextConstant.SimpleStyle,
                                ),
                                Image.asset("assets/group3.png")
                              ],
                            ),
                            SizedBox(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: images.length,
                                itemBuilder: (context, index) {
                                  return Obx(() => Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                        child: InkWell(
                                            onTap: () {
                                              selectedIndex.value = index;
                                            },
                                            child: Container(
                                              width: Get.width,
                                              height: Get.height * 0.065,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        selectedIndex.value ==
                                                                index
                                                            ? AppColorsConstants
                                                                .AppMainColor
                                                            : Colors.white),
                                                color: Colors.white,
                                                // Set the background color of the container

                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    // Color of the shadow

                                                    spreadRadius: 5,
                                                    // Spread radius

                                                    blurRadius: 7,
                                                    // Blur radius

                                                    offset: Offset(0,
                                                        2), // Offset of the shadow
                                                  ),
                                                ],
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                Get.width *
                                                                    0.02,
                                                            vertical:
                                                                Get.height *
                                                                    0.01),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Transform.scale(
                                                              scaleX: 1.2,
                                                              scaleY: 1.2,
                                                              child: SvgPicture
                                                                  .asset(
                                                                images[index],
                                                              )),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 20),
                                                            child: Text(
                                                              title[index],
                                                              style: AppTextConstant
                                                                  .SimpleStyle,
                                                            ),
                                                          ),
                                                        ]),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ));
                                },
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.014,
                            ),
                            Obx(
                              () => Text(
                                "What are the details of this ${title[selectedIndex.value]}?",
                                style: AppTextConstant.SimpleStyle,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.008,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // Set the background color of the container
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(
                                        0.2), // Color of the shadow
                                    spreadRadius: 5, // Spread radius
                                    blurRadius: 7, // Blur radius
                                    offset:
                                        Offset(0, 2), // Offset of the shadow
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: detailPaymentController,
                                keyboardType: TextInputType.text,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                maxLines: 5,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.008,
                    ),
                    RoundedButton2(
                      title: "Add another separate asset",
                      onpress: () {},
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomElevatedButton(
                        onpress: () {
                          Get.toNamed(RoutesName.YesNoScreen2);
                        },
                        text: "Next",
                        height: Get.height * 0.05,
                        width: Get.width * 0.4,
                        colors: AppColorsConstants.AppMainColor,
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }
}
