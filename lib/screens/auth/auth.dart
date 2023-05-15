import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";

import "package:taskmaster/screens/auth/pages/loading_page.dart";
import "package:taskmaster/screens/auth/pages/onboard_page.dart";

class AuthView extends StatelessWidget {
  const AuthView({ Key ? key }) : super( key : key ); 

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future : Firebase.initializeApp(),

      builder : (context, snapshot){
        if (snapshot.connectionState == ConnectionState.done){
          return const OnboardPage();
        }

        else {
          return const LoadingPage();
        }
      }
    );
  }
}