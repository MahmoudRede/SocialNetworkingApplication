import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BotScreen extends StatelessWidget {
   BotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
        listener: (context,state){

        },
        builder:(context,state){
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 0.0,
              backgroundColor: mainColorLayout,
              title: Row(
                children: [
                  Stack(
                    children:  [
                      const CircleAvatar(
                        radius: 20.0,
                        backgroundImage: AssetImage('assets/images/robot.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 6.0,
                          backgroundColor: mainColorLayout,
                          child: const CircleAvatar(
                            radius: 4.0,
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Elise',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 2,),
                        Text(
                          'online',
                          style: TextStyle(
                            fontSize: 14.0,
                            height: 1.3,
                          ),
                        ),


                      ],
                    ),
                  )
                ],
              ),
            ),
            body: Column(
              children: [
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 20.0,
                            backgroundImage: AssetImage('assets/images/robot.png'),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 10.0),
                            decoration: const BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(10.0),
                                topEnd: Radius.circular(10.0),
                                bottomEnd: Radius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              'Hello!! \nI am Elise you can turn to \nme if you nee anything',
                              style:  TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context , index){
                      return myMessageItem(AppCubit.get(context).messagesBot![index],context,index);
                    },
                    separatorBuilder: (context , index) => const SizedBox(
                      height: 1.0,
                    ),
                    itemCount: AppCubit.get(context).messagesBot!.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 40.0,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey[200],
                          ),
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Type a message here....',
                              border: InputBorder.none,
                            ),
                            controller: AppCubit.get(context).messageController,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          AppCubit.get(context).chatBotMessages(AppCubit.get(context).messageController.text);
                          AppCubit.get(context).postChatBot(AppCubit.get(context).messageValue!, AppCubit.get(context).programmingField);
                        },
                        icon: Icon(
                          Icons.send_rounded,
                          color: mainColorLayout,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
    );
  }

  Widget botMessageItem()
  {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 14),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/robot.png'),
              radius: 28.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0 ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 10.0),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(10.0),
                    topEnd: Radius.circular(10.0),
                    bottomEnd: Radius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'receved message',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myMessageItem(String ?text,context,int? index)
  {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 10.0),
                decoration: BoxDecoration(
                  color: mainColorLayout,
                  borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(10.0),
                    topEnd: Radius.circular(10.0),
                    bottomStart: Radius.circular(10.0),
                  ),
                ),
                child: Text(
                  text!,
                  style:  const TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                const CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('assets/images/robot.png'),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Align(
                    widthFactor: 250,
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 10.0),
                      decoration: const BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(15.0),
                          topEnd: Radius.circular(15.0),
                          bottomEnd: Radius.circular(15.0),

                        ),
                      ),
                      child:AppCubit.get(context).messagesBotRespond!.length==index!?
                           const Icon(Icons.more_horiz,color: Colors.white,size: 25,)
                          : AppCubit.get(context).typeRespond=='String'?
                      Text(
                          AppCubit.get(context).messagesBotRespond![index],style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15
                      )) :Container(
                        child: Column(
                          children:[
                            const SizedBox(height: 5,),
                            Text(AppCubit.get(context).messagesBotRespond![index],style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15
                            ),),
                            // const SizedBox(height: 5,),
                            // Text(AppCubit.get(context).chatBotCourse2!,style: const TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 15
                            // ),),
                            // const SizedBox(height: 5,),
                            // Text(AppCubit.get(context).chatBotCourse3!,style: const TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 15
                            // ),),
                            // const SizedBox(height: 5,),
                          ],
                        ),

                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
    );
  }


}
