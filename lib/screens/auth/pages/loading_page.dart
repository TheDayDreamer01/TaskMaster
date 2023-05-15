import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:loading_animation_widget/loading_animation_widget.dart";
import "package:taskmaster/consts/color_const.dart";

class LoadingPage extends StatelessWidget {
  const LoadingPage({ Key ? key }) : super(key : key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body : Center(
        child : LoadingAnimationWidget.discreteCircle(
          color: TaskMasterColor.coralRed, 
          size: 50.h
        )
      )
    );
  }
}