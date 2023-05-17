import "dart:async";

import "package:flutter/material.dart";
import "package:taskmaster/screens/auth/auth_builder.dart";
import "package:taskmaster/screens/auth/pages/onboard_page.dart";
import "package:taskmaster/widgets/TaskMasterNavigator.dart";


class WelcomePage extends StatefulWidget {
  const WelcomePage({ Key ? key }) : super(key : key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  void initState(){
    super.initState();

    Timer.periodic(const Duration(seconds : 4), (timer) { 
      TaskMasterNavigation.prSlideUpTransition(
        context, 
        destinationPage: const AuthViewBuilder(
          destinationPage: OnboardPage()
        )
      );
    });
  }
  
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body : Center(
        child : Text("Welcome")
      )
    );
  }
}