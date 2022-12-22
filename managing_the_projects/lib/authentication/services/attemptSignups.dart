import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managing_the_projects/authentication/data/auth_manager.dart';
import 'package:managing_the_projects/user/data/user_manager.dart';
import 'package:managing_the_projects/user/model/user_model.dart';
import 'package:managing_the_projects/user/services/current_user.dart';

Future<void> attemptSignup({
  XFile? profileImage,
  required String email,
  required String name,
  required String password,
  required String password2,
}) async {
  var errorText = StringBuffer();
  if (email.isEmpty) errorText.writeln("- Missing Email");
  if (name.isEmpty) errorText.writeln("- Missing Name");
  if (password.isEmpty) errorText.writeln("- Missing Password");
  if (password2.isEmpty) errorText.writeln("- Missing Password Confirmation");
  if (password != password2) errorText.writeln("- Password Mismatch");
  if (errorText.isNotEmpty) throw Exception(errorText);

  UserModel? userModel;
  try {
    await AuthManager.instance.signup(email, password);
    var curUser = CurrentUserManager.instance.currentUser!;
    userModel = UserModel(uuid: curUser.uid, name: name);
    await UserManager.instance.create(userModel, profileImage?.path);
  } catch (e) {
    if (kDebugMode) print(e);
    await AuthManager.instance.delete()?.catchError((e) {});
    if (userModel != null) await UserManager.instance.delete(userModel.uuid).catchError((e) {});
    rethrow;
  }
}

Future<void> attemptGoogleSignup() async {
  UserModel? userModel;
  try {
    await AuthManager.instance.signInWithGoogle();
    var curUser = CurrentUserManager.instance.currentUser!;
    userModel = UserModel(uuid: curUser.uid, name: curUser.displayName ?? curUser.email!.split('@')[0]);
    await UserManager.instance.create(userModel, curUser.photoURL);
  } catch (e) {
    if (kDebugMode) print(e);
    if ("$e".contains("At least one of ID token and access token is required")) return;
    if (userModel != null) await UserManager.instance.delete(userModel.uuid).catchError((e) {});
    await AuthManager.instance.delete()?.catchError((e) {});
    rethrow;
  }
}
