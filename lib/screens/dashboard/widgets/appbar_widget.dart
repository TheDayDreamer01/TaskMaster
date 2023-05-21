import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:taskmaster/consts/color_const.dart";
import "package:taskmaster/consts/font_const.dart";


class MyAppBarWidget extends StatelessWidget {

  final String appBarUserName;
  final String appBarProfile;

  const MyAppBarWidget({ 
    Key ? key,
    required this.appBarUserName,
    required this.appBarProfile,
  }) : super(key : key);  

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children : [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children : [
            openSans(
              "Hello,",
              fontSize : 20,
              color: TaskMasterColor.silver[200],
              fontWeight: FontWeight.w500
            ),
            openSans(
              appBarUserName,
              fontSize : 30,
              color: TaskMasterColor.coralRed[400],
              fontWeight: FontWeight.w600

            )
          ]
        ),

        Container(
          width : 54.h,
          height : 54.h,
          decoration: BoxDecoration(
            color : TaskMasterColor.coralRed[300],
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: [
              BoxShadow(
                color : TaskMasterColor.coralRed[300]!.withOpacity(.2),
                blurRadius: 14,
              )
            ]
          ),

          // child : NetworkImage(
          //   appBarProfile
          // )
        )
      ]
    );
  }
}