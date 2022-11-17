import 'package:flutter/cupertino.dart';
import 'package:managing_the_projects/user/model/user_model.dart';

class CurrentUserManager extends ChangeNotifier {
  UserModel? currentUser;
  
  void updateUser(UserModel newUser) {
    currentUser = newUser;
    notifyListeners();
  }
  
  void removeUser() {
    currentUser = null;
    notifyListeners();
  }
}