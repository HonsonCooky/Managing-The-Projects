import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthManager {
  AuthManager._privateConstructor();

  static final instance = AuthManager._privateConstructor();
  static final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  Future<void> signup(String email, String password) async {
    var cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    var user = cred.user;
    if (user == null) throw Exception("Unable to retrieve user from signup request");
    await user.sendEmailVerification();
  }

  Future<void> verify() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception("Unable to retrieve user from verification request");
    await user.reload();
    if (!user.emailVerified) {
      await user.sendEmailVerification();
      throw Exception("${user.email} has not been verified yet. Check your emails for a verification message.");
    }
  }

  Future<void> login(String email, String password) async {
    var cred = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    var user = cred.user;
    if (user == null) throw Exception("Unable to retrieve user from login request");
    if (!user.emailVerified) throw Exception("$email has not been verified yet.");
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> reauthenticate({String? password}) async {
    if (GoogleSignIn().currentUser != null) {
      await FirebaseAuth.instance.currentUser!.reauthenticateWithPopup(GoogleAuthProvider());
    } else if (password != null) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: FirebaseAuth.instance.currentUser!.email!,
        password: password,
      );
    } else {
      throw Exception('Unable to reauthenticate without current password');
    }
  }

  Future<void> passwordReset() async {
    if (GoogleSignIn().currentUser != null) {
      throw Exception("Unable to reset password, as you're signed in with your google account");
    }
    await FirebaseAuth.instance.sendPasswordResetEmail(email: FirebaseAuth.instance.currentUser!.email!);
  }

  Future<void> logout() async {
    if (_googleSignIn.currentUser != null) await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }

  Future<void>? delete() => FirebaseAuth.instance.currentUser?.delete();
}
