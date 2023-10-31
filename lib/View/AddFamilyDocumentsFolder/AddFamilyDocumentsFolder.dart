// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Constant/Constants/colors/Constants.dart';
import '../../Widgets/CustomAppbar2.dart';

class FamilyDocumentsFolder extends StatelessWidget {
  const FamilyDocumentsFolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: Get.height * 0.12,

          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: CustomAppBar2(
            titleText: "Add family Document",
            height: Get.height * 0.11,
          ),
        ),
        body: Stack(
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(right: Get.width * 0.02),
                                child: Text(
                                  "Folder share by other",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  // Adjust the width as needed
                                  child: Divider(
                                    thickness: 1.3,
                                    height: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.017,
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: 2,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Get.height * 0.007),
                              child: InkWell(
                                onTap: () =>
                                    Get.toNamed(RoutesName.DocumentsFolder),
                                child: Container(
                                  height: Get.height * 0.08,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          spreadRadius: 1,
                                          color: Colors.grey.shade100,
                                        ),
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                AppColorsConstants.AppMainColor,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(27),
                                            ),
                                          ),
                                          height: Get.height * 0.075,
                                          width: Get.width * 0.2,
                                          child: Center(
                                            child: SvgPicture.asset(
                                                "assets/folder.svg"),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Folder ${index + 1}",
                                        style:
                                            AppTextConstant.BoldStyle.copyWith(
                                                fontSize: 14),
                                      ),
                                      Text(
                                        "Shared by ali",
                                        style:
                                            AppTextConstant.BoldStyle.copyWith(
                                                fontSize: 10),
                                      ),
                                      Container(
                                        height: Get.height * 0.078,
                                        width: Get.width * 0.15,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20)),
                                          color: Colors.black,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "8 Files",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                      // Use column2 widget if provided, else use an empty Container
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.017,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(right: Get.width * 0.02),
                                child: Text(
                                  "Folder share by you",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  // Adjust the width as needed
                                  child: Divider(
                                    thickness: 1.3,
                                    height: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.017,
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: 3,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Get.height * 0.007),
                              child: InkWell(
                                onTap: () =>
                                    Get.toNamed(RoutesName.DocumentsFolder),
                                child: Container(
                                  height: Get.height * 0.08,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          spreadRadius: 1,
                                          color: Colors.grey.shade100,
                                        ),
                                      ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                AppColorsConstants.AppMainColor,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(27),
                                            ),
                                          ),
                                          height: Get.height * 0.075,
                                          width: Get.width * 0.2,
                                          child: Center(
                                            child: SvgPicture.asset(
                                                "assets/folder.svg"),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Folder ${index + 1}",
                                        style:
                                            AppTextConstant.BoldStyle.copyWith(
                                                fontSize: 14),
                                      ),
                                      Text(
                                        "Shared by ali",
                                        style:
                                            AppTextConstant.BoldStyle.copyWith(
                                                fontSize: 10),
                                      ),
                                      Container(
                                        height: Get.height * 0.078,
                                        width: Get.width * 0.15,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20)),
                                          color: Colors.black,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "8 Files",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                      // Use column2 widget if provided, else use an empty Container
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: Get.height * 0.026,
              left: Get.width * 0.79,
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    Get.toNamed(RoutesName.SelectCategory);
                  },
                  backgroundColor: AppColorsConstants.AppMainColor,
                  child: Icon(Icons.add),
                ),
              ),
            )
          ],
        ));
  }
}
