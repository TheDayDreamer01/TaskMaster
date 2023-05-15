import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:taskmaster/consts/color_const.dart";
import "package:taskmaster/consts/font_const.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:taskmaster/screens/auth/pages/forgot_password_page.dart";

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

  bool _isReveal = true;

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

        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
        
              children : AnimationConfiguration.toStaggeredList(
                duration : const Duration(milliseconds: 375),
        
                childAnimationBuilder : (widget) => SlideAnimation(
                  verticalOffset: 40.0,
        
                  child : FadeInAnimation(
                    duration : const Duration(milliseconds: 600),
                    child : widget 
                  )
                ),
        
                children : _appBuilder()
              ),
            ),
          ),
        ),
      )
    );
  }

  List<Widget> _appBuilder(){
    return [
      robotoCondensed(
        "Welcome Back! Stay\non Top of Your Tasks",
        fontSize : 42,
        fontWeight : FontWeight.w600
      ),

      SizedBox( height : 10.h ),
      openSans(
        "Sign In now and take control. Stay organized on the\ngo with our mobile to-do app. Boost your productivity\ntoday!",
        fontSize : 14,
        color : TaskMasterColor.grey,
      ),


      SizedBox( height : 40.h ),
      TaskMasterFormField(
        taskMasterFormController: _emailController,
        taskMasterHintText: "Email Address",
        taskMasterIsFilled: true,
        taskMasterFillColor: TaskMasterColor.silver[50],
      ),
      
      SizedBox( height : 16.h ),
      TaskMasterFormField(
        taskMasterIsObsecure: _isReveal,
        taskMasterFormController: _passwordController,
        taskMasterHintText: "Password",
        taskMasterIsFilled: true,
        taskMasterFillColor: TaskMasterColor.silver[50],
        taskMasterSuffix: GestureDetector(
          onTap : _revealPassword,
          child : Icon(
            (_isReveal) ? 
              FeatherIcons.eye : 
              FeatherIcons.eyeOff,
            color : TaskMasterColor.silver[900]
          )
        ),
      ),

      SizedBox( height : 16.h ),
      Align(
        alignment: Alignment.centerRight,
        child : GestureDetector(
          onTap : (){
            TaskMasterNavigation.pSlideUpTransition(
              context, 
              destinationPage: const ForgotPasswordPage()
            );
          },
          child: openSans(
            "Forgot Password?",
            fontSize : 14,
            color : TaskMasterColor.coralRed
          ),
        )
      ),
  
      SizedBox( height : 46.h ),
      TaskMasterButton(
        taskMasterChild: openSans(
          "Sign Up",
          color : Colors.white
        ), 
        taskMasteraddBoxShadow: true,
        taskMasterColor: Colors.red[400],
        taskMasterOnTap: (){}
      ),

      SizedBox( height : 20.h ),
      Row(  
        mainAxisAlignment: MainAxisAlignment.center,
        children : [
          openSans(
            "Don't have an Account? ",
            fontSize : 14.sp
          ),
  
          GestureDetector(
            onTap : () => TaskMasterNavigation.prSlideUpTransition(
              context, 
              destinationPage: const SignUpPage()
            ),
            child: openSans(
              "Sign Up",
              fontSize : 14.sp,
              color : Colors.red[400]
            ),
          )
        ]
      )
    ];
  }

  void _revealPassword() => setState((){
    _isReveal = !_isReveal;
  });
}