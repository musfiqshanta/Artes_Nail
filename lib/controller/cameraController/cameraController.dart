import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:get/get.dart';
class CameraController extends GetxController{
  XFile? image;
  final ImagePicker picker = ImagePicker();

  Future getImage()async{
  image=await await picker.pickImage(source: ImageSource.camera);

  }

}