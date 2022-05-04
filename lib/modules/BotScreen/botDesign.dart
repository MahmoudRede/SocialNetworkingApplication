import 'package:final_project/constants/componts.dart';
import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'BotScreen.dart';

class BotDesign extends StatelessWidget {
  const BotDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   iconTheme: IconThemeData(
      //     color: mainColorLayout
      //   ),
      //   centerTitle: true,
      //   title:Text('Call Us',
      //     style: GoogleFonts.lato(
      //     fontSize: 22,
      //     color: mainColorLayout,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   ),
      //   leading: IconButton(
      //     onPressed: (){
      //
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: mainColorLayout,
      //     ),
      //   ),
      // ),
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * .28,
                height: MediaQuery.of(context).size.height * .20,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/icon 6.png'),
                ),
              ),
            ),
            Positioned(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                      SizedBox(height: MediaQuery.of(context).size.height*.19,),
                      Padding(
                       padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
                       child: Text('Hello!',style: GoogleFonts.aBeeZee(
                         fontSize: 24,
                         color: mainColorLayout,
                         fontWeight: FontWeight.bold
                       ),),
                     ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 5, 0, 5),
                        child: Text('I\'m Elise',style: GoogleFonts.aBeeZee(
                          fontSize: 24,
                          color: mainColorLayout,
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 5, 0, 10),
                        child: Text('How Can i help you ?',style: GoogleFonts.aBeeZee(
                          fontSize: 24,
                          color: mainColorLayout,
                        ),),
                      ),
                      const SizedBox(height: 50,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(110, 0, 0, 0),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          ),
                          color: mainColorButton,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 30
                          ),
                          child: Text(
                            'Let\'s Call',style: GoogleFonts.lato(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                            onPressed: (){
                              AppCubit.get(context).messagesBot=[];
                              AppCubit.get(context).messagesBotRespond=[];
                              print(AppCubit.get(context).programmingField);
                              navigateTo(context, BotScreen());
                        }

                        ),
                      ),
                      const SizedBox(height: 10,),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 50),
                          alignment: Alignment.centerRight,
                          child: Lottie.asset('assets/images/bot.json'),height: 250,width: 250,)

                        ) ,
                        const SizedBox(height: 40,)


              ],
            )
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * .26,
                height: MediaQuery.of(context).size.height * .18,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/icon 4.png'),
                ),
              ),
            ),
          ],
        ),
        ),

    );
  }
}
