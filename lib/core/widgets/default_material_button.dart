import 'package:checkout_payment/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DefaultMaterialButton extends StatelessWidget {
  const DefaultMaterialButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialButton(
      height: size.height * 0.075,
      minWidth: double.infinity,
      onPressed: onPressed,
      elevation:5,
      color: const Color(0xff34A853),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
              style: BorderStyle.solid,
              width: 0.2),
      ),
      child: Text(
        text,
        style: Styles.style22
      ),
    );
  }
}
