// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';

import '../../Widgets/CustomButton.dart';

class YourPasscode extends StatefulWidget {
  const YourPasscode({super.key});

  @override
  State<YourPasscode> createState() => _YourPasscodeState();
}

class _YourPasscodeState extends State<YourPasscode> {
  String YourPassCode = '3x3w3zy3';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * 0.02,
              ),
              Center(
                child: Image.asset(
                  'assets/yourpasscodecreenimage.png',
                  height: Get.height * 0.3,
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                'Your Documents of insurance are shared successfully',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              CustomPaint(
                painter: DrawDottedHorizontalLine(),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                'Your Passcode',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                alignment: Alignment.center,
                height: Get.height * 0.04,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: YourPassCode.length,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Material(
                      child: Container(
                        width: index == 0 || index == YourPassCode.length - 1
                            ? Get.width * 0.09
                            : Get.width * 0.085,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 2),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.2), // Color of the shadow
                                spreadRadius: 2, // Spread radius
                                blurRadius: 2, // Blur radius
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(index == 0 ? 20.0 : 0),
                                right: Radius.circular(
                                    index == YourPassCode.length - 1
                                        ? 20.0
                                        : 0))),
                        child: Text(
                          YourPassCode[index].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColorsConstants.AppMainColor),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Text(
                'Copy and share with your family',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: Get.height * 0.055,
              ),
              CustomElevatedButton(
                onpress: () {
                  // Get.arguments == 'Tyed'?
                  // Get.toNamed(RoutesName.DownloadScreen) :
                  // Get.toNamed(RoutesName.FamilyDocumentsFolder);
                  Get.offAllNamed(RoutesName.CustomBottomNavigationBar);
                },
                text: "Done",
                height: Get.height * 0.05,
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

class DrawDottedHorizontalLine extends CustomPainter {
  final Paint _paint;

  DrawDottedHorizontalLine() : _paint = Paint() {
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
