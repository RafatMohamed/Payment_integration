import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import '../../model.dart';

Widget defaultCreditCardWidget({
  required BuildContext context,
  required int index,
  required List<CardDetails> cardsData,
  required CardType cardType,
 required  List<Color> cardColors,
} ){
  final Size size = MediaQuery.of(context).size;
  return CreditCardWidget(
    cardNumber: cardsData[index].cardNumber,
    expiryDate: cardsData[index].expiryDate,
    cardHolderName: cardsData[index].cardHolderName,
    cvvCode: cardsData[index].cvvCode,
    showBackView: cardsData[index].isCvvFocused,
    onCreditCardWidgetChange: (brand) {},
    bankName: 'Name of the Bank',
    glassmorphismConfig: Glassmorphism(
      blurX: BorderSide.strokeAlignCenter,
      blurY: BorderSide.strokeAlignCenter,
      gradient: LinearGradient(
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter,
        colors: cardColors,
      ),
    ),
    enableFloatingCard: true,
    floatingConfig: const FloatingConfig(),
    labelValidThru: 'Expires',
    obscureCardNumber: true,
    obscureInitialCardNumber: false,
    obscureCardCvv: true,
    labelCardHolder: 'CARD HOLDER',
    cardType: cardType,
    isHolderNameVisible: true,
    isChipVisible: true,
    isSwipeGestureEnabled: true,
    animationDuration: const Duration(milliseconds: 500),
    height: 175,
    width: size.width * 0.75,
    textStyle: const TextStyle(color: Colors.black),
  );
}

