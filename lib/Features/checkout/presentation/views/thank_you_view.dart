import 'dart:convert';

import 'package:checkout_payment/Features/checkout/presentation/views/widgets/custom_detailes.dart';
import 'package:checkout_payment/Features/checkout/presentation/views/widgets/custome_appbar.dart';
import 'package:checkout_payment/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../core/utils/app_assests.dart';

class ThanksYouView extends StatelessWidget {
  const ThanksYouView({super.key, required this.total,  required this.name, required this.numberMaterCard});
  final int total ;
  final String name;
  final String numberMaterCard ;

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.now();
    Map<String, dynamic> transactions = {
      'total': total,
      'name': name,
      'numberMaterCard': numberMaterCard,
      'date': '${dateTime.day}/${dateTime.month}/${dateTime.year}',
      'time': '${dateTime.hour}:${dateTime.minute}',
    };
    final qrCode = jsonEncode(transactions);

    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          appBar: defaultAppBar(title: '', context: context),
          body: Padding(
            padding: const EdgeInsetsDirectional.only(start: 20,end: 20,top: 10),
            child:   Container(
              padding: const EdgeInsetsDirectional.all(22),
              width: size.width,
              height: size.height * 0.8,
              decoration: ShapeDecoration(
                color: const Color(0xFFEDEDED),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Thank You',style: Styles.style25,),
                  SizedBox(height: size.height * 0.01,),
                  Text('Your transaction was successful',style: Styles.style20,),
                  SizedBox(height: size.height * 0.05,),
                  customDetails(title: 'Date', details: '${dateTime.day}/${dateTime.month}/${dateTime.year}'),
                  SizedBox(height: size.height * 0.025,),
                  customDetails(title: 'Time', details: '${dateTime.hour}:${dateTime.minute}'),
                  SizedBox(height: size.height * 0.025,),
                  customDetails(title: 'to', details: name),
                  SizedBox(height: size.height * 0.04,),
                  const Divider(
                    thickness: 2,
                    color: Color(0xffC7C7C7),
                  ),
                  SizedBox(height: size.height * 0.035,),
                  Row(
                    children: [
                      const Text('Total',style: Styles.style25,),
                      const Spacer(),
                      Text('\$$total',style: Styles.style25,),
                  ]),
                  SizedBox(height: size.height * 0.04,),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      SvgPicture.asset(
                        AppAssets.imgCardMaster,
                        fit: BoxFit.fill,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Master Card',style: Styles.style18,),
                          Text('**** **** **** ${numberMaterCard.substring(numberMaterCard.length - 4)}',style: Styles.style18,),
                        ],
                      ),
                    ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.04,),
                  SizedBox(
                    height: 2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              width: 2,
                              height: 5,
                              decoration: BoxDecoration(
                                color: const Color(0xffC7C7C7),
                                border: Border.all(
                                  color: Colors.black.withValues(
                                    alpha: 0.5,
                                  ),
                                  width: 0.5,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                          ],
                        );
                      },
                        itemCount: 50,
                    ),
                  ),
                  SizedBox(height: size.height * 0.08,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 103,
                        height: 65,
                        child: Center(
                          child: QrImageView(
                              data: qrCode,
                              version: QrVersions.auto,
                            backgroundColor: Colors.white,
                              // eyeStyle and dataModuleStyle
                            eyeStyle: const QrEyeStyle(
                              eyeShape: QrEyeShape.square,
                              color: Colors.black,
                            ),
                            dataModuleStyle: const QrDataModuleStyle(
                              dataModuleShape: QrDataModuleShape.square,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 103,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color(0xFF34A853),
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "PAID",
                            textAlign: TextAlign.center,
                            style: Styles.style24.copyWith(
                              color: const Color(0xFF34A853),
                            )
                          ),
                        ),
                      ),
                  ]),
                ],

              )
            ),

          ),
        ),
        Positioned(
          top: 50,
          left: size.width/2-50,
          child: Container(
            width: 100,
            height: 100,
            decoration: const ShapeDecoration(
              color:  Color(0xFFEDEDED),
              shape: OvalBorder(),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: size.width/2-40,
          child: Container(
            width: 80,
            height: 80,
            decoration: const ShapeDecoration(
              color: Color(0xFF34A853),
              shape: OvalBorder(),
            ),
            child:const Center(
              child: Icon(Icons.check,size: 50,color: Colors.white,),
            ) ,
          ),
        ),

        Positioned(
          left: -9,
          top: size.height/2+160,
          child: Container(
            width: 50,
            height: 50,
            decoration: const ShapeDecoration(
    color: Colors.white,
              shape: OvalBorder(),
            ),
          ),
        ),
        Positioned(
          top: size.height/2+160,
          right: -9,
          child: Container(
            width: 50,
            height: 50,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(),
            ),
            ) ,
        ),
      ]
    );
  }
}
