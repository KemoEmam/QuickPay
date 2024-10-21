import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_flow/core/constants/api_end_points.dart';
import 'package:payment_flow/core/utils/services/api_dio_service.dart';
import 'package:payment_flow/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payment_flow/features/checkout/data/models/init_payment_sheet_input_model.dart';
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
        endPoint: ApiEndPoints.paymentIntents,
        token: dotenv.env['SECRET_KEY_TOKEN'],
        contentType: Headers.formUrlEncodedContentType,
      );
      var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
      return paymentIntentModel;
    } catch (e) {
      rethrow;
    }
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheet}) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: initPaymentSheet.paymentIntentClientSecret,
          customerId: initPaymentSheet.customerId,
          customerEphemeralKeySecret: initPaymentSheet.ephemeralKeySecret,
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
    var emphemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);

    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKeySecret: emphemeralKeyModel.secret);

    await initPaymentSheet(initPaymentSheet: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<PaymentIntentModel> createCustomer(
      //pref customerInputModel instead of PaymentIntentInputModel as param
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      var response = await apiDioService.post(
        body: paymentIntentInputModel.toJson(),
        endPoint: ApiEndPoints.customers,
        token: dotenv.env['SECRET_KEY_TOKEN'],
        contentType: Headers.formUrlEncodedContentType,
      );
      var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
      return paymentIntentModel;
    } catch (e) {
      rethrow;
    }
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    try {
      var response = await apiDioService.post(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        endPoint: ApiEndPoints.ephemeralKeys,
        headers: {
          'Authorization': 'Bearer ${dotenv.env['SECRET_KEY_TOKEN']}',
          'Stripe-Version': '2024-09-30.acacia',
        },
      );
      var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
      return ephemeralKeyModel;
    } catch (e) {
      rethrow;
    }
  }
}
