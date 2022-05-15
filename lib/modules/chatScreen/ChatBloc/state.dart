abstract class ChatStates {}

class ChatInitialState extends ChatStates {}

class SendMessageState extends ChatStates {}

class SetMessageState extends ChatStates {}
class GetMessageState extends ChatStates {}

class ConnectServerState extends ChatStates {}