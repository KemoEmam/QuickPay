import 'package:flutter/material.dart';
import 'package:payment_flow/core/themes/styles/app_colors.dart';
import 'package:payment_flow/core/themes/styles/app_images.dart';
import 'package:payment_flow/core/themes/styles/app_text_styles.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/custom_button.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/custom_divider.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/floating_item_info.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';
import 'order_info_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Image.asset(
                    AppImages.imagesBasket, // Replace with your asset
                    height: MediaQuery.of(context).size.height * 0.45,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.width * 0.37,
                  child: const FloatingCartItem(),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const OrderInfoItem(
              title: 'Order Subtotal',
              price: r'$53.28',
            ),
            const OrderInfoItem(
              title: 'Discount',
              price: r'$0.00',
            ),
            const OrderInfoItem(
              title: 'Shipping',
              price: r'$7.00',
            ),
            const SizedBox(height: 15),
            const CustomDivider(),
            const SizedBox(height: 20),
            const OrderInfoItem(
              titleStyle: AppTextStyles.interSemiBold24,
              title: 'Total',
              price: r'$60.28',
            ),
            const SizedBox(height: 40),
            CustomButton(
              textStyle: AppTextStyles.interMedium22,
              textColor: Colors.black,
              text: 'Complete Order',
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const PaymentDetailsView(),
                //   ),
                // );
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const PaymentMehodsBottomSheet());
              },
              buttonColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
