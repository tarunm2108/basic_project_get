enum MessageType { text, image, video, voice, doc }

String encodeMessageType(MessageType messageType) {
  switch (messageType) {
    case MessageType.text:
      return '0';
    case MessageType.image:
      return '1';
    case MessageType.video:
      return '2';
    case MessageType.voice:
      return '3';
    case MessageType.doc:
      return '4';
  }
}

MessageType decodeMessageType(String type) {
  switch (type) {
    case '0':
      return MessageType.text;
    case '1':
      return MessageType.image;
    case '2':
      return MessageType.video;
    case '3':
      return MessageType.voice;
    case '4':
      return MessageType.doc;
    default:
      return MessageType.text;
  }
}

class MessageModel {
  String? message;
  MessageType? messageType;
  int? time;

  MessageModel({
    this.message,
    this.messageType,
    this.time,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json["message"],
      time: json["time"],
      messageType: json["messageType"] != null
          ? decodeMessageType(json["messageType"])
          : MessageType.text,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'time': time,
        'messageType': encodeMessageType(messageType ?? MessageType.text),
      };
}
