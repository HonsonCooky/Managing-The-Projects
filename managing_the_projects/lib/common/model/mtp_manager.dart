import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class MtpManager<T extends JsonSerializable> {
  String collectionPath();

  String documentPath(String uuid) => "${collectionPath()}/$uuid";

  String subPath(String uuid, String subPath) => "${documentPath(uuid)}/$subPath";

  T? fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot);

  Map<String, dynamic> toFirestore(T? value);

  DocumentReference<T?> docRef(String uuid) {
    return FirebaseFirestore.instance.doc(documentPath(uuid)).withConverter<T?>(
          fromFirestore: (snapshot, _) => fromFirestore(snapshot),
          toFirestore: (value, _) => toFirestore(value),
        );
  }

  Future<DocumentSnapshot<T?>>? get(String? uuid) {
    if (uuid == null) return null;
    return docRef(uuid).get();
  }

  Future<void> create(T value, String? imagePath);

  Future<void> update(String uuid, T value, String? imagePath);

  Future<void> delete(String uuid);
}
