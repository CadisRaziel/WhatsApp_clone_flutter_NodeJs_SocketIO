class MessageModel {
  String? type;
  String mesage;
  String? time;
  String path;
  
  MessageModel({
    this.type,
    this.mesage = '',
    this.time,
    required this.path
  });
}
