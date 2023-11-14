// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';

import '../Constant/Constants/routes/routesName.dart';

class CustomPdfRow extends StatelessWidget {
  Widget? column1;
  Widget? column2;
  Function() onTap;

  CustomPdfRow(
      {Key? key,
      this.column1,
      this.column2,
        required this.onTap
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Get.height * 0.08,
        width: Get.width,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                width: Get.width * 0.18,
                child: Center(
                  child: SvgPicture.asset("assets/pdficon.svg"),
                ),
              ),
            ),
            SizedBox(width: Get.width * 0.03),
            column1 ?? Container(),
            // Use column1 widget if provided, else use an empty Container
            column2 ?? Container(),
            // Use column2 widget if provided, else use an empty Container
          ],
        ),
      ),
    );
  }
}
