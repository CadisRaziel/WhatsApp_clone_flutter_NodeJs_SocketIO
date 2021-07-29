import 'package:flutter/material.dart';

import 'package:nome_whatsclone/shared/theme/text_style.dart';

class OutrosStatus extends StatelessWidget {
  const OutrosStatus({
    Key? key,
    this.name,
    this.time,
    this.imageName,
  }) : super(key: key);

  final String? name;
  final String? time;
  final String? imageName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 26,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(imageName!),
      ),
      title: Text(
        name!,
        style: TextStyles.outrosStatus,
      ),
      subtitle: Text(
        'Hoje ${time!}',
        style: TextStyles.horaStatus,
      ),
    );
  }
}
