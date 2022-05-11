import 'dart:ui';

import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/container_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplaintScreen extends StatelessWidget {
  ComplaintScreen({Key? key}) : super(key: key);

  var titleController=TextEditingController();
  var describtionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: mainColorLayout,
        title: Text('Complaint Screen', style: GoogleFonts.aBeeZee(
          fontSize: 20,
          color: Colors.white,
        )),
      ),
      body: SingleChildScrollView(
        child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          color: mainColorLayout
                      ),


                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
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
                      style: GoogleFonts.lato(
                          fontSize: 22,
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
