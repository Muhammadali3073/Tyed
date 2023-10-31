// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';

import 'package:tyedapp/View/ShareDocumentsScreen/ShareDocumentsScreen.dart';

import '../../Widgets/ContactRow.dart';
import '../../Widgets/CustomButton.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<String> title = [
    "John smith",
    "John smith",
    "John smith",
    "John smith",
  ];

  List<String> contact = [
    "+8750348943",
    "+8750348943",
    "+8750348943",
    "+8750348943",
  ];
  List<bool> selectedItems = List.filled(4, false);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 3)
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        height: Get.height * 0.55,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Get.height * 0.025,
              ),
              child: SizedBox(
                height: Get.height * 0.024,
                width: double.infinity,
                child: Row(
                  children: [
                    IconButton(
                        iconSize: 20,
                        color: Colors.black,
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(size: 15, Icons.arrow_back_ios_new)),
                    const SizedBox(
                      width: 4,
                    ),
                    Text("Add people you want to share with",
                        style: AppTextConstant.hintText),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.10),
              child: Divider(
                  thickness: 1, color: Color.fromRGBO(204, 204, 204, 1)),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: contact.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedItems[index] = !selectedItems[index];
                      });
                    },
                    child: ContactRow(
                      contact: contact[index],
                      isSelected: selectedItems[index],
                      title: title[index],
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            CustomElevatedButton(
              onpress: () {
                Get.to(ShareDocumentsScreen());
              },
              text: "Done",
              height: Get.height * 0.04,
              width: Get.width * 0.35,
              colors: AppColorsConstants.AppMainColor,
            ),
            SizedBox(
              height: Get.height * 0.03,
            )
          ],
        ),
      )),
    );
  }
}
