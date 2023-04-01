import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";


class IconButtonWidget extends StatelessWidget {

  final String iconButtonText;
  final Color iconButtonColor;
  final void Function() iconButtonOnTap;

  const IconButtonWidget({ 
    super.key,
    required this.iconButtonText,
    required this.iconButtonColor,
    required this.iconButtonOnTap
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap : iconButtonOnTap,
      child : Container(
        decoration: BoxDecoration(
          color : iconButtonColor,
        ),
        child : Stack(
          alignment: Alignment.center,
          children : [
            

            Text(
              iconButtonText
            )
          ]
        )
      )
    );
  }
}