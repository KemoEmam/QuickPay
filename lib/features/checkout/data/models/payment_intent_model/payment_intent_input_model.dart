class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel(
      {required this.customerId, required this.amount, required this.currency});

  Map<String, dynamic> toJson() => {
        'amount': '${amount}00',
        'currency': currency,
      };
}
