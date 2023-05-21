import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:provider/provider.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:taskmaster/consts/color_const.dart";

import "package:taskmaster/providers/auth_provider.dart";
import "package:taskmaster/screens/dashboard/widgets/appbar_widget.dart";
import "package:taskmaster/screens/dashboard/widgets/custom_tabbar_widget.dart";


class HomePage extends StatelessWidget {
  const HomePage({ Key ? key }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        backgroundColor: TaskMasterColor.coralRed,
        child : Icon(
          FeatherIcons.plus,
          color : TaskMasterColor.white
        ),
        onPressed: (){},
      ),
      
      body : SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 18.w, 
          vertical: 20.h
        ),

        child : SafeArea(
          child: AnimationLimiter(
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              
              children : AnimationConfiguration.toStaggeredList(
                childAnimationBuilder : (widget){
                  
                  return SlideAnimation(
                    duration : const Duration(milliseconds: 375),
                    horizontalOffset: 40.0,
        
                    child : FadeInAnimation(
                      duration : const Duration(milliseconds: 480),
                      child : widget
                    )
                  );
                }, 
                
                children: _appBuilder(context)
              )
            )
          ),
        )
      ),
    );
  }

  List<Widget> _appBuilder(BuildContext context){
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return [
      MyAppBarWidget(
        appBarUserName: authProvider.getUserName, 
        appBarProfile: "" // authProvider.getProfile
      ),

      SizedBox(height : 24.h),

      MyCustomTabBar(
        tabBarCurrentItem: 0,
        tabBarItem: [
          "All",
          "Personal",
          "Home",
          "School",
          "Work",
        ],
        tabBarOnTap: (){},
      ),

      SizedBox(height : 12.h),

    ];
  }
}