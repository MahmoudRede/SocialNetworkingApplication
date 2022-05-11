import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/constants/componts.dart';
import 'package:final_project/constants/constants.dart';
import 'package:final_project/modules/materialsScreen/materials_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../layoutes/homepage/home_bloc/app_cubit.dart';
class SpeicalScreen extends StatelessWidget {
  SpeicalScreen({Key? key}) : super(key: key);

  List  carouselImages =[

    'assets/images/slider1.json',
    'assets/images/slider2.json',
    'assets/images/slider3.json'

  ];

  List  Texts =[

    'CS',
    'IS',
    'SC',
    'AI'

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        backgroundColor: mainColorLayout,
        title: Text(
          'Select Department',
          style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white
          ),
        ),
      ),
      body:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            CarouselSlider(
              items: carouselImages.map((e) {
                return Lottie.asset(e);
              }).toList(),
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1.0,

              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 8),
              child: Text('Select Department : ',style: GoogleFonts.aBeeZee(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: mainColorLayout
              ),),
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 2,

                  childAspectRatio: 1/.7,
                  children: List.generate(4, (index) {
                    return Block_Department(Texts[index], AppCubit.get(context).colorsContainer[index],context);
                  }),
                ),
            ),
            
          ],
        ),

    );
  }
}

Widget Block_Department(String text, Color color,context){

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: (){
        AppCubit.get(context).valueSpeical = text;
        AppCubit.get(context).getDoctorMaterialTitles().then((value) {
          navigateTo(context, const MaterialsScreen()).then((value) {
          });
        });      },
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)

        ),
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,style: GoogleFonts.aBeeZee(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: mainColorLayout
              ),
              ),

            ],
          ),
        ),
      ),
    ),
  );


}