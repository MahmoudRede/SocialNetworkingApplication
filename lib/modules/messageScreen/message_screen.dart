import 'package:final_project/modules/messageScreen/tabScreens/friendsTab/friends_tab.dart';
import 'package:final_project/modules/messageScreen/tabScreens/groupTab/group_tab.dart';
import 'package:final_project/modules/messageScreen/tabScreens/messagesTab/messages_tab.dart';
import 'package:flutter/material.dart';

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
          backgroundColor: Colors.blue,
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
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/Logo .jpg'),
                radius: 25.0,
              ),
               SizedBox(
                 width: 10.0,
               ),
               Text(
                'Chats',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
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
