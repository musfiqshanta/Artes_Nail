import 'package:artas_nails/controller/login_controller.dart';
import 'package:artas_nails/controller/onBoarding_controller.dart';
import 'package:artas_nails/controller/splash_controller.dart';
import 'package:get/get.dart';

import '../controller/cameraController/cameraController.dart';
class AllBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SpalashController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => CameraController());
  }

}