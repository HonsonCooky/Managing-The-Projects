import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthManager {
  AuthManager._privateConstructor();

  static final instance = AuthManager._privateConstructor();

  Future<void> signup(String email, String password) async {
    var cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    var user = cred.user;
    if (user == null) throw Exception("Unable to retrieve user from signup request");
    await user.sendEmailVerification();
  }

  Future<void> verify(String email, String password) async {
    var cred = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    var user = cred.user;
    if (user == null) throw Exception("Unable to retrieve user from verification request");
    await user.reload();
    if (!user.emailVerified) {
      await user.sendEmailVerification();
      throw Exception("$email has not been verified yet. Check your emails for a verification message.");
    }
  }

  Future<void> login(String email, String password) async {
    var cred = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    var user = cred.user;
    if (user == null) throw Exception("Unable to retrieve user from login request");
    if (!user.emailVerified) throw Exception("$email has not been verified yet.");
  }

  Future<void> reauthenticate(User user, {String? email, String? password}) async {
    if (GoogleSignIn().currentUser != null) {
      await user.reauthenticateWithPopup(GoogleAuthProvider());
    } else if (email != null && password != null) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    }
  }

  Future<void> passwordReset(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }


}