import "package:flutter/material.dart";
import "package:taskmaster/consts/font_const.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";

import "package:taskmaster/widgets/TaskMasterFormField.dart";
import "package:taskmaster/widgets/TaskMasterNavigator.dart";
import "package:taskmaster/widgets/TaskMasterButton.dart";
import "package:taskmaster/screens/auth/pages/signup_page.dart";


class SignInPage extends StatefulWidget {

  const SignInPage({ Key ? key }) : super(key : key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final TextEditingController _emailController = TextEditingController(text : "");
  final TextEditingController _passwordController = TextEditingController(text : "");

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    return;
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar : AppBar(),

      body : Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18.w, 
          vertical: 30.h
        ),

        child: AnimationLimiter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children : AnimationConfiguration.toStaggeredList(
              duration : const Duration(milliseconds: 375),

              childAnimationBuilder : (widget) => SlideAnimation(
                verticalOffset: 40.0,

                child : FadeInAnimation(
                  duration : const Duration(milliseconds: 750),
                  child : widget 
                )
              ),

              children : _appBuilder()
            ),
          ),
        ),
      )
    );
  }

  List<Widget> _appBuilder(){
    return [
      TaskMasterFormField(
        taskMasterFormController: _emailController,
        taskMasterHintText: "Email Address",
      ),
      
      SizedBox( height : 16.h ),
      TaskMasterFormField(
        taskMasterFormController: _passwordController,
        taskMasterHintText: "Password",
      ),
  
      SizedBox( height : 40.h ),
      TaskMasterButton(
        taskMasterChild: openSans(
          "Sign Up",
          color : Colors.white
        ), 
        taskMasteraddBoxShadow: true,
        taskMasterColor: Colors.red[400],
        taskMasterOnTap: (){}
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children : [
          openSans(
            "Already have an Account? ",
            fontSize : 14.sp
          ),
  
          GestureDetector(
            onTap : () => TaskMasterNavigation.prSlideUpTransition(
              context, 
              destinationPage: const SignUpPage()
            ),
            child: openSans(
              "Sign In",
              fontSize : 14.sp,
              color : Colors.red[400]
            ),
          )
        ]
      )
    ];
  }
}