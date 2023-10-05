import 'package:artas_nails/firebase/firebase.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImagePick extends GetxController {
  var images = Uint8List(0);
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final firebaseController=Get.put(FirebaseController());
  pickNailLooks(String nameMenu) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      images = await image.readAsBytes();
      await firebaseController.nailLooks(nameMenu,images);
      print(images);
    } 
  }
}
