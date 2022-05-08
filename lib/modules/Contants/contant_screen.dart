import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/constants/componts.dart';
import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_states.dart';
import 'package:final_project/modules/Contants/Lects/lec_screen.dart';
import 'package:final_project/modules/materialsScreen/materials_screen.dart';
import 'package:final_project/shared/local/cash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../layoutes/homepage/container_screen.dart';
import 'Labs/lab_screen.dart';

class ContantScreen extends StatelessWidget {

  String materialName='';

  ContantScreen({

    required this.materialName,
  });



  List <String> texts =[
    'Lectures',
    'Sections',
  ];

  List  carouselImages =[

    'assets/images/slider1.json',
    'assets/images/slider2.json',
    'assets/images/slider3.json'

  ];

  List  imagesItem =[

    'https://img.freepik.com/free-photo/close-up-busy-businesswoman-writing_1098-3428.jpg?w=740',
    'https://img.freepik.com/free-vector/webinar-concept-illustration_114360-4764.jpg?w=740'
  ];



  @override
  Widget build(BuildContext context) {
    List <Function> functionItem =[

          (){
            CashHelper.saveData(key: 'type',value: 'Lectures');
            if(CashHelper.getData(key: 'isDoctor')==true){
              AppCubit.get(context).getDoctorMaterial();
            }
            else{
              AppCubit.get(context).getMaterial();

            }
            navigateTo(context, LecScreen(titleScreen: materialName));
          },

          (){
            CashHelper.saveData(key: 'type',value: 'Sections');
            if(CashHelper.getData(key: 'isDoctor')==true){
              AppCubit.get(context).getDoctorSection();
            }
            else{
              AppCubit.get(context).getSection();
            }
            navigateTo(context, LabScreen(titleScreen: materialName));
      }

    ];
    return BlocConsumer<AppCubit,AppState>(

      listener: (context,state){

      },
      builder: (context,state){
        return  Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                  Icons.arrow_back_ios
              ),
              onPressed: (){
                navigateTo(context, ContainerScreen());
              },
            ),
            elevation: 0,
            iconTheme: const IconThemeData(
                color: Colors.black
            ),
            title:  Text(
              'Materials',
              style: TextStyle(
                color: mainColorLayout,
                fontSize: 19,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          body: Container(
            child: Column(
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

                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                  child: Text(materialName, style: const TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                const SizedBox(height: 10,),
                // Expanded(
                //   child: GridView.count(
                //     crossAxisCount: 2,
                //     physics: const BouncingScrollPhysics(),
                //     crossAxisSpacing: 0,
                //     mainAxisSpacing: 0,
                //     childAspectRatio: 1/.7,
                //     children: List.generate(2, (index) {
                //       return itemBlock(texts[index], colorsItem[index], colorsContainer[index]);
                //     } ),
                //
                //
                //   ),
                // ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context,index) => itemBlock(texts[index],imagesItem[index],functionItem[index],context,materialName) ,
                      separatorBuilder: (context,index){
                        return const SizedBox(height: 0,);
                      },
                      itemCount: 2
                  ),
                ),
              ],
            ),
          ),

        );
      },
    );
  }
}


Widget itemBlock(String text,String image,Function function,context,String materialName){

  return  InkWell(
    onTap: (){

      function();

    },
    child: Container(
      height: 90,
      margin: const EdgeInsets.all(10),
      child:  Material(
        color: mainColorLayout.withOpacity(.8),
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              Text(text,style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 17,
              ),),
              const Spacer(),
              CircleAvatar(
                radius: 31,
                backgroundColor: Colors.grey.shade300,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      image
                  ),
                ),
              )


            ],
          ),
        ),
      ),

    ),
  );


}