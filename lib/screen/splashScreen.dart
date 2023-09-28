import 'package:flutter/material.dart';
import '../controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      dispose: (_) {
        print("Dispose spalash");
      },
      builder: (_) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/splash.jpg",
                      ),
                      fit: BoxFit.cover)),
            ));
      },
      init: SpalashController(),
    );
  }
}
