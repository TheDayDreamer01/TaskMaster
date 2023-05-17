import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:google_fonts/google_fonts.dart";


class TaskMasterFormField extends StatelessWidget {
  
  final TextEditingController taskMasterFormController;
  final FocusNode ? taskMasterFocusNode;
  final InputBorder ? taskMasterInputOutlineBorder;
  final String taskMasterHintText;
  final bool taskMasterIsFilled;
  final bool taskMasterIsObsecure;
  final int taskMasterMaxLines;

  final Color ? taskMasterFillColor;
  final TextInputType ? taskMasterTextInputType;

  final String? Function(String?) ? taskMasterOnValidate;
  final Widget ? taskMasterSuffix;

  const TaskMasterFormField({ 
    Key ? key,
    required this.taskMasterFormController,
    this.taskMasterInputOutlineBorder, 
    this.taskMasterFocusNode,
    this.taskMasterHintText = "",
    this.taskMasterMaxLines = 1,
    this.taskMasterIsFilled = false,
    this.taskMasterIsObsecure = false,
    this.taskMasterTextInputType,
    this.taskMasterFillColor,

    this.taskMasterOnValidate,
    this.taskMasterSuffix

  }) : super(key : key);

  @override
  Widget build(BuildContext context){
    return TextFormField(
      focusNode: taskMasterFocusNode,
      obscureText: taskMasterIsObsecure,
      controller : taskMasterFormController,  
      validator: taskMasterOnValidate,

      maxLines: taskMasterMaxLines,
      keyboardType: taskMasterTextInputType ,

      style: GoogleFonts.openSans(
        fontSize : 16.sp,
        color : Colors.grey[900]
      ),

      decoration : InputDecoration(
        filled: taskMasterIsFilled,

        alignLabelWithHint: true,
        hintText : taskMasterHintText,
        fillColor: taskMasterFillColor,

        suffixIcon: taskMasterSuffix,
      
        hintStyle: GoogleFonts.openSans(
          fontSize : 16.sp
        ),

        border: taskMasterInputOutlineBorder

      )
    );
  }
}