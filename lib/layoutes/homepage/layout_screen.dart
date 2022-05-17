import 'package:final_project/constants/componts.dart';
import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_states.dart';
import 'package:final_project/modules/NewPost/NewPost.dart';
import 'package:final_project/modules/SearchScreen/SearchScreen.dart';
import 'package:final_project/modules/addPost/add_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return BlocConsumer<AppCubit,AppState>(
          listener: (context,state){},
          builder: (context,state){
            var cubit= AppCubit.get(context);
            return AnimatedContainer(
              height: double.infinity,
              width: double.infinity,
              transform: Matrix4.translationValues(cubit.xOffcet, cubit.yOffcet, 0)..scale(cubit.scale),
              duration: const Duration(milliseconds: 300),
              color: Colors.white,
              child: Scaffold(
                  backgroundColor: Colors.grey.shade100,
                  appBar: appBar(AppBar().preferredSize.height , context),
                  body: RefreshIndicator(
                    onRefresh: AppCubit.get(context).refreshApp,
                    child:
                    cubit.doctorCheck==null?
                    SizedBox(
                      height:double.infinity,
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Lottie.asset('assets/images/internet.json',height: 260,width: double.infinity),
                            const SizedBox(height: 15,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                              child: Text('Check your internet connection and try again !!',style: GoogleFonts.palanquin(
                                fontSize: 20,
                                color: Colors.red,
                                fontWeight: FontWeight.w700
                              ),
                              textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ) :  cubit.doctorCheck!?cubit.doctorScreens[cubit.currentIndex]:cubit.studentScreens[cubit.currentIndex],
                  ),
                  bottomNavigationBar: SalomonBottomBar(
                    onTap: (index){
                      cubit.changeBottomNavigate(index);
                    },
                    currentIndex: cubit.currentIndex,
                    items: [
                      SalomonBottomBarItem(
                        icon: const Icon(Icons.home),
                        title: const Text('Home'),
                        selectedColor:mainColorLayout,
                      ),
                      SalomonBottomBarItem(
                        icon: const Icon(Icons.group),
                        title: const Text('Groups'),
                        selectedColor:mainColorLayout,
                      ),

                      SalomonBottomBarItem(
                        icon: const Icon(Icons.menu_book_outlined),
                        title: const Text('Materials'),
                        selectedColor:mainColorLayout,
                      ),
                      SalomonBottomBarItem(
                        icon: const Icon(Icons.lightbulb),
                        title: const Text('Road Maps'),
                        selectedColor : mainColorLayout,
                      ),
                    ],
                  )
              ),
            );
          },
        );
      },
    );
  }


  appBar(height , context ) => PreferredSize(
    preferredSize:  Size(MediaQuery.of(context).size.width, height+60 ),
    child: Stack(
      children: <Widget>[
        Container(
          child: Center(
            child: Text(
              "BFCAI Community",
              style: GoogleFonts.lato(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          color: mainColorLayout,
          height: height+70,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 92.0,
          left: 20.0,
          right: 20.0,
          child: Material(
            borderRadius: BorderRadius.circular(15.0),
            elevation: 2,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      AppCubit.get(context).getUserData().then((value) {
                        AppCubit.get(context).doSmallScreen();
                      });

                    },
                    child: Icon(Icons.menu, color: mainColorLayout,),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        navigateTo(context, const SearchScreen());
                      },
                      child: Text(
                        'Search',
                        style: GoogleFonts.lato(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: mainColorLayout),
                    onPressed: () {
                      navigateTo(context, const SearchScreen());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: mainColorLayout),
                    onPressed: () {
                      AppCubit.get(context).doctorCheck!?
                      navigateTo(context,  NewPost()):
                      customToast('Not Allowed Add Post', Colors.red);

                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(),
      ],
    ),
  );


}

