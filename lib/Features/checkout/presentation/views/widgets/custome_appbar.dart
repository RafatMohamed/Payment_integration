import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_assests.dart';
import '../../../../../core/utils/styles.dart';

  AppBar defaultAppBar({required String title,required BuildContext context}){
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(onPressed: () {
        Navigator.pop(context);
      },
          icon:  SvgPicture.asset(
              AppAssets.iconBack,
            width: 30,
          )
      ),
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(title,style: Styles.style25,),
    );
  }