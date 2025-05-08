import 'package:flutter/material.dart';

import '../../Features/checkout/presentation/views/my_cart_view.dart';

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});


  @override
  Widget build(BuildContext context) {
   return const MaterialApp(
     home: MyCartView(),
   );
  }
}