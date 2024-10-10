import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xFFC7C7C7),
            thickness: 1,
          ),
        ),
        Expanded(
          child: Divider(
            color: Color(0xFFC7C7C7),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
