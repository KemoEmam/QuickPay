import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_flow/core/utils/services/service_locator.dart';
import 'package:payment_flow/features/checkout/presentation/views/cart_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  serviceLocator();
  runApp(const PaymentFlow());
}

class PaymentFlow extends StatelessWidget {
  const PaymentFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartView(),
    );
  }
}
