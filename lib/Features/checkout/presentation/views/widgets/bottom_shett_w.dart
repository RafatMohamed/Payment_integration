import 'package:flutter/material.dart';

import '../../../../../core/widgets/default_material_button.dart';
import 'getway_payment.dart';
class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          const GetwayPayment(),
          const Spacer(),
          DefaultMaterialButton(
            text: 'Continue',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
