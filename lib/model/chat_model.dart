

import 'package:flutter/material.dart';

class ChatModel {
  String name;
  String time;
  String currentMessage;
  String status;
  Widget? icon;
  bool isGroup;


  ChatModel({
    this.name = '',
    this.time = '',
    this.currentMessage = '',
    this.status = '',
    this.icon,
    this.isGroup = false,
  });
  

}
