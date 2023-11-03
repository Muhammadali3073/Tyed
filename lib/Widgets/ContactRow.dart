// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';

class ContactRow extends StatelessWidget {
  final String? title;
  final String? contact;
  final double? width;
  final double? height;
  final TextStyle? style;
  final double? radius;
  final Color? colors;
  final Widget? iconsdata;
  final bool isSelected;

  bool? isRemove;

  ContactRow(
      {super.key,
      this.contact,
      this.isRemove,
      this.iconsdata,
      this.title,
      this.colors,
      this.width,
      this.height,
      this.style,
      required this.isSelected,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(30),
        elevation: 4,
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: isSelected == true
                        ? AppColorsConstants.AppMainColor
                        : Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)),
            height: Get.height * 0.07,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02,vertical: Get.height * 0.01),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: radius ?? 20,
                      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
                      child: const Center(
                        child: Icon(
                            color: Color.fromRGBO(204, 204, 204, 1),
                            Icons.person_3_sharp),
                      ),
                    ),
                    SizedBox(width: Get.width * 0.02,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$title",
                          style: style ?? const TextStyle(fontSize: 12),
                        ),
                        Text(
                          "$contact",
                          style: style ?? const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                isRemove == true
                    ? Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
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
                        child: Center(
                          child: Text(
                            "x",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : Container()
              ],
            )));
  }
}
