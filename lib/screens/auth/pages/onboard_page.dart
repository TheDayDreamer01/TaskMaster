import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:google_fonts/google_fonts.dart";

import "package:taskmaster/consts/color_const.dart"; 
import "package:taskmaster/consts/font_const.dart";

import "package:taskmaster/providers/auth_provider.dart";
import "package:taskmaster/screens/auth/auth_builder.dart";
import "package:taskmaster/widgets/TaskMasterButton.dart";
import "package:taskmaster/widgets/TaskMasterNavigator.dart";
import "package:taskmaster/screens/auth/pages/signup_page.dart";


class OnboardPage extends StatelessWidget {
  const OnboardPage({ Key ? key }) : super(key : key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body : Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        fit: StackFit.passthrough,
        children : [
          Image.asset(
            "assets/images/Notes.jpg",
            fit : BoxFit.cover,
            height : MediaQuery.of(context).size.height,
          ),

          Container(
            decoration : BoxDecoration(
              gradient: LinearGradient(
                begin : Alignment.bottomCenter,
                end : Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(.8),
                  Colors.transparent
                ]
              )
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 30.h
            ),
            child: AnimationLimiter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children : AnimationConfiguration.toStaggeredList(
                  duration : const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 40.0,
                    child : FadeInAnimation(                       
                      duration : const Duration(milliseconds: 480),
                      child : widget 
                    )
                  ),
            
                  children: _onboardBuilder(context)
                )
              ),
            ),
          )
        ]
      )
    );
  }

  List<Widget> _onboardBuilder(BuildContext context){
    final authProvider = Provider.of<AuthProvider>(context);

    return [

      RichText(
        text : TextSpan(
          children : [
            const TextSpan( text : "Welcome to " ),
            TextSpan( 
              text : "TaskMaster\n",
              style :  TextStyle(
                color : TaskMasterColor.coralRed
              )
            ),

            const TextSpan( text : "Your Ultimate Todo App"),
          ],
          style : GoogleFonts.robotoCondensed(
            fontSize : 30,
            fontWeight: FontWeight.w600,
            color : TaskMasterColor.white
          )
        )
      ),

      SizedBox( height : 10.h),
      openSans(
        "Streamline your tasks, stay organized, and boost\nproductivity with TaskMaster. Get started now!",
        color : TaskMasterColor.lightGrey
      ),

      SizedBox(height : 40.h), 
      TaskMasterButton(
        taskMasterOnTap: (){
          
          authProvider.signInWithGoogle();
          
          TaskMasterNavigation.prSlideUpTransition(
            context, 
            destinationPage: const AuthViewBuilder(
              currentPage: OnboardPage()
            )
          );
        },
        taskMasterColor: TaskMasterColor.white,
        taskMasteraddBoxShadow: true,
        taskMasterChild: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [
            SvgPicture.asset(
              "assets/svg/Google.svg"
            ),

            SizedBox( width : 10.w ),
            openSans(
              "Continue with Google",
              fontWeight: FontWeight.w500
            )
          ]
        )
      ),

      SizedBox( height : 20.h ),
      TaskMasterButton(
        taskMasterOnTap: () =>TaskMasterNavigation.pSlideUpTransition(
          context, 
          destinationPage: const SignUpPage()
        ),
        taskMasterBorderColor: TaskMasterColor.white,
        taskMasterChild: openSans(
          "Get Started!",
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color : TaskMasterColor.white
        )
      )
    ];
  }
}