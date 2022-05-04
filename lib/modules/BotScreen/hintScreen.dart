import 'package:final_project/constants/componts.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_states.dart';
import 'package:final_project/modules/BotScreen/botDesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';

class HintScreen extends StatefulWidget {
  const HintScreen({Key? key}) : super(key: key);

  @override
  State<HintScreen> createState() => _HintScreenState();
}

class _HintScreenState extends State<HintScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        listener: (context,state){

        },
        builder: (context,state){
          return  Scaffold(
            backgroundColor: Colors.black.withOpacity(.6),
            body: Stack(
              children: [
                Positioned(
                    top: 85,
                    right: 7,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child:Container(
                        margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        height: 40,
                        width: 40,
                        alignment: Alignment.topRight,
                        decoration: BoxDecoration(
                          color: mainColorDark,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                            onPressed:(){

                              navigateTo(context, const BotDesign());
                              setState(() {
                                AlertDialog alert= AlertDialog(
                                  content: Container(
                                    height: MediaQuery.of(context).size.height*.4,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child:Text(
                                            'Select Programming track that interests you',
                                            textAlign: TextAlign.center,style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold
                                          ),),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: mainColorLayout,
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                        ),
                                        const SizedBox(height: 25,),
                                        CircleAvatar(
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                (AppCubit.get(context).userModel!.image)!
                                            ),
                                            radius: 45,
                                          ),
                                          radius: 45,
                                          backgroundColor: mainColorButton,
                                        ),
                                        const SizedBox(height: 12,),
                                        Text(AppCubit.get(context).userModel!.fullName!,style: GoogleFonts.lato(
                                          color: mainColorLayout,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),),
                                        const SizedBox(height: 18,),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(5, 0,5, 0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 1,color: Colors.black),
                                                borderRadius: BorderRadius.circular(5)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(
                                                  20,
                                                  0,
                                                  20,
                                                  0
                                              ),
                                              child: DropdownButton(
                                                dropdownColor: Colors.grey[300],
                                                elevation: 0,
                                                hint: AppCubit.get(context).programmingField.isEmpty
                                                    ? const Text('Programming Track', style: TextStyle(color: Colors.black, fontSize: 16.0 , fontWeight: FontWeight.bold),)
                                                    : Text(
                                                  AppCubit.get(context).programmingField,
                                                  style: const TextStyle(color: Colors.black , fontSize: 16.0, fontWeight: FontWeight.bold),
                                                ),
                                                isExpanded: true,
                                                iconSize: 30.0,
                                                style: const TextStyle(color: Colors.black , fontSize: 16.0 , fontWeight: FontWeight.bold),
                                                items: ['Data Science',
                                                        'Web Development',
                                                        'Android Development' ,
                                                        'C++ Language',
                                                        'Flutter Development',
                                                        'Python Language' ,
                                                        'Java Language',
                                                        'Object Oriented Programming',
                                                        'Data Structure' ,
                                                        'Algorithms',
                                                        ].map(
                                                      (value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  },
                                                ).toList(),
                                                onChanged: (value) {
                                                  AppCubit.get(context).selectProgrammingField(value);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                );
                                showDialog(context: context, builder: (BuildContext context){
                                  return alert;
                                });
                              });
                            },icon: const Icon(
                          Icons.add,color: Colors.white,
                        )),
                      ),
                    )
                )
              ],
            ),
          );

        },
    );

  }
}

