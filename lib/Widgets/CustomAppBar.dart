// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? svgImagePath;

  const CustomAppBar({
    Key? key,
    this.svgImagePath,
  }) : super(key: key);

  @override
  Size get preferredSize =>
      Size.fromHeight(Get.height * 0.15); // Specify the preferred size

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          backgroundColor: Color.fromRGBO(255, 250, 251, 1),
          elevation: 0,
          toolbarHeight: 150,
          leading: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon:  Icon(size: 15, Icons.arrow_back_ios_new,color: Colors.white,)),
            ),
          ),
          flexibleSpace: ClipPath(
            clipper: MyClipper1(),
            child: Material(
              elevation: 0,
              child: Container(
                height: 140,
                width: double.infinity,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: svgImagePath != null
              ? SvgPicture.asset(
                  svgImagePath!) // Load SVG using SvgPicture.asset
              : Container(), // Optional SVG image display
        ),
      ],
    );
  }
}

class MyClipper1 extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2 - 150,
      size.height / 2,
      size.width / 2 - 20,
      size.height / 2,
    );
    path.lineTo(size.width - 70, size.height / 2);
    path.quadraticBezierTo(
      size.width,
      size.height / 2,
      size.width,
      size.height / 2 - 100,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
