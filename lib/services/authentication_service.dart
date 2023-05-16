import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";

class TaskMasterAuthentication {

  final _auth = FirebaseAuth.instance;

  Future<UserCredential> taskMasterSignIn(String userEmail, userPassword) async {
    UserCredential user = await _auth.signInWithEmailAndPassword(
      email: userEmail, 
      password: userPassword
    );
    return user;
  }

  Future<UserCredential> taskMasterSignUp(String userEmail, userPassword) async {
    UserCredential newUser = await _auth.createUserWithEmailAndPassword(
      email: userEmail, 
      password: userPassword
    );
    return newUser;
  }

  Future<UserCredential> taskMasterSignInGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken : googleAuth?.idToken,
      accessToken: googleAuth?.accessToken
    );

    final user = await _auth.signInWithCredential(credential);
    return user;
  }

  Future<void> taskMasterResetPassword(String userEmail) async {
    await _auth.sendPasswordResetEmail(
      email: userEmail
    );
    return;
  }

}