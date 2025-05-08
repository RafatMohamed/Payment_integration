import 'package:checkout_payment/Features/checkout/presentation/views/widgets/bottom_shett_w.dart';
import 'package:checkout_payment/Features/checkout/presentation/views/widgets/custom_price.dart';
import 'package:checkout_payment/Features/checkout/presentation/views/widgets/custome_appbar.dart';
import 'package:checkout_payment/Features/checkout/presentation/views/widgets/getway_payment.dart';
import 'package:checkout_payment/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_assests.dart';
import '../../../../core/widgets/default_material_button.dart';

class MyCartView extends StatefulWidget {
  const MyCartView({super.key});

  @override
  State<MyCartView> createState() => _MyCartViewState();
}

class _MyCartViewState extends State<MyCartView> {
  int value = 1;
  final int shipping = 20;

  final int discount = 0;
  final int price = 500;
  @override
  Widget build(BuildContext context) {
    final int total = value * price - discount + shipping;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: defaultAppBar(title: 'My Cart', context: context),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 10),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  AppAssets.imgBasket,
                  width: size.width * 0.7,
                  height: size.height * 0.45,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: size.width * 0.25,
                  top: size.height * 0.04,
                  child: Column(
                    children: [
                      Container(
                        width: size.width * 0.55,
                        height: size.height * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFFEDEDED),
                        ),
                        padding: const EdgeInsetsDirectional.all(10),
                        child: Column(
                          children: [
                            SizedBox(
                              width: size.width * 0.5,
                              child: const Text(
                                "Kinetic Sand Dino Dig Playset",
                                style: Styles.style18,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black.withValues(
                                        alpha: 0.5,
                                      ),
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (value > 1) {
                                              value--;
                                            }
                                          });
                                        },
                                        icon: const Icon(Icons.remove),
                                      ),
                                      SizedBox(
                                        height: 33,
                                        child: VerticalDivider(
                                          thickness: 0.5,
                                          color: const Color(
                                            0xff000000,
                                          ).withValues(alpha: 0.5),
                                          width: 3,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 33,
                                        child: Center(
                                          child: Text(
                                            value.toString(),
                                            style: Styles.style18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 33,
                                        child: VerticalDivider(
                                          thickness: 0.5,
                                          color: const Color(
                                            0xff000000,
                                          ).withValues(alpha: 0.5),
                                          width: 3,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (value >= 1) {
                                              value++;
                                            }
                                          });
                                        },
                                        icon: const Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "\$${price * value}",
                                  style: Styles.style18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        AppAssets.triangle,
                        width: size.width * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.06),
            customPrice(title: 'Order Subtotal', price: '${price * value}'),
            SizedBox(height: size.height * 0.02),
            customPrice(title: 'Discount', price: '$discount'),
            SizedBox(height: size.height * 0.02),
            customPrice(title: 'Shipping', price: '$shipping'),
            SizedBox(height: size.height * 0.035),
            const Divider(
              thickness: 2,
              color: Color(0xffC7C7C7),
              endIndent: 15,
              indent: 15,
            ),
            const Spacer(),
            Row(
              children: [
                const Text("Total", style: Styles.style24),
                const Spacer(),
                Text(
                  "\$$total",
                  style: Styles.style24.copyWith(color: Colors.black87),
                ),
              ],
            ),
            const Spacer(),
            DefaultMaterialButton(
              text: 'Complete Payment',
              onPressed: () {
              // return  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentDetailsView(total: total,),));
                return showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const ShowBottomSheet(),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}

