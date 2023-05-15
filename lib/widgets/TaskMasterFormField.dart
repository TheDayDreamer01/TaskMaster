import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:google_fonts/google_fonts.dart";


class TaskMasterFormField extends StatelessWidget {
  
  final TextEditingController taskMasterFormController;
  final String taskMasterHintText;
  final bool taskMasterEnableBorders;
  final int taskMasterMaxLines;
  final double taskMasterBorderRadius;

  final FocusNode ? taskMasterFocusNode;
  final TextInputType ? taskMasterTextInputType;

  final String? Function(String?) ? taskMasterOnValidate;

  const TaskMasterFormField({ 
    Key ? key,
    required this.taskMasterFormController,
    this.taskMasterHintText = "",
    this.taskMasterMaxLines = 1,
    this.taskMasterEnableBorders = true,
    this.taskMasterTextInputType,
    this.taskMasterFocusNode,
    this.taskMasterBorderRadius = 10,

    this.taskMasterOnValidate

  }) : super(key : key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height : 60.h,

      child : TextFormField(
        controller : taskMasterFormController,  
        validator: taskMasterOnValidate,

        maxLines: taskMasterMaxLines,
        keyboardType: taskMasterTextInputType ,
        focusNode: taskMasterFocusNode,

        style: GoogleFonts.openSans(
          fontSize : 16.sp,
          color : Colors.grey[900]
        ),

        decoration : InputDecoration(
          hintText : taskMasterHintText,
          
          hintStyle: GoogleFonts.openSans(
            fontSize : 16.sp
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              taskMasterBorderRadius,
            ),
          ),
        )
      )
    );
  }
}