import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

abstract class MtpManager<T extends JsonSerializable> {
  String collectionPath();

  String documentPath(String uuid) => "${collectionPath()}/$uuid";

  String subPath(String uuid, String subPath) => "${documentPath(uuid)}/$subPath";

  Future<DocumentSnapshot<T?>> fromFirestore(String uuid);
}
