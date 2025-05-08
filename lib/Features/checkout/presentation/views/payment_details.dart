import 'package:checkout_payment/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_payment/Features/checkout/presentation/views/widgets/credit_card.dart';
import 'package:checkout_payment/Features/checkout/presentation/views/widgets/custome_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:checkout_payment/Features/checkout/presentation/views/widgets/getway_payment.dart';
import '../../../../core/widgets/default_material_button.dart';
import '../model.dart';

class PaymentDetailsView extends StatefulWidget {
  const PaymentDetailsView({super.key, required this.total});
  final int total ;

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  int indexSelectCard = 0;
  List<CardDetails> cardsData = [
    CardDetails(cardNumber: '', expiryDate: '', cardHolderName: '', cvvCode: ''),
    CardDetails(cardNumber: '', expiryDate: '', cardHolderName: '', cvvCode: ''),
    CardDetails(cardNumber: '', expiryDate: '', cardHolderName: '', cvvCode: ''),
    CardDetails(cardNumber: '', expiryDate: '', cardHolderName: '', cvvCode: ''),
  ];
@override
  void dispose() {
_pageController.dispose();
super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    CardDetails cardDetails = cardsData[indexSelectCard];

    List<Widget> cardList = [
      defaultCreditCardWidget(
        context: context,
        index: 0,
        cardColors: [
          const Color(0xff9EC7CB),
          const Color(0xffC0C5AA),
          const Color(0xffFFC16E),
        ],
        cardsData: cardsData,
        cardType: CardType.visa,
      ),
      defaultCreditCardWidget(
        context: context,
        index: 1,
        cardColors: [
          const Color(0x7F7D80C7),
          const Color(0x99BED1FC),
        ],
        cardsData: cardsData,
        cardType: CardType.hipercard,
      ),
      defaultCreditCardWidget(
        context: context,
        index: 2,
        cardColors: [
          Colors.black,
          Colors.grey,
          Colors.white,
        ],
        cardsData: cardsData,
        cardType: CardType.elo,
      ),
      defaultCreditCardWidget(
        context: context,
        index: 3,
        cardColors: [
          Colors.green,
          Colors.white,
          Colors.yellowAccent,
        ],
        cardsData: cardsData,
        cardType: CardType.mastercard,
      ),
    ];



    return Scaffold(
      appBar: defaultAppBar(title: 'Payment Details', context: context),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height * 0.895,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 10),
            child: Column(
              children: [
              const GetwayPayment(),
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height * 0.25,
                  child: PageView.builder(

                    scrollBehavior: const MaterialScrollBehavior(),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: cardList.length,
                    onPageChanged: (index) {
                      setState(() {
                        indexSelectCard = index;
                      });
                    },
                    controller:_pageController,
                    itemBuilder: (context, index) {
                      final bool isSelectedCard = indexSelectCard == index;
                      return   AnimatedContainer(
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(milliseconds: 500),
                        transform:
                        isSelectedCard ? Matrix4.identity().scaled(1.1) : Matrix4.identity(),
                        child:isSelectedCard ? cardList[index] : Opacity(opacity: 0.5,child: Center(child: cardList[index])),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(cardList.length, (index) {
                    final bool isSelectedCard = indexSelectCard == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          indexSelectCard = index;
                        });
                        _pageController.animateTo(20, duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn,);
                        _pageController.animateToPage(index, duration: const Duration(milliseconds: 600), curve: Curves.fastOutSlowIn,);
                      },
                      child: Container(
                        width: 50,
                        height: 20,
                        decoration: BoxDecoration(
                          color: isSelectedCard
                              ? const Color(0xFF34A853)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: isSelectedCard
                                ? const Color(0xFF34A853)
                                : Colors.grey.withValues(alpha: 0.5),
                            width: 1.5,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                CreditCardForm(
                  formKey: formKey,
                  cardNumber: cardsData[indexSelectCard].cardNumber,
                  expiryDate: cardsData[indexSelectCard].expiryDate,
                  cardHolderName: cardsData[indexSelectCard].cardHolderName,
                  cvvCode: cardsData[indexSelectCard].cvvCode,
                  onCreditCardModelChange: (model) {
                    setState(() {
                      cardsData[indexSelectCard] = CardDetails(
                        cardNumber: model.cardNumber,
                        expiryDate: model.expiryDate,
                        cardHolderName: model.cardHolderName,
                        cvvCode: model.cvvCode,
                        isCvvFocused: model.isCvvFocused,
                      );
                    });
                  },
                  isHolderNameVisible: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  enableCvv: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const Spacer(),
                DefaultMaterialButton(
                  text: 'Pay',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return  ThanksYouView(name:cardDetails.cardHolderName,
                          total: widget.total,
                          numberMaterCard:cardDetails.cardNumber,
                        );
                      },));
                    }
                  },
                ),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


