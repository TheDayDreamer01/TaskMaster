import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      
      body :  SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 18.w, 
          vertical: 30.h
        ),
  
        child : AnimationLimiter(
          child: Form(
            key : _formKey,
            child: Column(
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
                 
                children: _appBuilder()
              ),
            ),
          ),
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

      SizedBox(height : 40.h ),
      TaskMasterFormField(
        taskMasterFormController: _emailController,
        taskMasterHintText: "Email Address",
        taskMasterIsFilled: true,
        taskMasterFillColor: TaskMasterColor.silver[50],
        taskMasterOnValidate: (value){
          String pattern = r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";
          final regExp = RegExp(pattern);

          if (value == null || value.isEmpty){
            return "Please Enter an Email Address";
          } else if (!regExp.hasMatch(value)){
            return "Please Enter a valid Email Address";
          } else {
            return null;
          }
        },
      ),
  
      SizedBox( height : 26.h ),
      TaskMasterButton(
        taskMasterChild: openSans(
          "Submit",
          color : Colors.white,
          fontWeight: FontWeight.w500,
        ), 
        taskMasteraddBoxShadow: true,
        taskMasterColor: Colors.red[400],
        taskMasterOnTap: (){
          if (_formKey.currentState!.validate()){

            _formKey.currentState!.dispose();
            Navigator.of(context).pop();
          }
        }
      ),

    ];
  }
}