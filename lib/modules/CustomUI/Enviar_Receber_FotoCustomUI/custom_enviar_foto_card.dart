import 'dart:io';

import 'package:flutter/material.dart';

import 'package:nome_whatsclone/shared/theme/app_colors.dart';

class FileCardEnviarFoto extends StatelessWidget {
  const FileCardEnviarFoto({
    Key? key,
    required this.path,
    required this.messageCard,
    required this.time
  }) : super(key: key);

  final String path;
  final String messageCard;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 1.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: AppColors.accent),
          child: Card(
            margin: EdgeInsets.all(3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Image.file(
                  File(path),
                  fit: BoxFit.fitHeight
                ),
                Text(messageCard)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
