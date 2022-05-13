import 'dart:ui';

import 'package:final_project/modules/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../constants/componts.dart';
import '../../constants/constants.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainColorLayout,
        title: const Text(
          'Reset Password ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40.0,
              ),
              Lottie.asset('assets/images/email.json',
                  height: 200
              ),
              Text(
                'Receive an email to reset your password',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: mainColorLayout,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: mainColorLayout,
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderSide:  BorderSide(width: 1,color: mainColorLayout),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      border:  OutlineInputBorder(
                        borderSide:  BorderSide(width: 1,color: mainColorLayout),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:   BorderSide(width: 1,color: mainColorLayout),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  height: 60,
                  width: double.infinity,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: mainColorButton,
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      resetPassword(emailController.text).then((value) {
                        navigateAndFinish(
                          context,
                          LoginScreen(),
                        );
                      });
                    },
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future resetPassword (String email) async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
    );
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
    customToast('Password Reset Email Sent', Colors.red);
  }

}
