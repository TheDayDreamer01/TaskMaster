import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "package:taskmaster/screens/auth/pages/error_page.dart";
import "package:taskmaster/screens/auth/pages/loading_page.dart";
import "package:taskmaster/screens/auth/pages/welcome_page.dart";
import "package:taskmaster/screens/dashboard/dasboard.dart";


class AuthViewBuilder extends StatelessWidget {
  
  final Widget destinationPage;
  final bool isNewUser;

  const AuthViewBuilder({ 
    Key ? key, 
    this.isNewUser = false,
    required this.destinationPage
  }) : super(key : key);

  @override
  Widget build(BuildContext context){
    return StreamBuilder<User?>(
      stream : FirebaseAuth.instance.authStateChanges(),
      builder :(context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting){
          return const LoadingPage();
        }

        else if (snapshot.hasError){
          return const ErrorPage();
        }

        else if (snapshot.hasData){
          return (isNewUser) ? 
            const WelcomePage() :
            const DashboardView();
        }

        else {
          return destinationPage;
        }
      },
    );
  }
}