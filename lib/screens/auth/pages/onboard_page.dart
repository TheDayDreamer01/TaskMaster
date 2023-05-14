import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart"; 

import "package:taskmaster/consts/font_const.dart";
import "package:taskmaster/widgets/TaskMasterButton.dart";


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
                  duration : const Duration(milliseconds: 400),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 40.0,
                    child : FadeInAnimation(                       
                      duration : const Duration(milliseconds: 800),
                      child : widget 
                    )
                  ),
            
                  children: _onboardBuilder()
                )
              ),
            ),
          )
        ]
      )
    );
  }

  List<Widget> _onboardBuilder(){
    return [
      robotoCondensed(
        "Welcome to TaskMaster:\nYour Ultimate Todo App",
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color : Colors.white
      ),

      SizedBox( height : 10.h),
      openSans(
        "Streamline your tasks, stay organized, and boost\nproductivity with TaskMaster. Get started now!",
        color : Colors.grey[400],
        fontSize : 16
      ),

      SizedBox(height : 40.h), 
      TaskMasterButton(
        taskMasterOnTap: (){
        },
        taskMasterColor: Colors.white,
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
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color : Colors.grey[900]
            )
          ]
        )
      ),

      SizedBox( height : 16.h ),
      TaskMasterButton(
        taskMasterOnTap: (){

        },
        taskMasterBorderColor: Colors.white,
        taskMasterChild: openSans(
          "Get Started!",
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color : Colors.white
        )
      )
    ];
  }
}