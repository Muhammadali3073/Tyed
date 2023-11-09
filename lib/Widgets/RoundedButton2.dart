import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'RoundedButton.dart';

class RoundedButton2 extends StatelessWidget {
  final String ?title;
  final VoidCallback? onpress;
  const RoundedButton2({
    this.title,this.onpress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedButton(onpress: onpress,
      widget: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2), // Color of the shadow
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: Offset(0, 2), // Offset of the shadow
                ),
              ],
              borderRadius: BorderRadius.circular(100)),
          height: 15,
          width: 15,
          child: const Icon(
            size: 14,
            Icons.add,
            color: Colors.red,
          ),
        ),
         Text(
          "$title",  style: TextStyle(fontSize: 11, color: Color.fromRGBO(243, 77, 77, 1)),

        )
      ]),
      width: Get.width*0.5,
      height: 32,
    );
  }
}
