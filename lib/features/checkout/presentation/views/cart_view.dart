import 'package:flutter/material.dart';
import 'package:payment_flow/core/helper/functions/build_app_bar.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'My Cart'),
      body: const SafeArea(
        child: CartViewBody(),
      ),
    );
  }
}
