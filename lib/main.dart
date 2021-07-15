import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:nome_whatsclone/modules/screen/camera_screen.dart';

import 'core/app_widget.dart';

Future<void> main() async {
  //*é muito importante colcoar o async e esse WidgetsFlutterBinding.ensureInitialized(); quando iremos utilizar a camera !!
  WidgetsFlutterBinding.ensureInitialized();

  //*availableCameras = vai usar todas as cameras disponiveis no dispositivo
  cameras = await availableCameras();

  runApp(MyApp());
}


