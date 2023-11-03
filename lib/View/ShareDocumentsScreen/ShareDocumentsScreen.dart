// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Widgets/ContactRow.dart';
import '../../Widgets/CustomAppbar2.dart';
import '../../Widgets/CustomButton.dart';

class ShareDocumentsScreen extends StatefulWidget {
  const ShareDocumentsScreen({super.key});

  @override
  State<ShareDocumentsScreen> createState() => _ShareDocumentsScreenState();
}

class _ShareDocumentsScreenState extends State<ShareDocumentsScreen> {
  bool isExpanded = false;

  List<String> title = [
    "John smith",
    "John smith",
    "John smith",
  ];

  List<String> contact = [
    "+8750348943",
    "+8750348943",
    "+8750348943",
  ];

  @override
  Widget build(BuildContext context) {
    // double containerHeight = isExpanded ? 120.0 : 60.0;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              CustomAppBar2(
                height: Get.height * 0.1,
                titleText: "Share",
                style: const TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        color: Colors.grey.withOpacity(0.2),
                      )
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shrinkWrap: true,
                        itemCount: contact.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 3.5 / 1,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return ContactRow(isSelected: false,
                              radius: 15,
                              style: const TextStyle(fontSize: 9),
                              width: Get.width * 0.45,
                              contact: contact[index],
                              title: title[index],
                             isRemove: true,
                              );
                        },
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                    ],
                  )),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 3),
                          spreadRadius: 2,
                          blurRadius: 2,
                          color: Colors.grey.withOpacity(0.2),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 3),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      color: Colors.grey.withOpacity(0.2),
                                    )
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              height: Get.height * 0.06,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  CustomElevatedButton(
                                    onpress: () {},
                                    text: "Document:",
                                    style: const TextStyle(fontSize: 10),
                                    height: 23,
                                    width: 82,
                                    colors: const Color.fromRGBO(45, 45, 45, 1),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.05,
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.transparent,
                                    child: SvgPicture.asset(
                                      "assets/docs.svg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Text("Document 1"),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 3),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  color: Colors.grey.withOpacity(0.2),
                                )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          height: Get.height * 0.06,
                          width: double.infinity,
                          child: Row(
                            children: [
                              CustomElevatedButton(
                                onpress: () {},
                                text: "Owner",
                                style: const TextStyle(fontSize: 10),
                                height: 23,
                                width: 82,
                                colors: const Color.fromRGBO(45, 45, 45, 1),
                              ),
                              SizedBox(
                                width: Get.width * 0.05,
                              ),
                              const CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                    AssetImage("assets/profile (2).jpg"),
                              ),
                              SizedBox(
                                width: Get.width * 0.01,
                              ),
                              const Text(
                                "John Michelle",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 3),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  color: Colors.grey.withOpacity(0.2),
                                )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          // height: containerHeight,
                          // width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  CustomElevatedButton(
                                    onpress: () {},
                                    text: "Admin",
                                    style: const TextStyle(fontSize: 10),
                                    height: 23,
                                    width: 82,
                                    colors: const Color.fromRGBO(45, 45, 45, 1),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.05,
                                  ),
                                  Text(
                                    "Select Admin",
                                    style: AppTextConstant.SimpleStyle.copyWith(
                                        color: AppColorsConstants.AppMainColor),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isExpanded =
                                              !isExpanded; // Toggle the state on button press
                                        });
                                      },
                                      icon: SvgPicture.asset("assets/v.svg"))
                                ],
                              ),
                              if (isExpanded)
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: contact.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            child: ContactRow(isSelected: false,
                                              radius: 15,
                                              style:
                                                  const TextStyle(fontSize: 9),
                                              width: Get.width * 0.3,
                                              contact: contact[index],
                                              title: title[index],
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.012,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              CustomElevatedButton(
                onpress: () {
                  Get.toNamed(RoutesName.PaymentMethod,arguments: 'Family');
                },
                text: "Share",
                height: Get.height * 0.04,
                width: Get.width * 0.35,
                colors: AppColorsConstants.AppMainColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
