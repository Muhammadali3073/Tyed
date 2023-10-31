// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';

import '../../Widgets/ContactRow.dart';
import '../../Widgets/CustomButton.dart';
import '../../utils/Utils.dart';

class ChangePasscode extends StatefulWidget {
  const ChangePasscode({super.key});

  @override
  State<ChangePasscode> createState() => _ChangePasscodeState();
}

class _ChangePasscodeState extends State<ChangePasscode> {
  String oldPassCode = '3x3w3zy3';
  String newPassCode = '3x3w3zy3';
  List<String> title = [
    "John smith",
    "John smith",
  ];
  List<String> contact = [
    "+8750348943",
    "+8750348943",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * 0.07,
              ),
              SvgPicture.asset(
                'assets/changepasspic.svg',
                height: Get.height * 0.22,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              const Text(
                'Change Code',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Get.height * 0.015,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: const Text(
                        'Old Passcode',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: Get.height * 0.04,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: oldPassCode.length,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: index == 0 || index == newPassCode.length - 1
                                ? Get.width * 0.09
                                : Get.width * 0.085,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 2),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.horizontal(
                                    left:
                                        Radius.circular(index == 0 ? 20.0 : 0),
                                    right: Radius.circular(
                                        index == oldPassCode.length - 1
                                            ? 20.0
                                            : 0))),
                            child: Text(
                              oldPassCode[index].toString(),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: const Text(
                        'New Passcode',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: Get.height * 0.04,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: newPassCode.length,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: index == 0 || index == newPassCode.length - 1
                                ? Get.width * 0.09
                                : Get.width * 0.085,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 2),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.horizontal(
                                    left:
                                        Radius.circular(index == 0 ? 20.0 : 0),
                                    right: Radius.circular(
                                        index == newPassCode.length - 1
                                            ? 20.0
                                            : 0))),
                            child: Text(
                              newPassCode[index].toString(),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    CustomPaint(
                      painter: DrawDottedhorizontalline(),
                      child: const SizedBox(
                        width: double.infinity,
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.015,
              ),
              Text(
                'Change passcode request will be sent\n to admins for approval',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Get.height * 0.012,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.height * 0.025),
                child: Container(
                  decoration: BoxDecoration(
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
                  height: Get.height * 0.14,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: Get.height * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomElevatedButton(
                          onpress: () {},
                          text: "Admin",
                          height: Get.height * 0.028,
                          width: Get.width * 0.23,
                          colors: Colors.black,
                        ),
                        SizedBox(width: Get.width * 0.03),
                        SizedBox(
                          width: Get.width * 0.38,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: contact.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: ContactRow(isSelected: false,
                                    height: Get.height * 0.048,
                                    radius: 17,
                                    style: const TextStyle(fontSize: 9),
                                    width: Get.width * 0.35,
                                    contact: contact[index],
                                    title: title[index],
                                    iconsdata: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 7, top: 4),
                                      child: Align(
                                          alignment: Alignment.topRight,
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: const Offset(0, 3),
                                                    spreadRadius: 2,
                                                    blurRadius: 2,
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                  )
                                                ],
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "x",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          )),
                                    )),
                              );
                            },
                          ),
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
                  Utils.showDialogBox3(
                    title1: "Done",
                    context,
                    title:
                        "Request has been submitted wait for other admins to approve",
                    content:
                        "Request has been submitted wait for other admins to approve",
                    onpress: () {},
                  );
                },
                text: "Send",
                height: 38,
                width: Get.width * 0.4,
                colors: AppColorsConstants.AppMainColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawDottedhorizontalline extends CustomPainter {
  final Paint _paint;
  DrawDottedhorizontalline() : _paint = Paint() {
    _paint.color = Color.fromRGBO(204, 204, 204, 1); //dots color
    _paint.strokeWidth = 2; //dots thickness
    _paint.strokeCap = StrokeCap.square; //dots corner edges
  }
  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -300; i < 300; i = i + 15) {
      // 15 is space between dots
      if (i % 3 == 0) {
        canvas.drawLine(Offset(i, 0.0), Offset(i + 10, 0.0), _paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
