import 'package:checkout_payment/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'app/views/checkout_app_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey =kStripePublishableKey;
  runApp(const CheckoutApp());
}
