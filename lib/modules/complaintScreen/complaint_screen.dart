import 'package:final_project/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*.1,
        title: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: mainColorLayout,
          ),
          child: Column(
            children: [
              Text('Complaint Screen',style: GoogleFonts.lato(
                 fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
              SizedBox(height: 10,),
              Text('Complaint Screen',style: GoogleFonts.lato(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),

            ],
          ),
        )
      ),
    );
  }
}
