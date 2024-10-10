import 'package:flutter/material.dart';
import 'package:payment_flow/core/helper/functions/build_app_bar.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Payment Details'),
      body: const SafeArea(
        child: PaymentDetailsViewBody(),
      ),
    );
  }
}
