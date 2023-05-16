import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:taskmaster/screens/auth/pages/error_page.dart";
import "package:taskmaster/screens/auth/pages/loading_page.dart";
import "package:taskmaster/screens/dashboard/dasboard.dart";


class AuthViewBuilder extends StatelessWidget {
  final Widget currentPage;

  const AuthViewBuilder({ 
    Key ? key, 
    required this.currentPage
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
          return const DashboardView();
        }

        else {
          return currentPage;
        }
      },
    );
  }
}