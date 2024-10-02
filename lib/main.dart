import 'package:flutter/material.dart';
import 'package:payment_flow/features/presentation/views/cart_view.dart';

void main() {
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
