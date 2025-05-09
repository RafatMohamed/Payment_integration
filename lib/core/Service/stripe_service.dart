import 'package:checkout_payment/Features/checkout/data/model/payment_intent_model.dart';
import 'package:checkout_payment/core/Service/network/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../Features/checkout/data/model/payment_inpur_model.dart';

class StripeService{
  ApiHelper apiHelper = ApiHelper();
  Future<PaymentIntentModel> createTestPaymentSheet({required PaymentInputModel paymentInputModel}) async {
    final paymentIntent = await apiHelper.postDioRequest(
      body: paymentInputModel.toJson(),
    );
    return PaymentIntentModel.fromJson(paymentIntent.data);
  }

  Future<void> initPaymentSheet({required String paymentIntentClientSecret}) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Raafat ',
          paymentIntentClientSecret: paymentIntentClientSecret,
        ),
      );
    } catch (e) {
      print(e);
    }
  }
  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      print(e);
    }
  }

  Future<void> confirmPaymentSheet({required PaymentInputModel paymentInputModel}) async {
    try {
    var paymentIntentModel = await createTestPaymentSheet(paymentInputModel: paymentInputModel);
     await initPaymentSheet(paymentIntentClientSecret: paymentIntentModel.clientSecret);
     await displayPaymentSheet();
    } catch (e) {
      print(e);
    }
  }
}