import "package:flutter/material.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:taskmaster/services/authentication_service.dart";

class AuthProvider with ChangeNotifier {
  final TaskMasterAuthentication _authService = TaskMasterAuthentication();

  String get getEmail => _authService.taskMasterEmail;
  String get getUserName => _authService.taskMasterUserName;
  String get getProfile => _authService.taskMasterProfile;

  Future<UserCredential> signIn(String userEmail, String userPassword) async {
    try {
      UserCredential user = await _authService.taskMasterSignIn(userEmail, userPassword);
      notifyListeners();
      return user;
    } catch (e) {
      // Handle any errors
      print("Error signing in: $e");
      rethrow;
    }
  }

  Future<UserCredential> signUp(String userName, String userEmail, String userPassword) async {
    try {
      UserCredential newUser = await _authService.taskMasterSignUp(userEmail, userPassword);
      await newUser.user?.updateDisplayName(userName);
      notifyListeners();
      return newUser;
    } catch (e) {
      // Handle any errors
      print("Error signing up: $e");
      rethrow;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      UserCredential user = await _authService.taskMasterSignInGoogle();
      notifyListeners();
      return user;
    } catch (e) {
      // Handle any errors
      print("Error signing in with Google: $e");
      rethrow;
    }
  }

  Future<void> resetPassword(String userEmail) async {
    try {
      await _authService.taskMasterResetPassword(userEmail);
      notifyListeners();
    } catch (e) {
      // Handle any errors
      print("Error resetting password: $e");
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.taskMasterSignOut();
      notifyListeners();
    } catch (e){
      
      print("Error in Signing out: $e");
      rethrow;
    }
  }
}
