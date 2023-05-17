import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:taskmaster/providers/auth_provider.dart";

class DashboardView extends StatelessWidget {
  const DashboardView({ Key ? key }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);
    
    return Scaffold(
      appBar: AppBar(),
      body : Center(
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [
            Text("${FirebaseAuth.instance.currentUser!.displayName}"),
            Text("${FirebaseAuth.instance.currentUser!.email}"),
            ElevatedButton(
              onPressed: authProvider.signOut,
              child: Text("Sign out"))
          ]
        )
      )
    );
  }
}