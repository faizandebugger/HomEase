import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

FirebaseStorage storage = FirebaseStorage.instance;
XFile? _photo;

final ImagePicker _picker = ImagePicker();
String imageUrl = "";
String Name = "";
Future UploadImageToFirebase() async {
  XFile? file = await _picker.pickImage(source: ImageSource.gallery);
  if (file == null) return;
  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
  Reference referenceRoot = FirebaseStorage.instance.ref();
  Reference referenceDirImages = referenceRoot.child('carpenters');
  Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
  var urlRef = referenceRoot.child('carpenters').child(uniqueFileName);

  try {
    await referenceImageToUpload.putFile(File(file!.path));
    imageUrl = await referenceImageToUpload.getDownloadURL().toString();
    // print(imageUrl);
    var imgUrl = await urlRef.getDownloadURL();
    imageUrl = imgUrl;
  } catch (err) {
    print(err);
  }
}
