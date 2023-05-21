import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:taskmaster/consts/color_const.dart";
import "package:taskmaster/consts/font_const.dart";

class MyCustomTabBar extends StatelessWidget {
  final int tabBarCurrentItem;
  final List<String> tabBarItem;
  final void Function() tabBarOnTap;

  const MyCustomTabBar({ 
    Key ? key,
    required this.tabBarCurrentItem,
    required this.tabBarItem,
    required this.tabBarOnTap,
  }) : super( key : key );

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child : Row(
        children : [
          for (int i=0; i<tabBarItem.length; i++) ... [
            GestureDetector(
              onTap : tabBarOnTap,
              child: Container(
                margin: EdgeInsets.only(
                  right : 10.w,
                ),
            
                padding: EdgeInsets.symmetric(
                  horizontal : 24.w,
                  vertical: 6.h
                ),
            
                decoration: BoxDecoration(
                  color : (i == tabBarCurrentItem) ? 
                    TaskMasterColor.coralRed[400] :
                    TaskMasterColor.silver[50],
                  borderRadius: BorderRadius.circular(8.r)
                ),
            
                child: openSans(
                  tabBarItem[i],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color : (i == tabBarCurrentItem) ? 
                    TaskMasterColor.white : 
                    TaskMasterColor.silver[900] 
                ),
              ),
            )
          ]
        ]
      )
    );
  }
}