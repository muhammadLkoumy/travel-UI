import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

import '../misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String? text;
  Color? textColor;

  ResponsiveButton({
    Key? key,
    this.width = 120,
    this.isResponsive,
    this.text,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 60,
        width: isResponsive == true ? double.infinity : width,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true ?Container(
                padding: const EdgeInsets.only(left: 20),
                child: AppText(
                  txt: text!,
                  color: textColor,
                  weight: FontWeight.bold,
                )) : const SizedBox(),
            Image.asset('assets/images/button-one.png'),
          ],
        ),
      ),
    );
  }
}
