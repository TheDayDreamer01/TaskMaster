import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:taskmaster/providers/auth_provider.dart";

import "package:taskmaster/screens/auth/auth_builder.dart";
import "package:taskmaster/screens/auth/pages/onboard_page.dart";
import "package:taskmaster/screens/auth/widgets/appbar_widget.dart";
import "package:taskmaster/screens/auth/pages/signin_page.dart";

import "package:taskmaster/consts/color_const.dart";
import "package:taskmaster/consts/font_const.dart";

import "package:taskmaster/widgets/TaskMasterButton.dart";
import "package:taskmaster/widgets/TaskMasterFormField.dart";
import "package:taskmaster/widgets/TaskMasterNavigator.dart";

class SignUpPage extends StatefulWidget {

  const SignUpPage({ Key ? key }) : super(key : key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  bool _isReveal = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      appBar : PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child : MyAppBarWidget(
          appBarBackButton: () => TaskMasterNavigation.prSlideUpTransition(
            context, 
            destinationPage: const AuthViewBuilder(
              currentPage: OnboardPage(),
            )
          )
        )
      ),

      body : SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 18.w, 
          vertical: 20.h
        ),
        
        child: AnimationLimiter(
          child: Form(
            key : _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
          
              children : AnimationConfiguration.toStaggeredList(
                duration : const Duration(milliseconds: 375),
                
                childAnimationBuilder : (widget) => SlideAnimation(
                  verticalOffset: 40.0,
                
                  child : FadeInAnimation(
                    duration : const Duration(milliseconds: 480),
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
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
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
        taskMasterOnValidate: (value){
          if (value == null || value.isEmpty){
            return "Please Enter a Username";
          } else if (value.length < 3 ) {
            return "Username must be at least 3 Characters Long";
          } else {
            return null;
          }
        },
      ),

      SizedBox( height : 20.h ),
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
      
      SizedBox( height : 20.h ),
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
        taskMasterOnValidate: (value){
          if (value == null || value.isEmpty){
            return "Please Enter a Password";
          } else if (value.length < 8){
            return "Password must be 8 Characters Long";
          } else {
            return null;
          }
        },
      ),
  
      SizedBox( height : 40.h ),
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
          if (_formKey.currentState!.validate()){
            authProvider.signUp(
              _userNameController.text.trim(),
              _emailController.text.trim(), 
              _passwordController.text.trim());
            
            _formKey.currentState!.dispose();
          }
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
              destinationPage: const AuthViewBuilder(
                currentPage: SignInPage(),
              )
            ),
            child: openSans(
              "Sign In",
              fontSize : 14.sp,
              color : TaskMasterColor.coralRed[400]
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