// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOptionContainer extends StatelessWidget {
  final String text;
  final VoidCallback? onpress;
  final Color? color;


  // ignore: use_key_in_widget_constructors
  CustomOptionContainer({
    required this.text,

    this.onpress,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: Get.height * 0.06,
        width: Get.width,
        decoration: BoxDecoration(
          border: Border.all(color: color ?? Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(30)),
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
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: text != null
                ? Text(text)
                : Container(), // Conditionally display the Text widget if text is provided
          ),
        ),
      ),
    );
  }
}
