import 'package:flutter/material.dart';
import 'package:payment_flow/features/presentation/views/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Transform.translate(
          offset: const Offset(0, 55),
          child: const ThankYouViewBody(),
        ),
      ),
    );
  }
}
