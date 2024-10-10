import 'package:flutter/material.dart';
import 'package:payment_flow/core/themes/styles/app_text_styles.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/barcode_with_paid.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/credit_card_info.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/order_info_item.dart';

class BillDetailsBody extends StatelessWidget {
  const BillDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffEDEDED),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text('Thank You', style: AppTextStyles.interMedium25),
            Text(
              'Your transaction was successful',
              style: AppTextStyles.interRegular18.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 45),
            const OrderInfoItem(
              title: 'Date',
              price: '10/10/2024',
              priceStyle: AppTextStyles.interSemiBold18,
            ),
            const SizedBox(height: 15),
            const OrderInfoItem(
              title: 'Time',
              price: '12:00 PM',
              priceStyle: AppTextStyles.interSemiBold18,
            ),
            const SizedBox(height: 15),
            const OrderInfoItem(
              title: 'To',
              price: 'Kemo Emam',
              priceStyle: AppTextStyles.interSemiBold18,
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 20),
            const OrderInfoItem(
              title: 'Total',
              titleStyle: AppTextStyles.interSemiBold24,
              price: r'$60.28',
              priceStyle: AppTextStyles.interSemiBold20,
            ),
            const SizedBox(height: 25),
            const CreditCardInfo(),
            const Spacer(),
            const BarcodeWithPaid(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
