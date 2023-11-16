// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';
import 'package:tyedapp/View/PdfViewer/text_to_pdf.dart';

import '../../Widgets/CustomAppbar2.dart';
import '../../Widgets/CustomButton.dart';
import '../../viewModel/PDFStoreInFirebaseController/pdfController.dart';

class PaymentMethodProcess extends StatefulWidget {

  const PaymentMethodProcess({super.key});

  @override
  State<PaymentMethodProcess> createState() => _PaymentMethodProcessState();
}

class _PaymentMethodProcessState extends State<PaymentMethodProcess> {

  TextEditingController nameController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();

  TextEditingController exDateController = TextEditingController();

  TextEditingController ccvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                CustomAppBar2(isBack: false,
                  isArgument: true,
                  height: Get.height * 0.1,
                  titleText: 'Card Info',
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Image.asset(
                  "assets/creditcardpic.png",
                  height: Get.height * 0.22,
                  width: Get.width * 0.7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height * 0.013),
                      Padding(
                        padding: EdgeInsets.only(left: Get.width * 0.035),
                        child: Text(
                          "Card Holder",
                          style: AppTextConstant.hintText.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      SizedBox(
                        height: Get.height * 0.05,
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              prefixIcon: Transform.scale(
                                scale: 0.4,
                                child: SvgPicture.asset("assets/person.svg"),
                              ),
                              hintText: "Oguz Bulbul",
                              hintStyle: AppTextConstant.SimpleStyle,
                              contentPadding: EdgeInsets.all(6)),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: Get.width * 0.035),
                            child: Text(
                              "Card Number",
                              style: AppTextConstant.hintText.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.01),
                          SizedBox(
                            height: Get.height * 0.05,
                            child: TextField(
                              controller: cardNumberController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  prefixIcon: Transform.scale(
                                    scale: 0.4,
                                    child: SvgPicture.asset(
                                        "assets/cardimage2.svg"),
                                  ),
                                  hintText: "888532112155",
                                  hintStyle: AppTextConstant.SimpleStyle,
                                  contentPadding: EdgeInsets.all(6)),
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: Get.width * 0.1),
                                      child: Text(
                                        "Expiry Date",
                                        style:
                                            AppTextConstant.hintText.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height: Get.height * 0.05,
                                        width: Get.width * 0.35,
                                        child: TextFormField(
                                          controller: exDateController,
                                          keyboardType: TextInputType.datetime,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(7),
                                          ],
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(6),
                                            hintText: "01/2022",
                                            hintStyle:
                                                AppTextConstant.SimpleStyle,
                                            prefixIcon: Transform.scale(
                                              scale: 0.4,
                                              child: SvgPicture.asset(
                                                  "assets/Calendar.svg"),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  width: Get.width * 0.03,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "CCV",
                                          style:
                                              AppTextConstant.hintText.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                            height: Get.height * 0.05,
                                            width: Get.width * 0.33,
                                            child: TextFormField(
                                              controller: ccvController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.all(6),
                                                hintText: "0 0 0",
                                                hintStyle:
                                                    AppTextConstant.SimpleStyle,
                                                prefixIcon: Transform.scale(
                                                  scale: 0.4,
                                                  child: SvgPicture.asset(
                                                      "assets/BulkLock.svg"),
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.06,
                      ),
                      Center(
                        child:  CustomElevatedButton(
                                onpress: () async {
                                  if (Get.arguments == 'Tyed') {
                                    Get.back();
                                    Get.back();
                                    Get.back();
                                  } else {
                                    Get.toNamed(RoutesName.FamilyDocumentsFolder, arguments: true);
                                  }
                                },
                                text: "Pay Now",
                                height: Get.height * 0.05,
                                width: Get.width * 0.4,
                                colors: AppColorsConstants.AppMainColor,
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ;
  }
}
