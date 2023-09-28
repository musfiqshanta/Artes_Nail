import 'package:artas_nails/bindings/all_bindings.dart';
import 'package:artas_nails/screen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  AllBindings().dependencies();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Artas Nails',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
