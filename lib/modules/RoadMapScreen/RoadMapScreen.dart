import 'package:final_project/constants/componts.dart';
import 'package:final_project/modules/RoadMapScreen/BackEnd.dart';
import 'package:flutter/material.dart';

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

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
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
            fontSize: 20.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    ),
  );
}
