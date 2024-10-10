import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class CustomDottedLine extends StatelessWidget {
  const CustomDottedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: MediaQuery.of(context).size.height * 0.2 + 16,
      child: DottedLine(
        direction: Axis.horizontal,
        lineLength: MediaQuery.of(context).size.width * 0.7,
        lineThickness: 2,
        dashLength: 4,
        dashColor: const Color(0xffCCCCCC),
      ),
    );
  }
}
