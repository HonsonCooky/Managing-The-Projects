import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managing_the_projects/common/model/mtp_manager.dart';
import 'package:managing_the_projects/user/model/user_model.dart';

class UserManager extends MtpManager<UserModel> {
  UserManager._privateConstructor();

  static final instance = UserManager._privateConstructor();

  @override
  String collectionPath() => 'user';

  @override
  UserModel? fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) => UserModel.fromJson(snapshot.data()! );

  @override
  Map<String, dynamic> toFirestore(UserModel? value) => value!.toJson();

  @override
  Future<void> create(UserModel value, String? imagePath) async {
    await docRef(value.uuid).set(value);
  }

  @override
  Future<void> delete(String uuid) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> update(String uuid, UserModel value, String? imagePath) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
