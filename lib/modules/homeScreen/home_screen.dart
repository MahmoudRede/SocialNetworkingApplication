import 'package:final_project/constants/componts.dart';
import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_states.dart';
import 'package:final_project/models/PostModel.dart';
import 'package:final_project/models/homeModel/home_model.dart';
import 'package:final_project/modules/CommentScreen/CommentScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../../layoutes/homepage/home_bloc/app_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer <AppCubit , AppState>(
            listener: (context,state){},
            builder: (context,state){
              List <PostModel> homePosts = AppCubit.get(context).homePost;
                return Builder(
                    builder: (context) {
                      AppCubit.get(context).homePost;
                      return Column(
                        children: [
                          const SizedBox(
                            height: 8.0,
                          ),
                          AppCubit.get(context).homePost.isEmpty?
                          Container(
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
                          ):
                          Expanded(
                            child:ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context,index)=>postItem( homePosts[index] , index , context),
                              separatorBuilder: (context,index){
                                return  const SizedBox(height: 10,);
                              },
                              itemCount: homePosts.length,
                            ),
                          ),
                        ],
                      );
                    },
                );
            },
          );
        }

}

Widget postItem(PostModel model ,index  , context){
  return  Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10,0,0,0),
          child: Row(
            children:  [
              CircleAvatar(
                radius: 26,
                backgroundImage: NetworkImage(model.userImage!),
              ),
              const SizedBox(width: 8,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.username!,
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 3,),
                  Text(
                    model.postDate!,
                    style: GoogleFonts.lato(
                      color: Colors.grey[600],
                      fontSize: 11,
                    ),),
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(
                      Icons.more_vert,
                    color: Colors.black54,
                  ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              model.postText!,
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 16,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        model.postImage != null ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Image(
            image: NetworkImage(model.postImage!),
          ),
        ) : const SizedBox(height: 10,),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              Text('${AppCubit.get(context).homeLikes[index]}',
                style: GoogleFonts.lato(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),),
              const SizedBox(
                width: 4.0,
              ),
              Text('Like',
                style: GoogleFonts.lato(
                    color: Colors.grey,
                    fontSize: 13,
                ),),
              const Spacer(),
              Text(
                '${AppCubit.get(context).homeCommentsNumber[index]}',
                style: GoogleFonts.lato(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                width: 4.0,
              ),
              Text(
                'Comment',
                style: GoogleFonts.lato(
                    color: Colors.grey,
                    fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0),
          height: 1,
          color: Colors.grey[300],
        ),
        Row(
          children:  [
            Expanded(
              child: IconButton(
                onPressed: (){
                  //AppCubit.get(context).likeHomePost(AppCubit.get(context).homePostsId[index]);
                  AppCubit.get(context).likeClick(AppCubit.get(context).homePostsId[index]);
                },
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Icon(
                      LineIcons.heart,
                      size: 24.0,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      'Like',
                      style: GoogleFonts.lato(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
            ),),
            Expanded(
              child: IconButton(
                onPressed: (){
                  navigateTo(context, CommentScreen(postId: AppCubit.get(context).homePostsId[index], route: 'home',));
                },
                icon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Icon(
                      LineIcons.comment,
                      size: 24.0,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      'Comment',
                      style: GoogleFonts.lato(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),),
          ],
        ),
      ],

    ),
  );

}
