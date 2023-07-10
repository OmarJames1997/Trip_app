import 'package:flutter/material.dart';
import 'package:trip_app_cubit/constants/colors.dart';
import 'package:trip_app_cubit/presentation/components/text_components.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  final String? text;
  IconData? icon;
  bool isIcon;

  AppButton({
    this.isIcon=false,
    this.text='Hi',
    this.icon,
    super.key,
    required this.size,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color:borderColor,width: 1.0 ),
        color: backgroundColor,

      ),
      child: isIcon==false?Center(child: TextNormalComp(text: text!,color: color,)):Center(child: Icon(icon,color: color,)),
    );
  }
}
