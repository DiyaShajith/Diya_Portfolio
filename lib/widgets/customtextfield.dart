import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield(
      {super.key, this.controller, this.maxLines = 1, this.hintText});

  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;

  get getInputBorder => null;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: CustomColor.scaffoldBg),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          fillColor: CustomColor.whiteSecondary,
          filled: true,
          focusedBorder: getInputBorder,
          enabledBorder: getInputBorder,
          hintText: hintText,
          hintStyle: const TextStyle(color: CustomColor.hintDark)),
    );
  }
}
