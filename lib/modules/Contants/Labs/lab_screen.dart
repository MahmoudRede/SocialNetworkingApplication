import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/container_screen.dart';
import 'package:final_project/modules/Contants/contant_screen.dart';
import 'package:final_project/modules/materialsScreen/materials_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/componts.dart';
import '../../../layoutes/homepage/home_bloc/app_cubit.dart';
import '../../../layoutes/homepage/home_bloc/app_states.dart';
import '../../../models/materialModel.dart';
import '../../pdfReader/pdf_reader.dart';

class LabScreen extends StatelessWidget {

  String titleScreen='';

  LabScreen({
    required this.titleScreen
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppState>(
      listener: (context , state){},
      builder: (context , state){
        var cubit = AppCubit.get(context);
        List lectures = AppCubit.get(context).section;
        var key= GlobalKey<ScaffoldState>();
        int i=0;

        return Scaffold(
            key:key,
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                    Icons.arrow_back_ios
                ),
                onPressed: (){
                  navigateAndFinish(context, ContainerScreen());
                },
              ),
              actions: [
                if(cubit.doctorCheck==true)
                  IconButton(
                      onPressed: (){
                        key.currentState?.showBottomSheet(
                                (context) => Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment: Alignment.topLeft,
                              color: Colors.black87,
                              width: double.infinity,
                              height: 50,
                              child: TextButton(
                                onPressed: (){
                                   cubit.getPdf(title:titleScreen,index: i).then((value) {
                                     navigateTo(context,MaterialsScreen());
                                  });
                                },
                                child: Text('Add Section',style: GoogleFonts.lato(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),),
                              ),
                            )
                        );
                      },
                      icon: const Icon(
                          Icons.more_vert
                      )
                  )
              ],
              iconTheme: const IconThemeData(
                  color: Colors.black
              ),
              elevation: 3,
              title: Text(
                titleScreen,
                style: const TextStyle(
                    color: Colors.black
                ),
              ),
            ),
            body: Container(
              child: Column(
                children: [
                  cubit.isUpload==false ||  cubit.section.isEmpty?
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: GridView.count(
                        crossAxisCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1/.8,
                        children: List.generate(16,
                                (index) => Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),

                              ),
                            ) ),
                      ),
                    ),
                  ):
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 1/.95,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: List.generate(
                          cubit.section.length, (index) {
                            i=cubit.section.length;
                            return lectureCard(cubit.section[index] , context,index);
                        }
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        );
      },
    );
  }

  Widget lectureCard (MaterialModel lecture , context,index)
  {
    return InkWell(
      onTap: (){
        navigateTo(context, PdfReader(pdfUrl: lecture.url.toString() , title: lecture.title.toString(),));
      },
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          elevation: 20,
          color: Colors.grey.shade300,
          child: Column(
            children: [
              const Image(
                image: NetworkImage(
                    'https://img.freepik.com/free-photo/close-up-busy-businesswoman-writing_1098-3428.jpg?w=740'
                ),
              ),
              const SizedBox(height: 13,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${lecture.title}',
                    style:  const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    '${index+1}',
                    style: TextStyle(
                        fontSize: 15,
                        color: mainColorLayout,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

}
