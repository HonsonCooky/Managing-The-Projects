import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:managing_the_projects/common/model/mtp_manager.dart';
import 'package:managing_the_projects/user/model/user_model.dart';

class UserManager extends MtpManager<UserModel> {
  UserManager._privateConstructor();

  static final instance = UserManager._privateConstructor();

  @override
  String collectionPath() => 'user';

  @override
  Future<DocumentSnapshot<UserModel?>> fromFirestore(String uuid) {
    return FirebaseFirestore.instance
        .doc(documentPath(uuid))
        .withConverter<UserModel?>(
          fromFirestore: (snapshot, _) => snapshot.data() != null ? UserModel.fromJson(snapshot.data()!) : null,
          toFirestore: (value, _) => value != null ? value.toJson() : {},
        )
        .get();
  }
}
