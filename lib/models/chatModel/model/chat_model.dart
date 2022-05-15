class Message {
  String? message;
  String? sentByMe;
  String? time;
  String? roomName;

  Message({required this.message, required this.sentByMe, required this.time ,required this.roomName});

  factory Message.fromJson(Map<String, dynamic> Json) {
    return Message(
      message: Json["message"],
      sentByMe: Json["sentByMe"],
      time: Json["time"],
      roomName: Json["roomName"],
    );
  }
}


class Room {
  String? roomName;
  String? userName;

  Room({required this.roomName, required this.userName});

  factory Room.fromJson(Map<String, dynamic> Json) {
    return Room(
      userName: Json["userName"],
      roomName: Json["roomName"],
    );
  }
}
