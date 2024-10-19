import 'package:flutter/material.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/payment_options_section.dart';

class PaymentMehodsBottomSheet extends StatelessWidget {
  const PaymentMehodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          PaymentOptionsSection(),
          SizedBox(height: 25),
          CustomButtonBlocConsumer()
        ],
      ),
    );
  }
}
