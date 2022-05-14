import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ShowComplaints extends StatelessWidget {
  const ShowComplaints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(

      listener: (context,state){

      },
      builder: (context,state){
        var cubit=AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainColorLayout,
            title: Text(
                'Complaints', style: GoogleFonts.aBeeZee(
              fontSize: 20,
              color: Colors.white,
            )
            ),
          ),
          body:  ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return  Container(
                  margin: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  height: MediaQuery.of(context).size.height*.25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: mainColorLayout,
                      borderRadius: BorderRadius.circular(12)

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Container(
                        padding: const EdgeInsets.fromLTRB(3, 3, 3, 0),
                        width: double.infinity,
                        child: Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                              child: Row(
                                children: [
                                  Text('Title :', style: GoogleFonts.aBeeZee(
                                      fontSize: 17,
                                      color: mainColorLayout,
                                      fontWeight: FontWeight.bold
                                  )),
                                  const SizedBox(width: 3,),
                                  Text('${cubit.complaints[index].title}',
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 17,
                                      color: mainColorLayout,
                                    ),

                                  ),
                                ],
                              )
                          ),
                        ),
                      ),
                      const SizedBox(height: 6,),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 5, 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 78,
                                width: 300,
                                child: Text('${cubit.complaints[index].content}',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.fade,

                                ),
                              ),
                            ],
                          )

                      ),
                      const SizedBox(height: 2,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('${(cubit.complaints[index].time)}', style: GoogleFonts.aBeeZee(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500
                          )),
                          const SizedBox(width: 7,),

                        ],

                      ),
                      const SizedBox(height: 5,),

                    ],
                  ),
                );
              },
              separatorBuilder: (context,index){
                return const SizedBox(height: 10,);
              },
              itemCount: cubit.complaints.length
          ),

        );
      },
    );
  }
}
