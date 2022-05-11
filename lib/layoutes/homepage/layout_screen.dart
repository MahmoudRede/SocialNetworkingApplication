import 'package:final_project/constants/componts.dart';
import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_states.dart';
import 'package:final_project/modules/NewPost/NewPost.dart';
import 'package:final_project/modules/SearchScreen/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
                    child: cubit.doctorCheck==null? SizedBox(
                      height:500,
                      child: ListView.separated(
                        itemBuilder: (context,index){
                          return Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 20,),
                                    CircleAvatar(
                                      radius: 28,
                                      backgroundColor: Colors.grey[300],
                                    ),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(20)

                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        Container(
                                          height: 10,
                                          width: 150,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(20)

                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                        Container(
                                          height: 10,
                                          width: 140,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(20)

                                          ),
                                        ),
                                        const SizedBox(height: 5,),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      height: 10,
                                      width: 300,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(20)

                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      height: 10,
                                      width: 280,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(20)

                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    Container(
                                      height: 220,
                                      width: 350,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(left: 20),
                                              height: 12,
                                              width: 12,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius: BorderRadius.circular(20)

                                              ),
                                            ),
                                            const SizedBox(width: 5,),
                                            Container(
                                              height: 12,
                                              width: 12,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius: BorderRadius.circular(20)

                                              ),
                                            ),
                                            const SizedBox(width: 5,),
                                            Container(
                                              height: 12,
                                              width: 12,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius: BorderRadius.circular(20)

                                              ),
                                            ),
                                            const SizedBox(width: 5,),
                                            Container(
                                              height: 10,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius: BorderRadius.circular(20)

                                              ),
                                            ),
                                            const SizedBox(width: 5,),
                                            const Spacer(),
                                            Container(
                                              height: 10,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius: BorderRadius.circular(20)

                                              ),
                                            ),
                                            const SizedBox(width: 10,),

                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Container(
                                      height: 20,
                                      color: Colors.grey[300],
                                    )
                                  ],
                                )

                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context,index){
                          return const SizedBox(height: 10,);
                        },
                        itemCount: 5 ,
                      ),
                    ): cubit.doctorCheck!?cubit.doctorScreens[cubit.currentIndex]:cubit.studentScreens[cubit.currentIndex],
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
                        icon: const Icon(Icons.my_library_books),
                        title: const Text('Materials'),
                        selectedColor:mainColorLayout,
                      ),
                      SalomonBottomBarItem(
                        icon: const Icon(Icons.notifications_active),
                        title: const Text('Notifications'),
                        selectedColor:mainColorLayout,
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
                    icon: Icon(Icons.notifications, color: mainColorLayout),
                    onPressed: () {},
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

