// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Constant/Constants/colors/Constants.dart';
import '../../Widgets/CustomAppbar2.dart';
import '../../utils/Utils.dart';

class DocumentsFolder extends StatelessWidget {
  const DocumentsFolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: Get.height * 0.1,
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: CustomAppBar2(
            titleText: "Document Folder 1",
            height: Get.height * 0.11,
            icon: PopupMenuButton(
              padding: EdgeInsets.zero,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                      onTap: () => Utils.showDialogBox2(
                            context,
                            title: "Your Title",
                            content: "Your Content",
                            onpress: () {
                              // Your callback function
                            },
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.scale(
                              scale: .9,
                              child: SvgPicture.asset(
                                "assets/edit1.svg",
                                height: Get.height * 0.03,
                                width: Get.width * 0.03,
                              )),
                          SizedBox(width: Get.width * 0.02),
                          Text("Rename",
                              style: AppTextConstant.BoldStyle.copyWith(
                                  fontSize: 14))
                        ],
                      )),
                  PopupMenuItem(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Transform.scale(
                          scale: 1,
                          child: SvgPicture.asset(
                            "assets/delete.svg",
                            height: Get.height * 0.03,
                            width: Get.width * 0.03,
                          )),
                      SizedBox(width: Get.width * 0.02),
                      Text("Delete",
                          style:
                              AppTextConstant.BoldStyle.copyWith(fontSize: 14))
                    ],
                  )),

                  PopupMenuItem(
                      onTap: () {
                        Get.toNamed(RoutesName.ChangePasscode);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.scale(
                              scale: 1,
                              child: SvgPicture.asset(
                                "assets/activelock.svg",
                                height: Get.height * 0.03,
                                width: Get.width * 0.03,
                              )),
                          SizedBox(width: Get.width * 0.02),
                          Text("Change Passcode",
                              style: AppTextConstant.BoldStyle.copyWith(
                                  fontSize: 14))
                        ],
                      ))
                ];
              },
            ),
          ),
        ),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: Get.width * 0.02),
                            child: Text(
                              "Pdfs Files",
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
                          child: InkWell(onTap:(){   Get.toNamed(RoutesName.PdfViewer);},
                            child: Container(
                              height: Get.height * 0.08,
                              width: Get.width,
                              decoration:
                                  BoxDecoration(color: Colors.white, boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  color: Colors.grey.shade100,
                                ),
                              ]),
                              child: Row(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColorsConstants.AppMainColor,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(27),
                                        ),
                                      ),
                                      height: Get.height * 0.075,
                                      width: Get.width * 0.2,
                                      child: Center(
                                        child:
                                            SvgPicture.asset("assets/folder.svg"),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: Get.width * 0.05),
                                      child: Text(
                                        "Pdf",
                                        style: AppTextConstant.BoldStyle.copyWith(
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                          
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
                            padding: EdgeInsets.only(right: Get.width * 0.02),
                            child: Text(
                              "Images Files",
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
                        itemCount: 1,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Get.height * 0.007),
                          child: InkWell(onTap:(){   Get.toNamed(RoutesName.PdfViewer);},
                            child: Container(
                              height: Get.height * 0.08,
                              width: Get.width,
                              decoration:
                                  BoxDecoration(color: Colors.white, boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  color: Colors.grey.shade100,
                                ),
                              ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColorsConstants.AppMainColor,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(27),
                                        ),
                                      ),
                                      height: Get.height * 0.075,
                                      width: Get.width * 0.2,
                                      child: Center(
                                        child:
                                            SvgPicture.asset("assets/folder.svg"),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: Get.width * 0.05),
                                      child: Text(
                                        "Image",
                                        style: AppTextConstant.BoldStyle.copyWith(
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                          
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
                            padding: EdgeInsets.only(right: Get.width * 0.02),
                            child: Text(
                              "Documents Files",
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
                        itemCount: 1,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: Get.height * 0.007),
                          child: InkWell(onTap:(){   Get.toNamed(RoutesName.PdfViewer);},
                            child: Container(
                              height: Get.height * 0.08,
                              width: Get.width,
                              decoration:
                                  BoxDecoration(color: Colors.white, boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  color: Colors.grey.shade100,
                                ),
                              ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColorsConstants.AppMainColor,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(27),
                                        ),
                                      ),
                                      height: Get.height * 0.075,
                                      width: Get.width * 0.2,
                                      child: Center(
                                        child:
                                            SvgPicture.asset("assets/folder.svg"),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: Get.width * 0.05),
                                      child: Text(
                                        "Document ",
                                        style: AppTextConstant.BoldStyle.copyWith(
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                          
                                  // Use column2 widget if provided, else use an empty Container
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
