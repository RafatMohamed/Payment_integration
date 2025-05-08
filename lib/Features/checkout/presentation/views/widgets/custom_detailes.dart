import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

Widget customDetails({required String title,required String details}){
  return  Row(
    children: [
      Text(title,style: Styles.style18,),
      const Spacer(),
      Text(details,style: Styles.style18.copyWith(fontWeight: FontWeight.w600),),
    ],
  );
}