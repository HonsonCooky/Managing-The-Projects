import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

class MtpImageManager {
  MtpImageManager._privateConstructor();

  static final instance = MtpImageManager._privateConstructor();

  static final _storageRef = FirebaseStorage.instance.ref();

  Uri? _toUri(String path) {
    try {
      var uri = Uri.parse(path);
      if (uri.host.isNotEmpty) {
        return uri;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<File> _downloadImage(Uri uri, String fileName) async {
    Directory dir = await getApplicationDocumentsDirectory();
    var file = File("${dir.path}/$fileName");
    var response = await get(uri);
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }

  Future<File> _localImage(String path, String fileName) async {
    var curFile = File(path);
    var pathSplit = path.split('/');
    if (pathSplit.elementAt(pathSplit.length - 1) == fileName) return curFile;

    Directory dir = await getApplicationDocumentsDirectory();
    var newFile = await curFile.copy('${dir.path}/$fileName');
    await curFile.delete(recursive: true);
    return newFile;
  }

  Future<File> getImageFromRef(String path, String fileName) async {
    var toUri = _toUri(path);
    if (toUri != null) return _downloadImage(toUri, fileName);
    return _localImage(path, fileName);
  }

  Future<void> uploadImage(File image, String filePath, String fileName) async {
    var childLoc = '$filePath/$fileName.png';
    await _storageRef.child(childLoc).putFile(image);
  }
}
