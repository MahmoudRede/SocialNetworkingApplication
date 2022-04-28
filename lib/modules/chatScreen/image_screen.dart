// import 'package:final_project/constants/componts.dart';
// import 'package:final_project/constants/constants.dart';
// import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
// import 'package:final_project/modules/chatScreen/chat_screen.dart';
// import 'package:final_project/modules/messageScreen/message_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
//
// import '../../models/chatModel/controller/controller.dart';
// import '../../models/chatModel/model/chat_model.dart';
//
// class ImageScreen extends StatefulWidget {
//   String? roomName;
//
//   ImageScreen({this.roomName});
//   @override
//   State<ImageScreen> createState() => _ImageScreenState(roomName: roomName);
// }
//
// class _ImageScreenState extends State<ImageScreen> {
//   String? roomName;
//
//   _ImageScreenState({this.roomName});
//
//   ChatController chatController = ChatController();
//
//   late IO.Socket socket;
//
//   @override
//   void initState() {
//     // socket = IO.io(
//     //     'http://192.168.1.12:5000',
//     //     IO.OptionBuilder()
//     //         .setTransports(['websocket'])
//     //         .disableAutoConnect()
//     //         .bui
//     socket = IO.io("http://192.168.179.243:5000", <String, dynamic>{
//       "transports": ["websocket"],
//       "autoConnect": false,
//     },);
//     socket.connect();
//     setUpSocketListener();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: mainColorLayout,
//       body: Container(
//         child: Column(
//           children: [
//             const SizedBox(height: 60,),
//             Row(
//               children: [
//                 const SizedBox(width: 10,),
//                 IconButton(
//                     onPressed:(){
//                       AppCubit.get(context).removeChatImage();
//                       Navigator.pop(context);
//                     } ,
//                     icon: const Icon(
//                       Icons.delete,
//                       color: Colors.white,
//                       size: 30,
//                     )
//                 ),
//                 const Spacer(),
//                 IconButton(
//                     onPressed:(){
//                       setState(() {
//                         AppCubit.get(context).createUrlImage().then((value) {
//                           // messageFunction(messageController.text);
//                           print(AppCubit.get(context).chatImage!);
//                           messageFunction(AppCubit.get(context).chatImage!);
//                           AppCubit.get(context).chatImage='';
//                           Navigator.pop(context);
//
//                       });
//
//
//                       });
//                     } ,
//                     icon: const Icon(
//                       Icons.done_sharp,
//                       color: Colors.white,
//                       size: 30,
//                     )
//                 ),
//                 const SizedBox(width: 10,),
//               ],
//             ),
//             const SizedBox(height: 40,),
//             if(AppCubit.get(context).uploadedChatImage !=null)
//             Container(
//               alignment: Alignment.center,
//               height: 500,
//               width: double.infinity,
//               child:  Image(
//                   image: FileImage(AppCubit.get(context).uploadedChatImage!),
//                   fit: BoxFit.cover,
//
//               ),
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   void messageFunction(String text) {
//     var messageJson = {
//       "message": text,
//       'sentByMe': AppCubit.get(context).userModel!.uId,
//       'roomName': roomName
//     };
//     socket.emit('group_message', messageJson);
//     chatController.chat_message.add(Message.fromJson(messageJson));
//   }
//
//   void setUpSocketListener() {
//     socket.on('message-receive', (data) {
//       print(data);
//       print('message receive');
//       chatController.chat_message.add(Message.fromJson(data));
//     });
//   }
// }
