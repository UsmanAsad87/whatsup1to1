import 'dart:io';

import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:whatsup1to1/common/widgets/toasts_widgets.dart';



Future<String?> uploadImage({required File img,required String storageFolderName})async{
  FirebaseStorage _storage = FirebaseStorage.instance;
  final Uint8List list = await img.readAsBytes();

  try{
      String name = const Uuid().v1();
      Reference ref = _storage.ref().child(storageFolderName).child(name);
      UploadTask task = ref.putData(list);
      final TaskSnapshot taskSnapshot = await task.whenComplete(() {});
      final String url = await taskSnapshot.ref.getDownloadURL();
      return url;


  }on FirebaseException catch(e){
    showToast(msg: e.message ?? '');
    return null;
  }
}

Future<List<String>> uploadImages(List<XFile> images, {required String storageFolderName}) async {
  List<String> imgDownloadUrls=[];
  for(int i=0;i<images.length;i++){
    String imgUrl=await uploadXImage(images[i],storageFolderName: storageFolderName );
    imgDownloadUrls.add(imgUrl);
  }
  return imgDownloadUrls;
}

Future<String> uploadXImage(XFile images, {required String storageFolderName}) async {
  FirebaseStorage _storage = FirebaseStorage.instance;
  var name = const Uuid().v4();
  final path = _storage.ref().child(storageFolderName).child(name);
  // final path = _storage.ref().child(path);
  Uint8List imgInBytes=await images.readAsBytes();
  UploadTask uploadTask = path.putData(imgInBytes);
  TaskSnapshot snap = await uploadTask.whenComplete(() {});
  String downloadUrl = await snap.ref.getDownloadURL();
  return downloadUrl;

}