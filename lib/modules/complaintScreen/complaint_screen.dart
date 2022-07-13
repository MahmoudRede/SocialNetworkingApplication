import 'dart:ui';
import 'package:final_project/constants/componts.dart';
import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/container_screen.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
import 'package:final_project/modules/complaintScreen/show_complaint.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ComplaintScreen extends StatelessWidget {
  ComplaintScreen({Key? key}) : super(key: key);


  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                showModalBottomSheet(context: context, builder: (_){
                  return Container(
                    height: MediaQuery.of(context).size.height*.09,
                    alignment: Alignment.centerLeft,
                    color: mainColorLayout,
                    child: TextButton(
                      child: const Text('Show Complaints',style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                        textAlign: TextAlign.start,
                      ),
                      onPressed: (){
                        AppCubit.get(context).getComplaint();
                        navigateTo(context, const ShowComplaints());
                      },
                    ),
                  );
                });
              },
              icon: const Icon(
                  Icons.more_vert_rounded
              )
          )
        ],
        elevation: 2,
        titleSpacing: 0,
        backgroundColor: mainColorLayout,
        title: Text('Complaint Screen', style: GoogleFonts.aBeeZee(
          fontSize: 20,
          color: Colors.white,
        )),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 6,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,

                ),
                margin: const EdgeInsets.fromLTRB(12, 7, 12, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Icon(
                              Icons.star,
                              size: 18.0,
                              color: mainColorLayout,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: Text(
                              'Help Center , a Space that can you add your complaints or report for something'
                            ' you saw it have to handle, or behavior doesn\'t like it, and you can add notes'
                            ' to improve your community.',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: mainColorLayout
                              ),
                              maxLines: 4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 2,),
                  ],
                ),
              ),
              const SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0,0, 0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Icon(
                        Icons.star,
                        size: 18.0,
                        color: mainColorLayout,
                      ),
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Add Complaint :',
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            color: mainColorLayout,
                            fontWeight: FontWeight.bold
                          )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: GoogleFonts.lato(
                        fontSize: 22,
                        color: Colors.grey
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color: mainColorLayout),
                        borderRadius: BorderRadius.circular(7)
                    ),

                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color: mainColorLayout),
                        borderRadius: BorderRadius.circular(7)
                    ),
                  ),
                  controller: titleController,
                  style: GoogleFonts.lato(
                      fontSize: 19,
                      color: mainColorLayout
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: GoogleFonts.lato(
                        fontSize: 22,
                        color: Colors.grey
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color: mainColorLayout),
                        borderRadius: BorderRadius.circular(7)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color: mainColorLayout),
                        borderRadius: BorderRadius.circular(7)
                    ),
                  ),

                  maxLines: 10,
                  controller: descriptionController,
                  style: GoogleFonts.lato(
                      fontSize: 17,
                      color: mainColorLayout
                  ),


                ),
              ),
              const SizedBox(height: 25,),
              Container(
                height: 60,
                width: 120,
                child: MaterialButton(
                  elevation: 2,
                  color: mainColorLayout,
                  padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed: (){
                    AppCubit.get(context).uploadComplaint(title: titleController.text,content: descriptionController.text,time: DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()));
                    customToast("Complaint sent", Colors.green);
                    titleController.text = "";
                    descriptionController.text = "";
                  },
                  child: const Text('Add',style: TextStyle(
                      color: Colors.white,
                      fontSize: 17
                  ),),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
