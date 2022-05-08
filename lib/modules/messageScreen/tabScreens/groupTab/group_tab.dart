import 'package:final_project/constants/componts.dart';
import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_states.dart';
import 'package:final_project/models/chatModel/controller/controller.dart';
import 'package:final_project/models/chatModel/model/chat_model.dart';
import 'package:final_project/modules/chatScreen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class GroupTab extends StatefulWidget {
  const GroupTab({Key? key}) : super(key: key);

  @override
  State<GroupTab> createState() => _GroupTabState();
}

class _GroupTabState extends State<GroupTab> {

  var roomName='';
  RoomController roomController = RoomController();

  late IO.Socket socket;

  @override
  void initState() {
    socket = IO.io(
        'http://192.168.179.243:5000', <String, dynamic>{
        "transports": ["websocket"],
        "autoConnect": false,
      },);

    socket.connect();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppState>(
        listener: (context,state){

        },
      builder: (context,state){

          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context , index) {
               return messageRowItem(AppCubit.get(context).coursesTitle[index] , context,AppCubit.get(context).userModel!.username!,index);
              } ,
              separatorBuilder: (context , index)=> const SizedBox(
                height: 10.0,
              ),
              itemCount: AppCubit.get(context).coursesTitle.length,
            ),
          );
      },
    );
  }

  Widget messageRowItem(String groupName , context,String userName,index)
  {
    return InkWell(
      onTap: (){
        roomName=AppCubit.get(context).coursesTitle[index];
        roomFunction(roomName, userName);
        navigateTo(context, ChatScreen(roomName: roomName,));
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
                    children: [
                      CircleAvatar(
                        backgroundColor: mainColorLayout,
                        radius: 29.0,
                      ),
                      const CircleAvatar(
                        backgroundImage: NetworkImage('https://img.freepik.com/free-vector/people-meeting-online-via-video-conference-flat-illustration-cartoon-group-colleagues-virtual-collective-chat-during-lockdown_74855-14136.jpg?t=st=1652004200~exp=1652004800~hmac=c996b47470bfc84b6133de60ac13265f986d40aca7310d381ed0e1d6bc15b18d&w=740'),
                        radius: 28.0,
                      ),
                    ],

                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(3.0),
                  //   child: Stack(
                  //     alignment: AlignmentDirectional.center,
                  //     children: const[
                  //       CircleAvatar(
                  //         backgroundColor: Colors.white,
                  //         radius: 9.0,
                  //       ),
                  //       CircleAvatar(
                  //         backgroundColor: Colors.amber,
                  //         radius: 7.0,
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
                    groupName,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 0.2,
                  ),
                  const Text(
                    'Hello , this is Message Screen',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                const Text(
                  '3m ago',
                  style: TextStyle(
                    fontSize: 15.0,

                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                CircleAvatar(
                  backgroundColor: mainColorLayout,
                  radius: 13,
                  child: Text('7',style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void roomFunction(String roomName, String userName) {
    var roomJson = {"roomName": roomName, 'userName': userName};

    socket.emit('subscribe', roomJson);
    roomController.room.add(Room.fromJson(roomJson));
  }
}