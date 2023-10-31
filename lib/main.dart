// ignore_for_file: must_be_immutable
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Constant/Constants/routes/routes.dart';
import 'Constant/Constants/routes/routesName.dart';
import 'firebase_options.dart';
import 'viewModel/SigninController/SigninController.dart';
import 'viewModel/SignupController/SignUpController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Check Login or Not
  SharedPreferences? prefs = await SharedPreferences.getInstance();
  bool isLogin = false;
  isLogin = prefs.getBool('isLogin') ?? false;
  log('isLogin $isLogin');
  // End Check Login or Not


  runApp(MyApp(
    isLogin: isLogin,
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key, this.isLogin});

  dynamic isLogin;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SignInController signInController =
  Get.put(SignInController(), tag: 'signInController');
  SignupController signupController =
  Get.put(SignupController(), tag: 'signupController');
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: widget.isLogin
          ? RoutesName.CustomBottomNavigationBar
          : RoutesName.OnboardScreen,
      getPages: AppRoutes.routes,
    );
  }
}
