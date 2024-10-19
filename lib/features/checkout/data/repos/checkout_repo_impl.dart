import 'package:dartz/dartz.dart';
import 'package:payment_flow/core/utils/services/failure.dart';
import 'package:payment_flow/core/utils/services/stripe_service.dart';
import 'package:payment_flow/features/checkout/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:payment_flow/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final StripeService stripeService;

  CheckoutRepoImpl({required this.stripeService});

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
