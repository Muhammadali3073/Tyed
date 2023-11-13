// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Widgets/CustomAppBar.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/RoundedButton2.dart';
import '../../models/tyed_answers_model.dart';
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
    "Credit Card",
    "Loan or Mortgage",
    "Line of Credit",
    "Other Debt"
  ];
  RxInt currentIndex = 1.obs;
  List listOfAssets = [1].obs;

  TextEditingController detailRSController0 = TextEditingController();
  TextEditingController detailRSController1 = TextEditingController();
  TextEditingController detailRSController2 = TextEditingController();
  TextEditingController detailRSController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: CustomAppBar(
            svgImagePath: 'assets/60%.svg',
          ),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(bottom: 5, left: Get.width * 0.025),
                child: Text(
                  tyedQuestionsController
                          .tyedQuestionsRxModel.value!.debtResponsible
                          .toString() ??
                      "What debt are you responsible for paying?",
                  style: AppTextConstant.SimpleStyle,
                ),
              ),
              ListView.builder(
                itemCount: listOfAssets.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, outerIndex) {
                  RxInt selectedIndex = 0.obs;
                  return Column(
                    children: [
                      outerIndex != 0
                          ? Divider(
                              color: Colors.grey,
                              height: 5,
                              thickness: 1,
                              indent: Get.height * 0.01,
                              endIndent: Get.height * 0.01,
                            )
                          : Container(),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.025,
                          vertical: Get.height * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,

                          // Set the background color of the container

                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              // Color of the shadow

                              spreadRadius: 5,
                              // Spread radius

                              blurRadius: 7,
                              // Blur radius

                              offset:
                                  const Offset(0, 2), // Offset of the shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.03),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: outerIndex == 0
                                            ? Get.height * 0.012
                                            : 0),
                                    child: Text(
                                      tyedQuestionsController
                                              .tyedQuestionsRxModel
                                              .value!
                                              .belongAssets
                                              .toString() ??
                                          "Separate Debt",
                                      style: AppTextConstant.SimpleStyle,
                                    ),
                                  ),
                                  outerIndex == 0
                                      ? Container()
                                      : InkWell(
                                          onTap: () {
                                            listOfAssets.removeAt(outerIndex);
                                          },
                                          child:
                                              Image.asset("assets/group3.png"))
                                ],
                              ),
                              SizedBox(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: images.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4),
                                      child: InkWell(
                                          onTap: () {
                                            selectedIndex.value = index;
                                          },
                                          child: Obx(
                                            () => Container(
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
                                            ),
                                          )),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.014,
                              ),
                              Text(
                                "What are the details?",
                                style: AppTextConstant.SimpleStyle,
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
                                      color: Colors.grey.withOpacity(0.2),
                                      // Color of the shadow
                                      spreadRadius: 5,
                                      // Spread radius
                                      blurRadius: 7,
                                      // Blur radius
                                      offset:
                                          Offset(0, 2), // Offset of the shadow
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: outerIndex == 0
                                      ? detailRSController0
                                      : outerIndex == 1
                                          ? detailRSController1
                                          : outerIndex == 2
                                              ? detailRSController2
                                              : detailRSController3,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      border: InputBorder.none),
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
                    ],
                  );
                },
              ),
              SizedBox(
                height: Get.height * 0.008,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Get.width * 0.025,
                ),
                child: RoundedButton2(
                  title: "Add another separate debt",
                  onpress: () {
                    if (listOfAssets.length < 4) {
                      listOfAssets.add(currentIndex.value++);
                    }
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(
                  onpress: () {
                    if (detailRSController0.text.isNotEmpty ||
                        detailRSController1.text.isNotEmpty ||
                        detailRSController2.text.isNotEmpty ||
                        detailRSController3.text.isNotEmpty) {
                      tyedQuestionsController
                              .tyedAnswersModel.responsibleForPayingAnswer =
                          '${detailRSController0.text}${'\n${detailRSController1.text}'}${'\n${detailRSController2.text}'}${'\n${detailRSController3.text}'}';
                      Get.toNamed(RoutesName.YesNoScreen2);
                    } else {
                      Get.snackbar('Required', 'All fields are Required',
                          colorText: Colors.white,
                          backgroundColor:
                              AppColorsConstants.AppMainColor.withOpacity(0.5));
                    }
                  },
                  text: "Next",
                  height: Get.height * 0.05,
                  width: Get.width * 0.4,
                  colors: AppColorsConstants.AppMainColor,
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
            ]),
          )),
    );
  }
}
