import 'package:flutter/cupertino.dart';
import 'package:managing_the_projects/user/services/user_model.dart';

class UserChangeManager extends ChangeNotifier {
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