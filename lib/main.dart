import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:payment_flow/features/checkout/presentation/views/cart_view.dart';

void main() async {
  await dotenv.load(fileName: ".env");
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
