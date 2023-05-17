import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";

class TaskMasterAuthentication {

  final _auth = FirebaseAuth.instance;
  final _google = GoogleSignIn();

  String get taskMasterUserName =>  _auth.currentUser!.displayName!;
  String get taskMasterEmail => _auth.currentUser!.email!;
  String get taskMasterProfile => _auth.currentUser!.photoURL!;

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

  Future<void> taskMasterSignOut() async {
    await _auth.signOut();
    await _google.signOut();
    return;
  }

}