import 'package:final_project/constants/componts.dart';
import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/container_screen.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AnalysisScreen extends StatelessWidget {
  AnalysisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var indicatorLength = MediaQuery.of(context).size.width*0.58;

    return BlocConsumer<AppCubit,AppState>(
        listener: (context,state){

        },
        builder: (context,state){
          var cubit=AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  navigateTo(context, const ContainerScreen());
                },
                icon:  Icon(
                  Icons.arrow_back_ios,
                  color: mainColorLayout,
                  size: 22.0,
                ),
              ),
              title:  Text(
                'Student Analysis',
                style: TextStyle(
                  color: mainColorLayout,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage((cubit.userModel!.image)!),
                      radius: 55.0,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.02,
                    ),
                    Text(
                      (cubit.userModel!.fullName)!,
                      style: GoogleFonts.lato(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: mainColorLayout,
                      ),
                    ),
                    const SizedBox(height: 7,),
                    Text(
                      (cubit.userModel!.bio)!,
                      style: GoogleFonts.lato(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.025,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 10.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  if( cubit.GPA! >= 3.5 && cubit.GPA! <= 4)
                                    CircularPercentIndicator(
                                    radius: 45.0,
                                    lineWidth: 4.0,
                                    percent: 0.90,
                                      center:  Text(
                                        '${cubit.GPA!}',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    progressColor: Colors.red,
                                  ),
                                  if( cubit.GPA! >= 3.0 && cubit.GPA! <= 3.5)
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.75,
                                      center:  Text(
                                        '${cubit.GPA!}',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.red,
                                    ),
                                  if( cubit.GPA! >= 2.5 && cubit.GPA! <= 3.0)
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.65,
                                      center:  Text(
                                        '${cubit.GPA!}',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.red,
                                    ),
                                  if( cubit.GPA! >= 2.0 && cubit.GPA! <= 2.5)
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.50,
                                      center:  Text(
                                        '${cubit.GPA!}',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.red,
                                    ),
                                  if( cubit.GPA! >= 1.5 && cubit.GPA! <= 2.0)
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.40,
                                      center:  Text(
                                        '${cubit.GPA!}',
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.red,
                                    ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.05,
                                  ),

                                  if(cubit.Subject1! =='A' || cubit.Subject1! =='A+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.95,
                                      center:  const Text(
                                        '95%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.green,
                                    ),
                                  if(cubit.Subject1! =='A-' || cubit.Subject1! =='B+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.85,
                                      center:  const Text(
                                        '85%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.green,
                                    ),
                                  if(cubit.Subject1! =='B' || cubit.Subject1! =='B-')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.70,
                                      center:  const Text(
                                        '70%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.green,
                                    ),
                                  if(cubit.Subject1! =='C+' || cubit.Subject1! =='C')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.65,
                                      center:  const Text(
                                        '65%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.green,
                                    ),
                                  if(cubit.Subject1! =='C-' || cubit.Subject1! =='D+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.60,
                                      center:  const Text(
                                        '60%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.green,
                                    ),
                                  if(cubit.Subject1! =='D-' || cubit.Subject1! =='D')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.50,
                                      center:  const Text(
                                        '50%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.green,
                                    ),
                                    SizedBox(
                                    width: MediaQuery.of(context).size.width*0.05,
                                  ),

                                  if(cubit.Subject2! =='A' || cubit.Subject2! =='A+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.95,
                                      center:  const Text(
                                        '95%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.lightBlue,
                                    ),
                                  if(cubit.Subject2! =='A-' || cubit.Subject2! =='B+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.85,
                                      center:  const Text(
                                        '85%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.lightBlue,
                                    ),
                                  if(cubit.Subject2! =='B' || cubit.Subject2! =='B-')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.70,
                                      center:  const Text(
                                        '70%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.lightBlue,
                                    ),
                                  if(cubit.Subject2! =='C+' || cubit.Subject2! =='C')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.65,
                                      center:  const Text(
                                        '65%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.lightBlue,
                                    ),
                                  if(cubit.Subject2! =='C-' || cubit.Subject2! =='D+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.60,
                                      center:  const Text(
                                        '60%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.lightBlue,
                                    ),
                                  if(cubit.Subject2! =='D-' || cubit.Subject2! =='D')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.50,
                                      center:  const Text(
                                        '50%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.lightBlue,
                                    ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.05,
                                  ),

                                  if(cubit.Subject3! =='A' || cubit.Subject3! =='A+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.95,
                                      center:  const Text(
                                        '95%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.pinkAccent,
                                    ),
                                  if(cubit.Subject3! =='A-' || cubit.Subject3! =='B+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.85,
                                      center:  const Text(
                                        '85%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.pinkAccent,
                                    ),
                                  if(cubit.Subject3! =='B' || cubit.Subject3! =='B-')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.70,
                                      center:  const Text(
                                        '70%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.pinkAccent,
                                    ),
                                  if(cubit.Subject3! =='C+' || cubit.Subject3! =='C')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.65,
                                      center:  const Text(
                                        '65%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.pinkAccent,
                                    ),
                                  if(cubit.Subject3! =='C-' || cubit.Subject3! =='D+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.60,
                                      center:  const Text(
                                        '60%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.pinkAccent,
                                    ),
                                  if(cubit.Subject3! =='D-' || cubit.Subject3! =='D')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.50,
                                      center:  const Text(
                                        '50%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.pinkAccent,
                                    ),

                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.05,
                                  ),
                                  if(cubit.Subject4! =='A' || cubit.Subject4! =='A+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.95,
                                      center:  const Text(
                                        '95%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.amber,
                                    ),
                                  if(cubit.Subject4! =='A-' || cubit.Subject4! =='B+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.85,
                                      center:  const Text(
                                        '85%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.amber,
                                    ),
                                  if(cubit.Subject4! =='B' || cubit.Subject4! =='B-')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.70,
                                      center:  const Text(
                                        '70%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.amber,
                                    ),
                                  if(cubit.Subject4! =='C+' || cubit.Subject4! =='C')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.65,
                                      center:  const Text(
                                        '65%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.amber,
                                    ),
                                  if(cubit.Subject4! =='C-' || cubit.Subject4! =='D+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.60,
                                      center:  const Text(
                                        '60%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.amber,
                                    ),
                                  if(cubit.Subject4! =='D-' || cubit.Subject4! =='D')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.50,
                                      center:  const Text(
                                        '50%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.amber,
                                    ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.05,
                                  ),

                                  if(cubit.Subject5! =='A' || cubit.Subject5! =='A+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.95,
                                      center:  const Text(
                                        '95%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.brown,
                                    ),
                                  if(cubit.Subject5! =='A-' || cubit.Subject5! =='B+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.85,
                                      center:  const Text(
                                        '85%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.brown,
                                    ),
                                  if(cubit.Subject5! =='B' || cubit.Subject5! =='B-')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.70,
                                      center:  const Text(
                                        '70%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.brown,
                                    ),
                                  if(cubit.Subject5! =='C+' || cubit.Subject5! =='C')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.65,
                                      center:  const Text(
                                        '65%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.brown,
                                    ),
                                  if(cubit.Subject5! =='C-' || cubit.Subject5! =='D+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.60,
                                      center:  const Text(
                                        '60%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.brown,
                                    ),
                                  if(cubit.Subject5! =='D-' || cubit.Subject5! =='D')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.50,
                                      center:  const Text(
                                        '50%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.brown,
                                    ),

                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.05,
                                  ),
                                  if(cubit.Subject6! =='A' || cubit.Subject6! =='A+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.95,
                                      center:  const Text(
                                        '95%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.teal,
                                    ),
                                  if(cubit.Subject6! =='A-' || cubit.Subject6! =='B+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.85,
                                      center:  const Text(
                                        '85%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.teal,
                                    ),
                                  if(cubit.Subject6! =='B' || cubit.Subject6! =='B-')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.70,
                                      center:  const Text(
                                        '70%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.teal,
                                    ),
                                  if(cubit.Subject6! =='C+' || cubit.Subject6! =='C')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.65,
                                      center:  const Text(
                                        '65%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.teal,
                                    ),
                                  if(cubit.Subject6! =='C-' || cubit.Subject6! =='D+')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.60,
                                      center:  const Text(
                                        '60%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.teal,
                                    ),
                                  if(cubit.Subject6! =='D-' || cubit.Subject6! =='D')
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.50,
                                      center:  const Text(
                                        '50%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.teal,
                                    ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.05,
                                  ),

                                  if( cubit.GPA! >= 3.5 && cubit.GPA! <= 4)
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.90,
                                      center:  const Text(
                                        '90%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.indigo,
                                    ),
                                  if( cubit.GPA! >= 3.0 && cubit.GPA! <= 3.5)
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.75,
                                      center:  const Text(
                                        '75%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.indigo,
                                    ),
                                  if( cubit.GPA! >= 2.5 && cubit.GPA! <= 3.0)
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.65,
                                      center:  const Text(
                                        '65%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.indigo,
                                    ),
                                  if( cubit.GPA! >= 2.0 && cubit.GPA! <= 2.5)
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.50,
                                      center:  const Text(
                                        '50%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.indigo,
                                    ),
                                  if( cubit.GPA! >= 1.5 && cubit.GPA! <= 2.0)
                                    CircularPercentIndicator(
                                      radius: 45.0,
                                      lineWidth: 4.0,
                                      percent: 0.40,
                                      center:  const Text(
                                        '40%',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      progressColor: Colors.indigo,
                                    ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.04,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 5.0,
                                backgroundColor: Colors.black,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.02,
                              ),
                              const Expanded(
                                child: Text(
                                  'GPA',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.01,
                              ),
                              if( cubit.GPA! >= 3.5 && cubit.GPA! <= 4)
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.90,
                                  center:  Text(
                                    '${cubit.GPA!}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.red,
                                ),
                              if( cubit.GPA! >= 3.0 && cubit.GPA! <= 3.5)
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.75,
                                  center: Text(
                                    '${cubit.GPA!}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.red,
                                ),
                              if( cubit.GPA! >= 2.5 && cubit.GPA! <= 3.0)
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.65,
                                  center: Text(
                                    '${cubit.GPA!}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.red,
                                ),
                              if( cubit.GPA! >= 2.0 && cubit.GPA! <= 2.5)
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.50,
                                  center: Text(
                                    '${cubit.GPA!}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.red,
                                ),
                              if( cubit.GPA! >= 1.5 && cubit.GPA! <= 2.0)
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.40,
                                  center: Text(
                                    '${cubit.GPA!}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.red,
                                ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.03,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 5.0,
                                backgroundColor: Colors.black,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.02,
                              ),
                               Expanded(
                                child: Text(
                                  cubit.subject1Titles!,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.01,
                              ),
                              if(cubit.Subject1! =='A' || cubit.Subject1! =='A+')
                              LinearPercentIndicator(
                                width: indicatorLength,
                                animation: true,
                                lineHeight: 16.0,
                                animationDuration: 2000,
                                percent: 0.95,
                                center: const Text(
                                  '95.0%',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    color: Colors.white,
                                  ),
                                ),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Colors.green,
                              ),
                              if(cubit.Subject1! =='A-' || cubit.Subject1! =='B+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.85,
                                  center: const Text(
                                    '85.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.green,
                                ),
                              if(cubit.Subject1! =='B' || cubit.Subject1! =='B-')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.70,
                                  center: const Text(
                                    '70.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.green,
                                ),
                              if(cubit.Subject1! =='C+' || cubit.Subject1! =='C')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.65,
                                  center: const Text(
                                    '65.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.green,
                                ),
                              if(cubit.Subject1! =='C-' || cubit.Subject1! =='D+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.60,
                                  center: const Text(
                                    '60.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.green,
                                ),
                              if(cubit.Subject1! =='D-' || cubit.Subject1! =='D')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.50,
                                  center: const Text(
                                    '50.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.green,
                                ),
                            ],

                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.03,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 5.0,
                                backgroundColor: Colors.black,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.02,
                              ),
                               Expanded(
                                child: Text(
                                 cubit.subject2Titles!,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.01,
                              ),
                              if(cubit.Subject2! =='A' || cubit.Subject2! =='A+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.95,
                                  center: const Text(
                                    '95.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.lightBlue,
                                ),
                              if(cubit.Subject2! =='A-' || cubit.Subject2! =='B+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.85,
                                  center: const Text(
                                    '85.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.lightBlue,
                                ),
                              if(cubit.Subject2! =='B' || cubit.Subject2! =='B-')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.70,
                                  center: const Text(
                                    '70.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.lightBlue,
                                ),
                              if(cubit.Subject2! =='C+' || cubit.Subject2! =='C')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.65,
                                  center: const Text(
                                    '65.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.lightBlue,
                                ),
                              if(cubit.Subject2! =='C-' || cubit.Subject2! =='D+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.60,
                                  center: const Text(
                                    '60.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.lightBlue,
                                ),
                              if(cubit.Subject2! =='D-' || cubit.Subject2! =='D')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.50,
                                  center: const Text(
                                    '50.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.lightBlue,
                                ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.03,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 5.0,
                                backgroundColor: Colors.black,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.02,
                              ),
                               Expanded(
                                child: Text(
                                  cubit.subject3Titles!,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.01,
                              ),
                              if(cubit.Subject3! =='A' || cubit.Subject3! =='A+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.95,
                                  center: const Text(
                                    '95.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.pinkAccent,
                                ),
                              if(cubit.Subject3! =='A-' || cubit.Subject3! =='B+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.85,
                                  center: const Text(
                                    '85.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.pinkAccent,
                                ),
                              if(cubit.Subject3! =='B' || cubit.Subject3! =='B-')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.70,
                                  center: const Text(
                                    '70.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.pinkAccent,
                                ),
                              if(cubit.Subject3! =='C+' || cubit.Subject3! =='C')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.65,
                                  center: const Text(
                                    '65.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.pinkAccent,
                                ),
                              if(cubit.Subject3! =='C-' || cubit.Subject3! =='D+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.60,
                                  center: const Text(
                                    '60.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.pinkAccent,
                                ),
                              if(cubit.Subject3! =='D-' || cubit.Subject3! =='D')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.50,
                                  center: const Text(
                                    '50.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.pinkAccent,
                                ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.03,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 5.0,
                                backgroundColor: Colors.black,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.02,
                              ),
                              Expanded(
                                child: Text(
                                  cubit.subject4Titles!,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.01,
                              ),
                              if(cubit.Subject4! =='A' || cubit.Subject4! =='A+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.95,
                                  center: const Text(
                                    '95.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.amber,
                                ),
                              if(cubit.Subject4! =='A-' || cubit.Subject4! =='B+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.85,
                                  center: const Text(
                                    '85.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.amber,
                                ),
                              if(cubit.Subject4! =='B' || cubit.Subject4! =='B-')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.70,
                                  center: const Text(
                                    '70.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.amber,
                                ),
                              if(cubit.Subject4! =='C+' || cubit.Subject4! =='C')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.65,
                                  center: const Text(
                                    '65.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.amber,
                                ),
                              if(cubit.Subject4! =='C-' || cubit.Subject4! =='D+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.60,
                                  center: const Text(
                                    '60.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.amber,
                                ),
                              if(cubit.Subject4! =='D-' || cubit.Subject4! =='D')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.50,
                                  center: const Text(
                                    '50.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.amber,
                                ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.03,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 5.0,
                                backgroundColor: Colors.black,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.02,
                              ),
                              Expanded(
                                child: Text(
                                  cubit.subject5Titles!,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.01,
                              ),
                              if(cubit.Subject5! =='A' || cubit.Subject5! =='A+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.95,
                                  center: const Text(
                                    '95.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.brown,
                                ),
                              if(cubit.Subject5! =='A-' || cubit.Subject5! =='B+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.85,
                                  center: const Text(
                                    '85.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.brown,
                                ),
                              if(cubit.Subject5! =='B' || cubit.Subject5! =='B-')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.70,
                                  center: const Text(
                                    '70.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.brown,
                                ),
                              if(cubit.Subject5! =='C+' || cubit.Subject5! =='C')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.65,
                                  center: const Text(
                                    '65.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.brown,
                                ),
                              if(cubit.Subject5! =='C-' || cubit.Subject5! =='D+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.60,
                                  center: const Text(
                                    '60.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.brown,
                                ),
                              if(cubit.Subject5! =='D-' || cubit.Subject5! =='D')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.50,
                                  center: const Text(
                                    '50.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.brown,
                                ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.03,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 5.0,
                                backgroundColor: Colors.black,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.02,
                              ),
                              Expanded(
                                child: Text(
                                  cubit.subject6Titles!,
                                  style: const TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.01,
                              ),
                              if(cubit.Subject6! =='A+' || cubit.Subject6! =='A')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.95,
                                  center: const Text(
                                    '95.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.teal,
                                ),
                              if(cubit.Subject6! =='A-' || cubit.Subject6! =='B+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.85,
                                  center: const Text(
                                    '85.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.teal,
                                ),
                              if(cubit.Subject6! =='B' || cubit.Subject6! =='B-')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.70,
                                  center: const Text(
                                    '70.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.teal,
                                ),
                              if(cubit.Subject6! =='C+' || cubit.Subject6! =='C')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.65,
                                  center: const Text(
                                    '65.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.teal,
                                ),
                              if(cubit.Subject6! =='C-' || cubit.Subject6! =='D+')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.60,
                                  center: const Text(
                                    '60.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.teal,
                                ),
                              if(cubit.Subject6! =='D-' || cubit.Subject6! =='D')
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.50,
                                  center: const Text(
                                    '50.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.teal,
                                ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.03,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 5.0,
                                backgroundColor: Colors.black,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.02,
                              ),
                              const Expanded(
                                child: Text(
                                  'Total',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width*0.01,
                              ),
                              if( cubit.GPA! >= 3.5 && cubit.GPA! <= 4)
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.90,
                                  center: const Text(
                                    '90.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.indigo,
                                ),
                              if( cubit.GPA! >= 3.0 && cubit.GPA! <= 3.5)
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.75,
                                  center: const Text(
                                    '75.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.indigo,
                                ),
                              if( cubit.GPA! >= 2.5 && cubit.GPA! <= 3.0)
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.65,
                                  center: const Text(
                                    '65.0%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.indigo,
                                ),
                              if( cubit.GPA! >= 2.0 && cubit.GPA! <= 2.5)
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.50,
                                  center: const Text(
                                    '.50%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.indigo,
                                ),
                              if( cubit.GPA! >= 1.5 && cubit.GPA! <= 2.0)
                                LinearPercentIndicator(
                                  width: indicatorLength,
                                  animation: true,
                                  lineHeight: 16.0,
                                  animationDuration: 2000,
                                  percent: 0.40,
                                  center: const Text(
                                    '.40%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  progressColor: Colors.indigo,
                                ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
    ) ;
  }
}
