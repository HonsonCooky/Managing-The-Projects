import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:managing_the_projects/user/model/user_manager.dart';
import 'package:managing_the_projects/user/model/user_model.dart';

class CurrentUserManager extends ChangeNotifier {
  CurrentUserManager._privateConstructor();

  static final CurrentUserManager instance = CurrentUserManager._privateConstructor();

  User? currentUser;
  UserModel? cachedUserModel;

  Future<void> firebaseAuthListener(User? user) async {
    currentUser = user;
    cachedUserModel =
        user != null ? await UserManager.instance.fromFirestore(user.uid).then((value) => value.data()) : null;
    notifyListeners();
  }
}
