import 'package:final_project/constants/constants.dart';
import 'package:final_project/modules/messageScreen/tabScreens/friendsTab/friends_tab.dart';
import 'package:final_project/modules/messageScreen/tabScreens/groupTab/group_tab.dart';
import 'package:final_project/modules/messageScreen/tabScreens/messagesTab/messages_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> tabScreens = const [
      GroupTab(),
      FriendsTab(),
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColorLayout,
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          title: Row(
            children: [
              Text(
                  'Chats',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 27,
                    color: Colors.white,
                  )),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: CircleAvatar(
                  radius: 26,
                  backgroundColor: mainColorLayout,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Logo .jpg'),
                    radius: 24.0,
                  ),
                ),
              ),
            ],
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Group',
                  style : TextStyle(
                    fontSize: 16.0,
                    //fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Friends',
                  style : TextStyle(
                    fontSize: 16.0,
                    //fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: tabScreens,
        ),
      ),
    );
  }
}
