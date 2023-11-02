// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/View/EditProfile/EditProfileScreen.dart';
import 'package:tyedapp/viewModel/GetUserDataController/GetUserDataController.dart';

import '../../Constant/Constants/routes/routesName.dart';
import '../../Widgets/EditProfileWidget.dart';
import '../../viewModel/SigninController/SigninController.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  SignInController signInController = Get.find(tag: 'signInController');
  GetUserDataController getUserDataController =
      Get.find(tag: 'getUserDataController');

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.grey[250],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColorsConstants.AppMainColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            )),
                    height: Get.height * 0.15,
                  ),
                  Center(
                    child: Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.043),
                        child: getUserDataController.getUserDataRxModel.value!
                                .profileImage!.isNotEmpty
                            ? Container(
                                height: Get.height * 0.20,
                                width: Get.width * 0.20,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.scaleDown,
                                      image: NetworkImage(getUserDataController
                                          .getUserDataRxModel
                                          .value!
                                          .profileImage
                                          .toString())),
                                  color: Colors.grey.withOpacity(0.5),
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
                              )),
                  ),
                  Center(
                    child: Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.20),
                        child: Text(
                            '${getUserDataController.getUserDataRxModel.value!.userFirstName!.trim()} ${getUserDataController.getUserDataRxModel.value!.userLastName!.trim()}',
                            style: TextStyle(
                                color: Color.fromRGBO(19, 20, 21, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.bold))),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  color:
                      Colors.white, // Set the background color of the container
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      // Color of the shadow
                      spreadRadius: 5,
                      // Spread radius
                      blurRadius: 7,
                      // Blur radius
                      offset: const Offset(0, 2), // Offset of the shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.026,
                      ),
                      InkWell(
                        onTap: () => Get.to(EditProfile()),
                        child: CustomRowWithIcon(
                          svgImagePath: 'assets/editprofile1.svg',
                          text: 'Edit Profile',
                          iconData: Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.022,
                      ),
                      CustomRowWithIcon(
                        svgImagePath: 'assets/editprofile2.svg',
                        text: 'Language',
                        iconData: Icons.arrow_forward_ios_outlined,
                      ),
                      SizedBox(
                        height: Get.height * 0.022,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(RoutesName.PrivacyPolicyScreen);
                        },
                        child: CustomRowWithIcon(
                          svgImagePath: 'assets/editprofile3.svg',
                          text: "Privacy & Policy",
                          iconData: Icons.arrow_forward_ios_outlined,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.022,
                      ),
                      CustomRowWithIcon(
                        svgImagePath: 'assets/editprofile4.svg',
                        text: 'Help',
                        iconData: Icons.arrow_forward_ios_outlined,
                      ),
                      SizedBox(
                        height: Get.height * 0.032,
                      ),
                      SizedBox(
                        height: Get.height * 0.022,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.006,
              ),
              Container(
                height: Get.height * 0.05,
                decoration: BoxDecoration(
                  color:
                      Colors.white, // Set the background color of the container
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      // Color of the shadow
                      spreadRadius: 5,
                      // Spread radius
                      blurRadius: 7,
                      // Blur radius
                      offset: const Offset(0, 2), // Offset of the shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () {
                      signInController.signOutHandler();
                    },
                    child: CustomRowWithIcon(
                      svgImagePath: 'assets/signout.svg',
                      text: 'Signout',
                      iconData: Icons.arrow_forward_ios_outlined,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.06,
              ),
              signInController.isSignOutLoading.value
                  ? SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                          color: AppColorsConstants.AppMainColor),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
