import 'package:final_project/modules/chatScreen/ChatBloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

import '../../../models/SingleChat/MessageModel.dart';

class ChatCubit extends Cubit <ChatStates>{
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);
  IO.Socket? socket;
  List <dynamic> serverMessages = [];
  List<MessageModel> messages = [];
  ScrollController scrollController = ScrollController();


  void sendMessage(String message, String sourceId, String targetId , String time) {
    setMessage("source", message);
    socket!.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId , "date" : time});
    emit(SendMessageState());
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(
        type: type,
        message: message,
        time: DateTime.now().toString().substring(10, 16));
    print(messages);
      messages.add(messageModel);
      emit(SetMessageState());
  }

  void getMessages (String sourceId, String targetId) {
    socket!.emit("get_messages" , {"sourceId": sourceId, "targetId": targetId});
    socket!.on("get_messages" , (data){
      if (data != null ) serverMessages = data['messages'];
      serverMessages.forEach((element) {
        if(element['sender'] == sourceId){
          setMessage("source", element["message"]);
        } else{
          setMessage("received", element["message"]);
        }
      });
    });
    emit(GetMessageState());
  }

  void connect(String source , String receiver) {
    socket = IO.io("http://192.168.1.10:5000",  < String,dynamic>{
      "transports" : ["websocket"],
      "autoconnect" : false,
    });
    socket!.connect();
    socket!.emit('signin',{
      "id":source
    });
    socket!.onConnect((data) {
      print("Connected");
      socket!.on("message", (msg) {
        print(msg);
        setMessage("received", msg["message"]);
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      });
      // socket!.on("get_messages" , (data){
      //   if (data != null ) serverMessages = data['messages'];
      //   serverMessages.forEach((element) {
      //     if(element['sender'] == source){
      //       setMessage("source", element["message"]);
      //     } else{
      //       setMessage("destination", element["message"]);
      //     }
      //   });
      // });
    });
    print(socket!.connected);
    emit(ConnectServerState());
  }









}