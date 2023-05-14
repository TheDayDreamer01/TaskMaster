import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";


class TaskMasterButton extends StatelessWidget {
  
  final Widget ? taskMasterChild;
  final Color ? taskMasterColor;
  final Color ? taskMasterBorderColor;
  final double taskMasterRadius;
  final bool taskMasteraddBoxShadow;
  final void Function() ? taskMasterOnTap;  
  
  const TaskMasterButton({ 
    Key ? key, 
    this.taskMasterRadius = 100,
    this.taskMasterColor = Colors.transparent,    
    this.taskMasterBorderColor = Colors.transparent,   
    this.taskMasteraddBoxShadow = false, 
    required this.taskMasterChild,
    required this.taskMasterOnTap, 
  }) : super( key : key );

  @override
  Widget build(BuildContext context){
    return SizedBox( 
      height : 60.h,
      child : GestureDetector(
        onTap : taskMasterOnTap,
        child : Container(
          decoration : BoxDecoration(
            color : taskMasterColor,
            border : Border.all(
              color : taskMasterBorderColor!,
              width : 1.0
            ),

            borderRadius: BorderRadius.circular(
              taskMasterRadius
            ) ,

            boxShadow: [
              if (taskMasteraddBoxShadow) ... [
                BoxShadow(
                  color : Colors.black.withOpacity(.2),
                  blurRadius: 14,
                  offset: const Offset(0,2),
                )
              ]
            ]
          ),
          child: Center(
            child: taskMasterChild
          )
        )
      )
    );
  }
}