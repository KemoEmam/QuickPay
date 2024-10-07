import 'package:flutter/material.dart';
import 'package:payment_flow/core/themes/styles/app_colors.dart';

class CustomCheckMark extends StatelessWidget {
  const CustomCheckMark({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 0,
      right: 0,
      top: -40,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Color(0xffEDEDED),
        child: CircleAvatar(
          radius: 32,
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 55,
          ),
        ),
      ),
    );
  }
}
