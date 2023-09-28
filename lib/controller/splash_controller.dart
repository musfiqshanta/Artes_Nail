import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

import '../screen/introduction_page.dart';

class SpalashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 4), () {
      Get.offAll(OnBoardingScreen());
    });
  }
}
