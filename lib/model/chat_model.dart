

import 'package:flutter/material.dart';

class ChatModel {
  String name;
  String time;
  String currentMessage;
  String status;
  int? id;
  Widget? icon;
  bool isGroup;
  bool selectGroup;


  ChatModel({
    this.name = '',
    this.time = '',
    this.currentMessage = '',
    this.status = '',
    this.id,
    this.icon,
    this.isGroup = false,
    this.selectGroup = false
  });
  

}
