import 'package:flutter/material.dart';
import 'package:payment_flow/features/presentation/views/widgets/payment_options.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(height: 25),
        PaymentOptionsSection(screenWidth: screenWidth),
      ],
    );
  }
}
