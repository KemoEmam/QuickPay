import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_flow/core/themes/styles/app_colors.dart';
import 'package:payment_flow/core/themes/styles/app_text_styles.dart';
import 'package:payment_flow/features/checkout/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:payment_flow/features/checkout/presentation/views/manager/stripe_payment/stripe_payment_cubit.dart';
import 'package:payment_flow/features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment_flow/features/checkout/presentation/views/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const ThankYouView(),
          ));
        }

        if (state is StripePaymentFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: AppColors.primaryColor,
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is StripePaymentLoading ? true : false,
          textStyle: AppTextStyles.interMedium22,
          textColor: Colors.black,
          text: 'Pay Now',
          onPressed: () {
            BlocProvider.of<StripePaymentCubit>(context).makePayment(
              PaymentIntentInputModel(
                customerId: 'cus_R3eN5AbAXlUodb',
                amount: '100',
                currency: 'USD',
              ),
            );
          },
          buttonColor: AppColors.primaryColor,
        );
      },
    );
  }
}
