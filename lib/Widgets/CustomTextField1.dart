// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField1 extends StatelessWidget {
  final TextInputType? keyboardType;
  final bool? readonly;
  final String? name;
  Widget? svgIcon;
  TextEditingController? controller;
  VoidCallback? onTap;

  CustomTextField1(
      {super.key,
        this.name,
        this.svgIcon,
        this.controller,
        this.onTap,
        this.readonly , this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 28,
        child: TextFormField(
            keyboardType: keyboardType,
            readOnly: readonly ?? false,
            onTap: onTap,
            controller: controller,
            decoration: InputDecoration(
                hintText: name,
                hintStyle: const TextStyle(
                    fontSize: 12, color: Color.fromRGBO(216, 215, 215, 1)),
                prefixIcon: svgIcon),
            ),
        );
    }
}