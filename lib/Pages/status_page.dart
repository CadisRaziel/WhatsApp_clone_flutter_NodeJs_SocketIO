import 'package:flutter/material.dart';
import 'package:nome_whatsclone/modules/CustomUI/StatusPageCustomUI/custom_meu_status.dart';
import 'package:nome_whatsclone/modules/CustomUI/StatusPageCustomUI/custom_outros_status.dart';
import 'package:nome_whatsclone/shared/theme/app_colors.dart';
import 'package:nome_whatsclone/shared/theme/app_images.dart';
import 'package:nome_whatsclone/shared/theme/text_style.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  Widget label(String labelname) {
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Text(
          labelname,
          style: TextStyles.updateStatus,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              elevation: 8,
              backgroundColor: Colors.blueGrey[100],
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.accent,
            elevation: 5,
            child: Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomStatus(),
            label('Atualizações recentes'),
            OutrosStatus(
              name: 'Batman',
              imageName: AppImages.bat,
              time: '15:30',
            ),
            OutrosStatus(
              name: 'Aquaman',
              imageName: AppImages.aqua,
              time: '12:12',
            ),
            OutrosStatus(
              name: 'Flash',
              imageName: AppImages.flash,
              time: '06:01',
            ),
            OutrosStatus(
              name: 'Superman',
              imageName: AppImages.man,
              time: '23:11',
            ),
            SizedBox(
              height: 10,
            ),
            label('Visto recente'),
              OutrosStatus(
              name: 'Mulher maravilha',
              imageName: AppImages.mulher,
              time: '17:43',              
            ),
              OutrosStatus(
              name: 'Darkseid',
              imageName: AppImages.darkside,
              time: '23:12',              
            ),
          ],
        ),
      ),
    );
  }
}
