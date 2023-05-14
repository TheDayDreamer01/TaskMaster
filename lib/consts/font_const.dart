import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:google_fonts/google_fonts.dart";


Text robotoCondensed(String text, {
  Color ? color,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.normal
}) => Text(
  text,
  style : GoogleFonts.robotoCondensed(
    color : color,
    fontSize : fontSize.sp,
    fontWeight : fontWeight,
  )
);

Text openSans(String text, {
  Color ? color, 
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.normal
}) => Text(
  text,
  style : GoogleFonts.openSans(
    color : color,
    fontSize : fontSize.sp,
    fontWeight : fontWeight,
  )
);