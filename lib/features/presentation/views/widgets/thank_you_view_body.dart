import 'package:flutter/material.dart';
import 'package:payment_flow/features/presentation/views/widgets/custom_check_mark.dart';
import 'package:payment_flow/features/presentation/views/widgets/custom_dotted_line.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            color: const Color(0xffEDEDED),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.25,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.25,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const CustomCheckMark(),
          const CustomDottedLine()
        ],
      ),
    );
  }
}
