import 'package:flutter/material.dart';
import 'package:trip_app_cubit/constants/colors.dart';
import 'package:trip_app_cubit/constants/strings.dart';
import 'package:trip_app_cubit/presentation/components/text_components.dart';

class ResponseiveButton extends StatelessWidget {

  bool? isResponse;
   double? width;
   final String? text;
   Color? color;
   ResponseiveButton({super.key,this.width=30,this.isResponse=false,this.text,this.color});

  @override
  Widget build(BuildContext context) {
    return  Flexible(
      child: Container(
        width: isResponse==true?double.maxFinite:width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(purble),
        ),
        child: Row(
          mainAxisAlignment:isResponse== true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children: [
            isResponse== true?Container(
              margin: EdgeInsets.only(left: 20),
                child: TextNormalComp(text: 'Book Trip Now',color: Colors.white,)):Container(),
            Container(
              margin: EdgeInsets.only(right: 15),
                child: Image.asset('assets/images/arrow_icon.png',width: 50,))
          ],
        ),

      ),
    );
  }
}
