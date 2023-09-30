import 'package:artas_nails/firebase/firebase.dart';
import 'package:artas_nails/screen/Login/login_screen.dart';
import 'package:flutter/material.dart';
import '../../component/my_textfield.dart';
import '../../component/square_tile.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  // text editing controllers
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();
  final firebaseController = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
        
                  // logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
        
                  const SizedBox(height: 50),
        
                  // welcome back, you've been missed!
                  Text(
                    'Welcome To Arts Nails',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
        
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: nameController,
                    hintText: 'Name',
                    obscureText: false,
                  ),
        
                  const SizedBox(height: 10),
                  // username textfield
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),
        
                  const SizedBox(height: 10),
        
                  // password textfield
                  MyTextField(
                    controller: phoneController,
                    hintText: 'Phone Number',
                   obscureText: false,
                  ),
                  const SizedBox(height: 10),
        
                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
        
                
                  const SizedBox(height: 10),
        
                  // forgot password?
        
                  const SizedBox(height: 25),
        
                  // sign in button
        
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(Get.width, 50,),
                      backgroundColor:Colors.black
                    ),
                      onPressed: () {
                        firebaseController.SignUp(
                            email: emailController.text,
                            name: nameController.text,
                            password: passwordController.text,
                            phone: int.parse(phoneController.text));
                      },
                      child: Text("Sign Up",style:TextStyle(fontSize: 20),)),
        
                  const SizedBox(height: 50),
        
                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
        
                  const SizedBox(height: 50),
        
                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      // google button
                      SquareTile(imagePath: 'assets/images/google.png'),
        
                      SizedBox(width: 25),
        
                      // apple button
                      SquareTile(imagePath: 'assets/images/apple.png')
                    ],
                  ),
        
                  const SizedBox(height: 50),
        
                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      TextButton(
                        onPressed: () {
                          Get.to(LoginPage());
                        },
                        child: const Text(
                          'Login Now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
