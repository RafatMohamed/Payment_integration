import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

Widget customPrice({required String title,required String price}){
  return Row(
    children: [
       Text(title,style: Styles.style18,),
      const Spacer(),
      Text("\$$price",style: Styles.style18.copyWith(
          color: Colors.black45
      ),),
    ],
  );
}