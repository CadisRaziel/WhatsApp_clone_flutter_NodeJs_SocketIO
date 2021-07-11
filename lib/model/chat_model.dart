

import 'package:flutter/material.dart';

class ChatModel {
  String name;
  String time;
  String currentMessage;
  Widget? icon;
  bool isGroup;


  ChatModel({
    this.name = '',
    this.time = '',
    this.currentMessage = '',
    this.icon,
    this.isGroup = false,
  });
  

}
