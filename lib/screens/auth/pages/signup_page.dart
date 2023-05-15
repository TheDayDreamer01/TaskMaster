import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:taskmaster/consts/color_const.dart";
import "package:taskmaster/consts/font_const.dart";
import "package:taskmaster/screens/auth/pages/forgot_password_page.dart";
import "package:taskmaster/widgets/TaskMasterButton.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";

import "package:taskmaster/widgets/TaskMasterFormField.dart";
import "package:taskmaster/screens/auth/pages/signin_page.dart";
import "package:taskmaster/widgets/TaskMasterNavigator.dart";

class SignUpPage extends StatefulWidget {

  const SignUpPage({ Key ? key }) : super(key : key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool _isReveal = true;

  final TextEditingController _userNameController = TextEditingController(text : "");
  final TextEditingController _emailController = TextEditingController(text : "");
  final TextEditingController _passwordController = TextEditingController(text : "");

  @override
  void dispose(){
    super.dispose();
    _userNameController.dispose();
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
        "Get Started and\nOrganize Your Life",
        fontSize : 42,
        fontWeight : FontWeight.w600
      ),

      SizedBox( height : 10.h ),
      openSans(
        "Sign in to manage tasks, track progress, and\ncollaborate effortlessly. Stay productive anywhere,\nanytime.",
        fontSize : 14,
        color : TaskMasterColor.grey,
      ),

      SizedBox( height : 40.h ),
      TaskMasterFormField(
        taskMasterFormController: _userNameController,
        taskMasterHintText: "Username",
        taskMasterIsFilled: true,
        taskMasterFillColor: TaskMasterColor.silver[50],
      ),
    
      SizedBox( height : 16.h ),
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
  
      SizedBox( height : 46.h ),
      TaskMasterButton(
        taskMasterChild: openSans(
          "Sign Up",
          color : Colors.white,
          fontWeight: FontWeight.w500,
          fontSize : 18,
        ), 
        taskMasteraddBoxShadow: true,
        taskMasterColor: TaskMasterColor.coralRed,
        taskMasterOnTap: (){
          TaskMasterNavigation.pSlideUpTransition(
            context, 
            destinationPage: const ForgotPasswordPage()
          );
        }
      ),

      SizedBox( height : 20.h ),
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
              destinationPage: const SignInPage()
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

  void _revealPassword() => setState((){
    _isReveal = !_isReveal;
  });
}