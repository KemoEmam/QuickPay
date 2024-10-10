import 'package:flutter/material.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/bill_details_body.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/custom_check_mark.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/custom_dotted_line.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 70),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const BillDetailsBody(),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.2,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const CustomCheckMark(),
          const CustomDottedLine(),
        ],
      ),
    );
  }
}
