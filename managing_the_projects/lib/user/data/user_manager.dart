import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:managing_the_projects/common/model/mtp_manager.dart';
import 'package:managing_the_projects/common/service/mtp_image_manager.dart';
import 'package:managing_the_projects/user/model/user_model.dart';

class UserManager extends MtpManager<UserModel> {
  UserManager._privateConstructor();

  static final instance = UserManager._privateConstructor();

  @override
  String collectionPath() => 'user';

  @override
  UserModel? fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) => UserModel.fromJson(snapshot.data()!);

  @override
  Map<String, dynamic> toFirestore(UserModel? value) => value!.toJson();

  Future<void> _profilePictureUpload(String imagePath, String uuid) async {
    var image = await MtpImageManager.instance.getImageFromRef(imagePath, uuid);
    var uploadPath = "${collectionPath()}/$uuid";
    var uploadName = "ProfilePicture";
    await MtpImageManager.instance.uploadImage(image, uploadPath, uploadName);
  }

  @override
  Future<void> create(UserModel value, String? imagePath) async {
    await docRef(value.uuid).set(value);

    // Handle Photo upload
    if (imagePath == null) return;
    await _profilePictureUpload(imagePath, value.uuid);
  }

  @override
  Future<void> delete(String uuid) async {
    await docRef(uuid).delete();
  }

  @override
  Future<void> update(String uuid, UserModel value, String? imagePath) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
