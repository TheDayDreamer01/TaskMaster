import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:taskmaster/consts/color_const.dart";
import "package:taskmaster/consts/font_const.dart";

import "package:taskmaster/providers/auth_provider.dart";
import "package:taskmaster/widgets/TaskMasterButton.dart";

class SettingsPage extends StatelessWidget {
  const SettingsPage({ Key ? key }) : super(key : key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: TaskMasterColor.silver[50],
      body : SafeArea(
        child : SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 18.w, 
            vertical: 20.h
          ),

          child : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children : AnimationConfiguration.toStaggeredList(
              childAnimationBuilder: (widget){
                return SlideAnimation(
                  duration : const Duration(milliseconds: 375),
                  
                  child : FadeInAnimation(
                    duration : const Duration(milliseconds: 480),
                    child : widget
                  )
                );
              }, 
              
              children: _appBuilder(context)
            )
          )
        )
      )
    );
  }

  List<Widget> _appBuilder(BuildContext context){
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return [

      TaskMasterButton(
        taskMasterColor: TaskMasterColor.coralRed[400],
        taskMasterOnTap: (){},
        taskMasterChild: openSans(
          "Sign Out", 
          color : Colors.white,
          fontWeight: FontWeight.w500
        ),
      )
    ];
  }
}