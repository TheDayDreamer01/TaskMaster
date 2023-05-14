import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:taskmaster/screens/auth/auth_builder.dart";
import "package:taskmaster/screens/auth/pages/error_page.dart";
import "package:taskmaster/screens/auth/pages/loading_page.dart";
import "package:taskmaster/screens/home/home.dart";

class AuthView extends StatelessWidget {
  const AuthView({ Key ? key }) : super( key : key ); 

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future : Firebase.initializeApp(),

      builder : (context, snapshot){
        if (snapshot.connectionState == ConnectionState.done){
          return _appBuilder();
        }

        else {
          return const LoadingPage();
        }
      }
    );
  }

  Widget _appBuilder(){
    return StreamBuilder(
      stream : FirebaseAuth.instance.authStateChanges(),
      builder : (context, snapshot){

        if (snapshot.connectionState == ConnectionState.waiting){
          return const LoadingPage();
        }

        else if (snapshot.hasError){
          return const ErrorPage();
        }

        else if (snapshot.hasData){
          return const HomeView();
        }

        else {
          return const AuthViewBuilder();
        }
      }
    );
  }
}