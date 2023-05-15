import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:flutter_svg/flutter_svg.dart";

import "package:taskmaster/consts/color_const.dart";
import "package:taskmaster/consts/font_const.dart";
import "package:taskmaster/widgets/TaskMasterButton.dart";
import "package:taskmaster/widgets/TaskMasterFormField.dart";

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({ Key ? key }) : super(key : key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final TextEditingController _emailController = TextEditingController(text : "");

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    return;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title : robotoCondensed(
          "Forgot Password?",
          fontWeight: FontWeight.w500
        )
      ),
      
      body : Padding(
        padding : EdgeInsets.symmetric(
          horizontal: 18.w,
          vertical: 30.h
        ),

        child : SingleChildScrollView(
          child : AnimationLimiter(
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children : AnimationConfiguration.toStaggeredList(
                duration : const Duration(milliseconds: 375),
                childAnimationBuilder : (widget){

                  return SlideAnimation(
                    verticalOffset: 40.0,

                    child : FadeInAnimation(
                      duration : const Duration(milliseconds: 600),
                      child : widget
                    )
                  );
                }, 

                children: _appBuilder()
              )
            )
          )
        )
      )
    );
  }

  List<Widget> _appBuilder(){
    return [

      SvgPicture.asset(
        "assets/svg/ForgotPassword.svg",
        height : 300.h,
        
      ),
      
      robotoCondensed(
        "Reset Your Password",
        fontSize : 42,
        fontWeight : FontWeight.w600
      ),

      SizedBox( height : 10.h ),
      openSans(
        "Regain access and effortlessly manage your tasks.\nFollow simple steps to restore your login credentials.\nRegain control now!",
        fontSize : 14,
        color : TaskMasterColor.grey,
      ),

      SizedBox(height : 28.h ),
      TaskMasterFormField(
        taskMasterFormController: _emailController,
        taskMasterHintText: "Email Address",
        taskMasterIsFilled: true,
        taskMasterFillColor: TaskMasterColor.silver[50],
      ),
  
      SizedBox( height : 16.h ),
      TaskMasterButton(
        taskMasterChild: openSans(
          "Sign Up",
          color : Colors.white
        ), 
        taskMasteraddBoxShadow: true,
        taskMasterColor: Colors.red[400],
        taskMasterOnTap: (){}
      ),
    ];
  }
}