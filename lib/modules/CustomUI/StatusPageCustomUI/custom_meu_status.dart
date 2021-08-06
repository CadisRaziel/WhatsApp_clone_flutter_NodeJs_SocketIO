import 'package:flutter/material.dart';
import 'package:nome_whatsclone/shared/theme/app_colors.dart';
import 'package:nome_whatsclone/shared/theme/app_images.dart';
import 'package:nome_whatsclone/shared/theme/text_style.dart';

class CustomStatus extends StatelessWidget {
  const CustomStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(AppImages.vitor),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
                radius: 10,
                backgroundColor: AppColors.accent,
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      title: Text(
        'Meu status',
        style: TextStyles.status,
      ),
      subtitle: Text(
        'Toque aqui para atualizar seus status',
        style: TextStyles.substatus,
      ),
    );
  }
}
