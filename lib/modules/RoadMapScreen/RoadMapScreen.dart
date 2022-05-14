import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/constants/componts.dart';
import 'package:final_project/modules/RoadMapScreen/BackEnd.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'Android.dart';
import 'Flutter.dart';
import 'FrontEnd.dart';

class RoadMapScreen extends StatelessWidget {
  const RoadMapScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List <String> listTitles = [
      'Android RoadMap ',
      'Flutter RoadMap ',
      'Front-End RoadMap ',
      'Back-End RoadMap ',
    ];

    List  carouselImages =[

      'assets/images/road2.json',
      'assets/images/road1.json',
      'assets/images/road3.json'

    ];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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

          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18,0, 0, 10),
            child: Text('Road Maps :',style: GoogleFonts.mada(
              color:Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context , index) => listViewItem(listTitles[index], index , context),
                separatorBuilder: (context , index) => const SizedBox (
                  height: 10.0,
                ),
                itemCount: listTitles.length,
            ),
          ),
        ],
      ),
    );
  }
}


Widget listViewItem (String title , int index , context){
  return InkWell(
    onTap: (){
      switch (index)
      {
        case 0 :
          navigateTo(context, const AndroidScreen());
          break;
        case 1 :
          navigateTo(context, const FlutterScreen());
          break;
        case 2 :
          navigateTo(context, const FrontEndScreen());
          break;
        case 3 :
          navigateTo(context, const BackEndScreen());
          break;
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 60.0,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(11, 24, 82, .9),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    ),
  );
}
