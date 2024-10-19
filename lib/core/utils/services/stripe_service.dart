import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_flow/core/utils/services/api_dio_service.dart';
import 'package:payment_flow/features/checkout/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:payment_flow/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiDioService apiDioService;

  StripeService({required this.apiDioService});
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      var response = await apiDioService.post(
        body: paymentIntentInputModel.toJson(),
        endPoint: dotenv.env['BASE_URL']!,
        token: dotenv.env['SECRET_KEY_TOKEN'],
        contentType: 'application/x-www-form-urlencoded',
      );
      var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
      return paymentIntentModel;
    } catch (e) {
      rethrow;
    }
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          style: ThemeMode.dark,
          merchantDisplayName: 'Kemo El Emam',
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      rethrow;
    }
  }

  Future makePayment(PaymentIntentInputModel paymentIntentInputModel) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
