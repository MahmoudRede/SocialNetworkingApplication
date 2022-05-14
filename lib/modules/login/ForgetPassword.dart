// import 'dart:ui';
// import 'package:final_project/modules/login/login_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';
// import '../../constants/componts.dart';
// import '../../constants/constants.dart';
//
// class ForgetPasswordScreen extends StatefulWidget {
//   const ForgetPasswordScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
// }
//
// class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
//   @override
//   Widget build(BuildContext context) {
//
//    var emailController = TextEditingController();
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Container(
//             height: MediaQuery.of(context).size.height*.9,
//             width: double.infinity,
//             child: Stack(
//               children: [
//                 Positioned(
//                   top: 0,
//                   left: 0,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .28,
//                     height: MediaQuery.of(context).size.height * .20,
//                     child: const Image(
//                       fit: BoxFit.cover,
//                       image: AssetImage('assets/images/icon 6.png'),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   right: 0,
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * .26,
//                     height: MediaQuery.of(context).size.height * .18,
//                     child: const Image(
//                       fit: BoxFit.cover,
//                       image: AssetImage('assets/images/icon 4.png'),
//                     ),
//                   ),
//                 ),
//
//                 Positioned(
//                   top: MediaQuery.of(context).size.height*.1,
//                   left: MediaQuery.of(context).size.width*.22,
//                   child: Lottie.asset('assets/images/email.json',
//                       height: 200
//                   ),
//                 ),
//                 Positioned(
//                   top: MediaQuery.of(context).size.height*.37,
//                   left: MediaQuery.of(context).size.width*.18,
//                   child: Text(
//                     'Enter Your email to reset\n your password',
//                     style: GoogleFonts.aBeeZee(
//                       fontSize: 19.0,
//                       fontWeight: FontWeight.bold,
//                       color: mainColorLayout,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30.0,
//                 ),
//                 Positioned(
//                   top: MediaQuery.of(context).size.height*.47,
//                   left: 0,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width*.9,
//                       height: 60,
//                       child: TextField(
//                         controller: emailController,
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           labelStyle: const TextStyle(
//                               fontSize: 15,
//                               color: Colors.black
//                           ),
//                           prefixIcon: const Icon(
//                             Icons.email,
//                             color: Colors.black,
//                           ),
//                           enabledBorder:  OutlineInputBorder(
//                             borderSide:  const BorderSide(width: 1,color: Colors.black),
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           border:  OutlineInputBorder(
//                             borderSide:  const BorderSide(width: 1,color: Colors.black),
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide:   const BorderSide(width: 1,color: Colors.black),
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 Positioned(
//                   top: MediaQuery.of(context).size.height*.6,
//                   left: MediaQuery.of(context).size.width*.20,
//
//                   child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       height: 60,
//                       width: 220,
//                       child: MaterialButton(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         color: mainColorButton,
//                         child: const Text(
//                           'Reset Password',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         onPressed: () {
//                           resetPassword(emailController.text).then((value) {
//                             navigateAndFinish(
//                               context,
//                               LoginScreen(),
//                             );
//                           });
//                         },
//                       )
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future resetPassword (String email) async
//   {
//     showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) => const Center(
//           child: CircularProgressIndicator(),
//         ),
//     );
//     await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
//     customToast('Password Reset Email Sent', Colors.red);
//   }
//
// }

import 'dart:ui';

import 'package:final_project/modules/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
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
        titleSpacing: 0,
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
                'Enter Your email \nto reset your password',
                style: TextStyle(
                  fontSize: 20.0,
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
                      prefixIcon: const Icon(
                        LineIcons.user,
                        color: Colors.black,
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderSide:  const BorderSide(width: 1,color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      border:  OutlineInputBorder(
                        borderSide:  const BorderSide(width: 1,color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:   const BorderSide(width: 1,color: Colors.black),
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
                  width: 220,
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