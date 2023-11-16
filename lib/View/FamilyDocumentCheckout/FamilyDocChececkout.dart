// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Widgets/CustomAppbar2.dart';
import '../../Widgets/CustomShareDocuments.dart';

class FamilyDocCheckout extends StatefulWidget {
  const FamilyDocCheckout({super.key});

  @override
  State<FamilyDocCheckout> createState() => _FamilyDocCheckoutState();
}

class _FamilyDocCheckoutState extends State<FamilyDocCheckout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar2(
            isBack: false,
            isArgument: true,
            height: Get.height * 0.1,
            titleText: 'Add Family Document',
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.04, vertical: Get.height * 0.02),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    width: Get.width,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: Get.height * 0.02),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/uploadducuments.svg',
                            height: Get.height * 0.15,
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Text(
                            'You have uploaded the free document,to\nUpload more you must complete your payment.',
                            style: AppTextConstant.SimpleStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.toNamed(RoutesName.SelectCategory);
                            },
                            style: ElevatedButton.styleFrom(
                              maximumSize:
                                  Size(Get.width * 0.4, Get.height * 0.05),
                              backgroundColor: AppColorsConstants.AppMainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Checkout',
                                style: TextStyle(
                                    fontSize: 12), // Customize the text's style
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.023,
                  ),
                  Text(
                    'Uploaded Document',
                    style: AppTextConstant.BoldStyle.copyWith(fontSize: 14),
                  ),
                  SizedBox(
                    height: Get.height * 0.006,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Get.height * 0.01),
                        child: CustomShareDocuments(
                          title: "Document1",
                          onpress: () {
                            // DialogBox3.showDialogBox3(context);
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
