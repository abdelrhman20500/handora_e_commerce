import 'package:flutter/material.dart';
import '../../../../../Core/utilis/app_color.dart';

class CustomTextButton extends StatelessWidget {
   const CustomTextButton({super.key, required this.text, this.onTab,this.color
  });

  final String text;
  final void Function()? onTab;
   final Color? color; // Optional color parameter

   @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTab,
      child: Text(text, style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold,  color: color ?? AppColors.kPrimaryColor,),),
    );
  }
}
