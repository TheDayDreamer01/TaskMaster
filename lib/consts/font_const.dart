import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:google_fonts/google_fonts.dart";
import "package:taskmaster/consts/color_const.dart";


Text robotoCondensed(String text, {
  Color ? color,
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.normal
}) => Text(
  text,
  style : GoogleFonts.robotoCondensed(
    color : color ?? TaskMasterColor.silver[900],
    fontSize : fontSize.sp,
    fontWeight : fontWeight,
  )
);

Text openSans(String text, {
  Color ? color, 
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.normal
}) => Text(
  text,
  style : GoogleFonts.openSans(
    color : color ?? TaskMasterColor.silver[900],
    fontSize : fontSize.sp,
    fontWeight : fontWeight,
  )
);