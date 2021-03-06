import 'package:final_project/constants/componts.dart';
import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_states.dart';
import 'package:final_project/modules/chatScreen/SingleChat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../layoutes/homepage/home_bloc/app_cubit.dart';
import '../../../../models/userModel/user_model.dart';

class FriendsTab extends StatelessWidget {
  const FriendsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <AppCubit , AppState>(
      listener: (context , state){},
      builder: (context , state){
        var friends = AppCubit.get(context).userFriends;

        return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context , index)=> messageRowItem(friends[index] , context),
            separatorBuilder: (context , index)=> const SizedBox(
              height: 10.0,
            ),
            itemCount: friends.length,
          ),
        );
      },
    );
  }

  Widget messageRowItem(UserModel model , context)
  {
    return InkWell(
      onTap: (){
        navigateTo(context, SingleChat(sourceModel: AppCubit.get(context).userModel!, receiverModel: model));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children:  [
                      CircleAvatar(
                        backgroundColor: mainColorLayout,
                        radius: 29.0,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage('${model.image}'),
                        radius: 28.0,
                      ),
                    ],

                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: const[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 7.0,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.lightGreen,
                          radius: 5.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    '${model.fullName}',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 17.0,
                    ),
                  ),
                  const SizedBox(
                    height: 0.2,
                  ),
                  Text(
                    'Start Chatting with ${model.fullName}',
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  '3m ago',
                  style: TextStyle(
                    fontSize: 15.0,

                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}