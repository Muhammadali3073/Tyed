// ignore_for_file: must_be_immutable, non_constant_identifier_names, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tyedapp/Constant/Constants/colors/Constants.dart';
import 'package:tyedapp/Constant/Constants/founts/Constants.dart';
import 'package:tyedapp/Constant/Constants/routes/routesName.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/signuppwidgets.dart';
import '../../viewModel/SignupController/SignUpController.dart';

import '../Signin/SignInScreen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignupController signupController = Get.find(tag: 'signupController');

  var sizeBoxHeight = SizedBox(height: Get.height * 0.015);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/signupsignin.png',
                  height: Get.height * 0.25,
                  width: Get.width * 0.58,
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Text(
                  'Sign Up',
                  style: AppTextConstant.BoldStyle,
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                CustomTextFieldSignup(
                  controller: signupController.firstNameController,
                  keyboardType: TextInputType.name,
                  hintText: 'First name',
                  prefixIcon: Transform.scale(
                    scaleX: .4,
                    scaleY: .4,
                    child: SvgPicture.asset(
                      'assets/Iconly-Bold-Profile.svg',
                    ),
                  ),
                ),
                sizeBoxHeight,
                CustomTextFieldSignup(
                  controller: signupController.lastNameController,
                  keyboardType: TextInputType.name,
                  hintText: 'Last name',
                  prefixIcon: Transform.scale(
                    scaleX: .4,
                    scaleY: .4,
                    child: SvgPicture.asset(
                      'assets/Iconly-Bold-Profile.svg',
                    ),
                  ),
                ),
                sizeBoxHeight,
                CustomTextFieldSignup(
                  controller: signupController.emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Email',
                  prefixIcon: Transform.scale(
                    scaleX: .4,
                    scaleY: .4,
                    child: SvgPicture.asset(
                      'assets/email.svg',
                    ),
                  ),
                ),
                sizeBoxHeight,
                CustomTextFieldSignup(
                  controller: signupController.phoneNumberController,
                  keyboardType: TextInputType.phone,
                  hintText: 'Phone number',
                  prefixIcon: Transform.scale(
                    scaleX: .4,
                    scaleY: .4,
                    child: SvgPicture.asset(
                      'assets/phone.svg',
                    ),
                  ),
                ),
                sizeBoxHeight,
                CustomTextFieldSignup(
                  controller: signupController.addressController,
                  keyboardType: TextInputType.text,
                  hintText: 'Address',
                  prefixIcon: Transform.scale(
                    scaleX: .4,
                    scaleY: .4,
                    child: SvgPicture.asset(
                      'assets/Location.svg',
                    ),
                  ),
                ),
                sizeBoxHeight,
                CustomTextFieldSignup(
                  controller: signupController.dOBController,
                  readOnly: true,
                  onTap: () {
                    signupController.selectDOB(context);
                  },
                  hintText: 'MM DD YYYY',
                  prefixIcon: Transform.scale(
                    scaleX: .4,
                    scaleY: .4,
                    child: SvgPicture.asset(
                      'assets/Calendar.svg',
                    ),
                  ),
                ),
                sizeBoxHeight,
                CustomTextFieldSignup(
                  controller: signupController.passwordController,
                  obscureText: signupController.isShowPassword.value,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      signupController.isShowPassword.value =
                          !signupController.isShowPassword.value;
                    },
                    child: Transform.scale(
                      scaleX: .7,
                      scaleY: .7,
                      alignment: Alignment.center,
                      child: signupController.isShowPassword.value
                          ? SvgPicture.asset(
                              'assets/eye.svg',
                            )
                          : Icon(Icons.password_outlined, color: Colors.grey),
                    ),
                  ),
                  hintText: 'Password',
                  prefixIcon: Transform.scale(
                    scaleX: .4,
                    scaleY: .4,
                    child: SvgPicture.asset(
                      'assets/Lock.svg',
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        signupController.isCheckedTC.value =
                            !signupController.isCheckedTC.value;
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 2, // Blur radius
                              offset: Offset(1.1, 2.1),
                            ),
                          ],
                        ),
                        child: signupController.isCheckedTC.value
                            ? Icon(
                                Icons.check,
                                size: 15,
                                color: Colors.green,
                              )
                            : null,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('I agree to'),
                    InkWell(
                      onTap: () => Get.toNamed(RoutesName.PrivacyPolicyScreen),
                      child: Text(
                        'Terms and Conditions',
                        style:
                            TextStyle(color: AppColorsConstants.AppMainColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                signupController.isSignUpLoading.value
                    ? SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                            color: AppColorsConstants.AppMainColor),
                      )
                    : CustomElevatedButton(
                        width: Get.width * 0.4,
                        text: 'Sign up',
                        onpress: () {
                          signupController.signUpHandler(
                            userEmail:
                                signupController.emailController.text.trim(),
                            userPassword:
                                signupController.passwordController.text.trim(),
                            userPhoneNumber:
                                signupController.phoneNumberController.text,
                            userDOB: signupController.dOBController.text,
                            userAddress:
                                signupController.addressController.text,
                            userLastName:
                                signupController.lastNameController.text,
                            userFirstName:
                                signupController.firstNameController.text,
                          );
                        },
                      ),
                sizeBoxHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an Account?',
                      style: AppTextConstant.SimpleStyle,
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Get.to(SignInScreen());
                      },
                      child: Text(
                        'Sign in',
                        style: AppTextConstant.BoldStyle.copyWith(
                            fontSize: 15,
                            color: AppColorsConstants.AppMainColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
