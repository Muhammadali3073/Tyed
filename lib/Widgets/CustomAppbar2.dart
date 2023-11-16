// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar2 extends StatelessWidget {
  final String? titleText;
  final double? customWidth; // Add a customWidth parameter
  final double? height;
  final Widget? icon;
  final TextStyle? style;
  bool? isBack;
  bool? isArgument;
  Function()? onPressed;

  CustomAppBar2(
      {this.isBack,
      this.titleText,
      this.icon,
      this.style,
      this.customWidth,
      this.height,
      this.isArgument,
      this.onPressed}); // Default to 12% of the screen width

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
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
      height:
          height ?? Get.height * 0.08, // You can adjust the height as needed
      child: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isBack != true
                ? isArgument == true
                    ? IconButton(
                        onPressed: onPressed ??
                            () {
                              Get.back();
                            },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 14,
                        ),
                      )
                    : IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: 14,
                          color: Colors.white,
                        ),
                      )
                : IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
            Text(
              titleText!,
              style: style ?? TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: Get.width * 0.18,
              child: icon,
            )
          ],
        ),
      ),
    );
  }
}
