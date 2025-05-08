import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_assests.dart';

class GetwayPayment extends StatefulWidget {
  const GetwayPayment({super.key});

  @override
  State<GetwayPayment> createState() => _GetwayPaymentState();
}

class _GetwayPaymentState extends State<GetwayPayment> {
  List<String> cards = [
    AppAssets.imgCard,
    AppAssets.imgPaypal,
  ];
  int indexSelectedPayment = 0;
  @override
  Widget build(BuildContext context) {
  return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(cards.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              indexSelectedPayment = index;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 103,
            height: 65,
            decoration: BoxDecoration(
              color: indexSelectedPayment == index
                  ?  Colors.transparent.withValues(alpha: 0.5)
                  : Colors.grey.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: indexSelectedPayment == index
                    ? const Color(0xFF34A853)
                    : Colors.grey,
                width: 5,
              ),
            ),
            child: SvgPicture.asset(
              cards[index],
              fit: BoxFit.scaleDown,
            ),
          ),
        );
      }),
    );
  }
}