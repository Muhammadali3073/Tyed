// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'RoundedButton.dart';

class ShowDialogue {
  String? title;
  String? content;
  VoidCallback? onpress;
  RxList<dynamic> count = [0].obs;
  final index = 1.obs;

  static showCustomDialog(BuildContext context,
      {String? title, String? content, VoidCallback? onpress}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: title != null
              ? Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 14, color: Color.fromRGBO(19, 20, 21, 1)),
            ),
          )
              : null, // Check if title is provided, otherwise null
          contentPadding: EdgeInsets.all(8), // Adjust padding as needed
          content: SizedBox(
            height: 170,
            width: double.infinity, // Set the desired width here
            child: Column(
              children: [
                if (content != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Text(
                        content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 12, color: Color.fromRGBO(19, 20, 21, 1)),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: onpress,
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(130, 35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: AppColorsConstants.AppMainColor),
                  child: const Text("Yes, list on next page"),
                ),
                SizedBox(
                  height: Get.height * 0.013,
                ),
                RoundedButton(
                  width: Get.height * 0.21,
                  widget: const Center(child: Text("No")),
                  height: 35,
                  onpress: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



