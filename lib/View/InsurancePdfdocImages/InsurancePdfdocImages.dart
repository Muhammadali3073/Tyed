// ignore_for_file: unused_field, non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:file_picker/file_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';
import '../../Widgets/CustomAppbar2.dart';
import '../../Widgets/CustomButton.dart';


class Insurancepdfdocimages extends StatefulWidget {
  const Insurancepdfdocimages({super.key});

  @override
  State<Insurancepdfdocimages> createState() => _InsurancepdfdocimagesState();
}

class _InsurancepdfdocimagesState extends State<Insurancepdfdocimages> {

  List<dynamic> pdfList = [];
  List<dynamic> imagesList = [];
  List<dynamic> docList = [];
  var _openResult = 'Unknown';


  Future<void> openFile(String filepath) async {
    String filePath = filepath.toString();
    final result = await OpenFilex.open(filePath);

    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar2(
              height: Get.height * 0.1,
              titleText: '${Get.arguments}',

            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
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
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      Text(
                        'Name Document',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: Get.height * 0.009,
                      ),
                      Center(
                        child: TextFormField(
                          decoration: InputDecoration(enabledBorder: InputBorder.none,
                            isCollapsed: true, filled: true,fillColor:    Color.fromRGBO(255, 250, 251, 1),
                            border: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(20)),),
                              hintText: '${Get.arguments}',hintStyle: TextStyle(fontSize: 12,color: Color.fromRGBO(204, 204, 204, 1)),
                          contentPadding: EdgeInsets.symmetric(horizontal: Get.width*0.03,vertical:Get.height*0.01 ),
                             ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      Text(
                        'Pdf',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      SizedBox(
                        height: Get.height * 0.09,
                        width: Get.width,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                final result1 =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: [
                                    'pdf',
                                  ],
                                );if(result1!.files.toString().isNotEmpty){
                                  pdfList.add(result1?.files.last.path.toString());
                                }


                                setState(() {
                                  print(pdfList[0]);
                                });
                              },
                              child: Container(
                                width: Get.width * 0.23,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColorsConstants.AppMainColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: Transform.scale(
                                            scaleX: 1.3,
                                            scaleY: 1.3,
                                            child: SvgPicture.asset(
                                              'assets/uploaddocuments.svg',height: Get.height*0.07,
                                            ))),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width*0.02,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: pdfList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:  EdgeInsets.symmetric(
                                        horizontal: Get.width*0.02),
                                    child: Container(height: Get.height*0.3,
                                      width: Get.width * 0.24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Transform.scale(
                                              scaleX: 1.2,
                                              scaleY: 1.2,
                                              child: InkWell(
                                                  onTap: () =>
                                                      openFile(pdfList[index]),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: InkWell(
                                                            onTap: () {
                                                              pdfList.remove(pdfList[index]);
                                                             setState(() {

                                                             });
                                                            },
                                                            child: Container(
                                                              height: 15,
                                                              width: 15,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    offset:
                                                                        const Offset(
                                                                            0,
                                                                            3),
                                                                    spreadRadius:
                                                                        2,
                                                                    blurRadius:
                                                                        2,
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.2),
                                                                  )
                                                                ],
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "x",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ),
                                                          )),
                                                      Center(
                                                          child: SvgPicture.asset(
                                                              'assets/docsss.svg'))
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      Text(
                        'Images',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      SizedBox(
                        height: Get.height * 0.09,
                        width: Get.width,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                final result1 =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['png', 'jpeg'],
                                );
                              if(result1!.files.toString().isNotEmpty){
                                imagesList .add(result1?.files.last.path.toString());
                              }
                              setState(() {
                                print(imagesList[0]);
                              });

                              },
                              child: Container(
                                width: Get.width * 0.23,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColorsConstants.AppMainColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: Transform.scale(
                                            scaleX: 1.3,
                                            scaleY: 1.3,
                                            child: SvgPicture.asset(
                                              'assets/uploaddocuments.svg',height: Get.height*0.07,
                                            ))),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width*0.02,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: imagesList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1.19),
                                    child: Container(
                                      height: Get.height*0.3,
                                      width: Get.width * 0.24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Transform.scale(
                                              scaleX: 1.2,
                                              scaleY: 1.2,
                                              child: InkWell(
                                                  onTap: () =>
                                                      openFile(imagesList[index]),
                                                  child:Align(
                                                      alignment: Alignment
                                                          .topRight,
                                                      child: InkWell(
                                                        onTap: () {
                                                          imagesList.remove(imagesList[index]);
                                                          setState(() {

                                                          });
                                                        },
                                                        child: Container(
                                                          height: 15,
                                                          width: 15,
                                                          decoration:
                                                          BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                100),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                offset:
                                                                const Offset(
                                                                    0,
                                                                    3),
                                                                spreadRadius:
                                                                2,
                                                                blurRadius:
                                                                2,
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                    0.2),
                                                              )
                                                            ],
                                                            color: Colors
                                                                .white,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "x",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  10,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      )),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                      Text(
                        'Doc',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      SizedBox(
                        height: Get.height * 0.09,
                        width: Get.width,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                final result1 =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['doc', 'docx'],
                                );
                              if(result1!.files.toString().isNotEmpty){
                                docList.add(result1?.files.last.path.toString());
                              }
                              setState(() {
                                print(docList[0]);
                              });

                              },
                              child: Container(
                                width: Get.width * 0.23,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColorsConstants.AppMainColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: Transform.scale(
                                            scaleX: 1.3,
                                            scaleY: 1.3,
                                            child: SvgPicture.asset(
                                              'assets/uploaddocuments.svg',height: Get.height*0.07,
                                            ))),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width*0.02,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: docList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1.19),
                                    child: Container(
                                      height: Get.height*0.3,
                                      width: Get.width * 0.24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Transform.scale(
                                              scaleX: 1.2,
                                              scaleY: 1.2,
                                              child: InkWell(
                                                  onTap: () =>
                                                      openFile(docList[index]),
                                                  child: Align(
                                                      alignment: Alignment
                                                          .topRight,
                                                      child: InkWell(
                                                        onTap: () {
                                                          docList.remove(docList[index]);
                                                          setState(() {

                                                          });
                                                        },
                                                        child: Container(
                                                          height: 15,
                                                          width: 15,
                                                          decoration:
                                                          BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                100),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                offset:
                                                                const Offset(
                                                                    0,
                                                                    3),
                                                                spreadRadius:
                                                                2,
                                                                blurRadius:
                                                                2,
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                    0.2),
                                                              )
                                                            ],
                                                            color: Colors
                                                                .white,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "x",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  10,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.015,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            CustomElevatedButton(
              onpress: () {
                Get.toNamed(RoutesName.AddPeopleScreen);
                // Get.to(YesNoScreen4());
              },
              text: "Upload",
              height: Get.height * 0.05,
              width: Get.width * 0.4,
              colors: AppColorsConstants.AppMainColor,
            ),
          ],
        ),
      ),
    );
  }
}
