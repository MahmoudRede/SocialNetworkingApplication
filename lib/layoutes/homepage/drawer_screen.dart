import 'package:final_project/constants/componts.dart';
import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_states.dart';
import 'package:final_project/modules/AboutScreen/AboutScreen.dart';
import 'package:final_project/modules/BotScreen/BotScreen.dart';
import 'package:final_project/modules/BotScreen/botContainer.dart';
import 'package:final_project/modules/BotScreen/botDesign.dart';
import 'package:final_project/modules/analysisScreen/analysis_screen.dart';
import 'package:final_project/modules/complaintScreen/complaint_screen.dart';
import 'package:final_project/modules/messageScreen/message_screen.dart';
import 'package:final_project/modules/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class ItemModel {
  String? text;
  IconData? icon;
  Function? function;

  ItemModel({
    required this.text,
    required this.icon,
    required this.function,
  });
}


class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List drawerItems = [
      ItemModel(
          text: 'Profile',
          icon: Icons.person,
          function: () {
            navigateTo(context, const ProfileScreen());
          }),

      ItemModel(
          text: 'Analysis',
          icon:Icons.analytics,
          function: () {
            AppCubit.get(context).postAnalyis(studentid: 180268, year: 4, dep: 'CS');
            navigateTo(context, AnalysisScreen());
          }),

      ItemModel(
          text: 'About',
          icon: Icons.info,
          function: () {
           navigateTo(context, const AboutScreen());
          }),

      ItemModel(
          text: 'Call us ',
          icon: Icons.smart_toy_outlined,
          function: () {
            navigateTo(context, const BotContainer());
          }),

      ItemModel(
          text: 'Chats',
          icon:Icons.chat,
          function: () {
            AppCubit.get(context).getMaterialTitles();
            navigateTo(context, const MessageScreen());
          }),

      ItemModel(
          text: 'Settings and Privacy',
          icon: Icons.settings,
          function: () {
            print('Settings and Privacy');
          }),

      ItemModel(
          text: 'Log out',
          icon: Icons.logout,
          function: () {
            print('Log out');
          }),
    ];

    return Builder(
      builder: (context){
        return BlocConsumer<AppCubit,AppState>(
          listener: (context,state){},
          builder:(context,state) {
            var cubit = AppCubit.get(context);
            return Container(
              color: mainColorLayout,
              height: double.infinity,
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 34,
                              backgroundColor: mainColorLayout,
                              child: InkWell(
                                onTap: (){
                                  AppCubit.get(context).doSmallScreen();
                                },
                                child: const CircleAvatar(
                                  radius: 32,
                                  backgroundImage: AssetImage('assets/images/Logo .jpg'),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    'BFCAI Community',
                                    style: GoogleFonts.aBeeZee(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 80,),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: ListView.separated(
                            itemBuilder: (context,index)=> drawerBlock(drawerItems[index]),
                            separatorBuilder: (context,index){
                              return const SizedBox(height: 30,);
                            },
                            itemCount: drawerItems.length
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*.12,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(17, 15, 17, 0),
                        child: InkWell(
                          onTap: (){
                            navigateTo(context, ComplaintScreen());
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.lightbulb_outline,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text('Help Center',style: GoogleFonts.lato(
                                  fontSize: 15,
                                  color: Colors.white,
                              ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },

        );
      },
    );
  }
}

Widget drawerBlock(ItemModel model){

  return InkWell(
    onTap: (){
      model.function!();
    },
    child: Container(
      padding: const EdgeInsets.fromLTRB(17, 0, 17, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          Icon(
            model.icon,
            color: Colors.white,
          ),
          const SizedBox(width: 15,),
          Text(
            '${model.text}',
            style: GoogleFonts.lato(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );

}