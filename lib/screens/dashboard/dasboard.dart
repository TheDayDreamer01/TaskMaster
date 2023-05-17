import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";

import "package:taskmaster/providers/auth_provider.dart";
import "package:taskmaster/screens/dashboard/widgets/appbar_widget.dart";
import "package:taskmaster/widgets/TaskMasterFormField.dart";


class DashboardView extends StatefulWidget {
  const DashboardView({ Key ? key }) : super(key : key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {

  final TextEditingController _itemController = TextEditingController(text : "");

  @override
  void dispose(){
    super.dispose();
    _itemController.dispose();
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      SizedBox(height : 20.h),
    ];
  }
}