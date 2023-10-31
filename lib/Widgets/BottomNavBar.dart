// ignore_for_file: file_names, sort_child_properties_last, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:tyedapp/View/MainScreen/MainScreen.dart';
import 'package:tyedapp/View/EditProfile/EditProfileScreen.dart';
import 'package:tyedapp/View/YouTiedAgreement/YourTiedAgreement.dart';

import '../View/AddFamilyDocumentsFolder/AddFamilyDocumentsFolder.dart';
import '../View/ProfileScreen/ProfileScreen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0; // Index of the currently selected page

  final List<Widget> _widgetOptions = [
    const MainScreen(),
    const FamilyDocumentsFolder(),
    const YourTiedAgreement(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black38,
              spreadRadius: -3,
              blurRadius: 15,
              offset: Offset(0, 0)),
        ], borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(13.0),
            bottomRight: Radius.circular(13.0),
          ),
          child: BottomNavigationBar(
            elevation: 5,
            backgroundColor: Colors.white,
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                activeIcon: Transform.scale(
                    scaleX: .9,
                    scaleY: .9,
                    child: SvgPicture.asset("assets/activehome.svg")),
                icon: SvgPicture.asset("assets/Home.svg"),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Transform.scale(
                      scaleX: .9,
                    scaleY: .9                                            ,
                    child: SvgPicture.asset("assets/Group 11352.svg")),
                icon: SvgPicture.asset("assets/unactivedocs.svg"),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Transform.scale(
                    scaleX: .9,
                    scaleY: .9,
                    child: SvgPicture.asset("assets/activeclipboard.svg")),
                icon: SvgPicture.asset("assets/clipboard-task-list-ltr_1.svg"),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Transform.scale(
                    scaleX: .9,
                    scaleY: .9,
                    child: SvgPicture.asset("assets/activepro.svg")),
                icon: SvgPicture.asset("assets/Iconly-Bulk-Profile.svg"),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
