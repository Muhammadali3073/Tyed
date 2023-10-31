// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/viewModel/EditProfileScreenController/EditProfileScreenController.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomTextField1.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  EditProfileController editProfileController =
      Get.put(EditProfileController(), tag: 'editProfileController');

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColorsConstants.AppMainColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      height: Get.height * 0.15,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.043),
                        child: editProfileController.selectedImage.value != null
                            ? Container(
                                height: Get.height * 0.20,
                                width: Get.width * 0.20,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.scaleDown,
                                      image: FileImage(
                                          File(
                                          editProfileController
                                              .selectedImage.value!.path))),
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              )
                            : Container(
                                height: Get.height * 0.20,
                                width: Get.width * 0.20,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                    "assets/profileimagefinal.jpg",
                                  )),
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                      ),
                    ),
                    Positioned(
                      left: Get.width * 0.51,
                      top: Get.height * 0.15,
                      child: InkWell(
                        onTap: () {
                          editProfileController.pickedImage();
                        },
                        child: SvgPicture.asset(
                          "assets/camera.svg",
                        ),
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.05,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon:  Icon(Icons.arrow_back_ios_new,
                            size: 20,color: Colors.white), // Fixed icon size
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomTextField1(
                          keyboardType: TextInputType.name,
                          controller: editProfileController.firstNameController,
                          svgIcon: Transform.scale(
                              scale: .6,
                              child:
                                  SvgPicture.asset("assets/bulkprofile.svg")),
                          name: "First Name"),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      CustomTextField1(
                          keyboardType: TextInputType.name,
                          controller: editProfileController.lastNameController,
                          svgIcon: Transform.scale(
                              scaleX: .6,
                              scaleY: .6,
                              child:
                                  SvgPicture.asset("assets/bulkprofile.svg")),
                          name: "Last Name"),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      CustomTextField1(
                          keyboardType: TextInputType.emailAddress,
                          controller: editProfileController.emailController,
                          svgIcon: Transform.scale(
                              scaleX: .6,
                              scaleY: .6,
                              child: SvgPicture.asset("assets/message.svg")),
                          name: "Email"),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      CustomTextField1(
                          keyboardType: TextInputType.streetAddress,
                          controller: editProfileController.addressController,
                          svgIcon: Transform.scale(
                              scaleX: .6,
                              scaleY: .6,
                              child: SvgPicture.asset("assets/Location.svg")),
                          name: "Address"),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      CustomTextField1(
                          readonly: true,
                          onTap: () {
                            editProfileController.selectDOB(context);
                          },
                          controller: editProfileController.dateController,
                          svgIcon: Transform.scale(
                              scaleX: .6,
                              scaleY: .6,
                              child: SvgPicture.asset("assets/Calendar.svg")),
                          name: "MM DD YYYY"),
                      SizedBox(
                        height: Get.height * 0.1,
                      ),
                      CustomElevatedButton(
                        onpress: () {},
                        text: "Save",
                        height: Get.height * 0.05,
                        width: Get.width * 0.42,
                        colors: AppColorsConstants.AppMainColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
