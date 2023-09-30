import 'package:artas_nails/screen/dashbord/dashboard_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  final auth = FirebaseAuth.instance;
  final user = FirebaseFirestore.instance.collection('users');
  Future SignUp(
      {required String email, name, password, required int phone}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        return user.doc(auth.currentUser!.uid).set({
          'name': name,
          'email': email,
          "phone": phone,
          'uId': auth.currentUser!.uid
        }).then((value) {
          Get.snackbar("Success", "Successfully SignUp");
          Get.to(DashBoardScreen());
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.snackbar("Error", "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Error", "The account already exists for that email.");
      }
    } catch (e) {
      print(e);
    }
  }

  Future SignIn(String email, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Get.snackbar("Success", "Successfully Sign In");
        Get.to(DashBoardScreen());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'Weak Password');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'he account already exists for that email');
        print('The account already exists for that email.');
      }
    } catch (e) {
      print('fuck');
      print(e);
    }
  }
}
