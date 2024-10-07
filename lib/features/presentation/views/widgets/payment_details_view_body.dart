import 'package:flutter/material.dart';
import 'package:payment_flow/features/presentation/views/widgets/custom_credit_card.dart';
import 'package:payment_flow/features/presentation/views/widgets/payment_button.dart';
import 'package:payment_flow/features/presentation/views/widgets/payment_options_section.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 5),
              PaymentOptionsSection(screenWidth: screenWidth),
              const SizedBox(height: 5),
              CustomCreditCard(
                autovalidateMode: autovalidateMode,
                formKey: formKey,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: PaymentButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
            formKey: formKey,
          ),
        )
      ],
    );
  }
}
