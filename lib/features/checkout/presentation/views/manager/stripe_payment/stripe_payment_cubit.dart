import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_flow/features/checkout/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:payment_flow/features/checkout/data/repos/checkout_repo.dart';
part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  final CheckoutRepo checkoutRepo;
  StripePaymentCubit(this.checkoutRepo) : super(StripePaymentInitial());

  Future<void> makePayment(
      PaymentIntentInputModel paymentIntentInputModel) async {
    emit(StripePaymentLoading());
    var paymentIntentModel =
        await checkoutRepo.makePayment(paymentIntentInputModel);
    paymentIntentModel.fold(
      (L) => emit(StripePaymentFailure(L.errMessage)),
      (R) => emit(
        StripePaymentSuccess(),
      ),
    );
  }

  @override
  void onChange(Change<StripePaymentState> change) {
    log(change.currentState.toString());
    super.onChange(change);
  }
}
