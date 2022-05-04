import 'package:final_project/constants/componts.dart';
import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_states.dart';
import 'package:final_project/modules/groupsScreen/doctorGroup/doctor_screen_posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpansionItems{

  String? header;
  List<String>? titles;

  ExpansionItems({
    this.header,
    this.titles,
  });


}

class GroupDoctorScreen extends StatefulWidget {
   GroupDoctorScreen({Key? key}) : super(key: key);

  @override
  State<GroupDoctorScreen> createState() => _GroupDoctorScreenState();
}

class _GroupDoctorScreenState extends State<GroupDoctorScreen> {
  List<ExpansionItems> items=[

    ExpansionItems(
      header: 'General Department',
      titles: [
        'Grade 1',
        'Grade 2',
        'Grade 3',
        'Grade 4',
      ],
    ),

    ExpansionItems(
      header: 'Medical Department',
      titles: [
        'Grade 1',
        'Grade 2',
        'Grade 3',
        'Grade 4',
      ],
    ),

    ExpansionItems(
      header: 'Security Department',
      titles: [
        'Grade 1',
        'Grade 2',
        'Grade 3',
        'Grade 4',
      ],
    ),

    ExpansionItems(
      header: 'Network Department',
      titles: [
        'Grade 1',
        'Grade 2',
        'Grade 3',
        'Grade 4',
      ],
    ),

  ];

  String ?selectedString;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        listener:(context,state){

        } ,
        builder: (context,state){
          return SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Material(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                      ),
                      child: Image(
                        image: AssetImage('assets/images/bfcai.jpg'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    color: Colors.grey,
                    height: 1,
                  ),
                  ExpansionPanelList(
                    expansionCallback: (int index,bool isExpanded){
                      if(isExpanded==false && selectedString != items[index].header){
                        setState(() {
                          selectedString = items[index].header;
                        });
                      }
                      else
                      {
                        setState(() {
                          selectedString='';
                        });
                      }
                    },
                    children: items.map<ExpansionPanel>((ExpansionItems item) {
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context,bool isExpanded){
                          return SingleChildScrollView(
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(item.header!,style: GoogleFonts.lato(
                                      color: mainColorLayout,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16
                                  ),),
                                ],
                              ),
                            ),
                          );
                        },
                        body: Container(
                          height: 180,
                          width: 500,
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context,index){
                                return Container(
                                  child:
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      color: mainColorLayout,
                                      onPressed: (){
                                           print(items.indexOf(item));
                                           AppCubit.get(context).selectedDoctorValue(index,items.indexOf(item));
                                             print(AppCubit.get(context).selectedGrade);
                                             print(AppCubit.get(context).selectedDepartment);
                                             print(AppCubit.get(context).DoctorPosts.length);

                                               navigateTo(context, const DoctorPostsGroupScreen()).then((value) {

                                             });


                                      },
                                      child: Text(
                                        (item.titles?[index])!,style: GoogleFonts.lato(
                                          color: Colors.white,
                                          fontSize: 15
                                      ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context,index){
                                return const SizedBox(height: 5,);
                              },
                              itemCount: item.titles!.length
                          ),
                        ),
                        isExpanded: selectedString == item.header ? true:false,
                      );
                    }).toList(),

                  ),
                ],
              )
          );
        },
    );
  }
}
