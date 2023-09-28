import 'package:get/get.dart';

class LoginController extends GetxController {
  var showPassword = false.obs;
  checkpassword() {
    showPassword.value = !showPassword.value;
    update();
  }
}
