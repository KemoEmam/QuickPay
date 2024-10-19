import 'package:get_it/get_it.dart';
import 'package:payment_flow/core/utils/services/api_dio_service.dart';
import 'package:payment_flow/core/utils/services/stripe_service.dart';
import 'package:payment_flow/features/checkout/data/repos/checkout_repo.dart';
import 'package:payment_flow/features/checkout/data/repos/checkout_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton<ApiDioService>(ApiDioService());
  getIt.registerSingleton<StripeService>(
    StripeService(apiDioService: getIt<ApiDioService>()),
  );
  getIt.registerSingleton<CheckoutRepo>(
    CheckoutRepoImpl(stripeService: getIt<StripeService>()),
  );
}
