import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

//*Colocando uma variavel aqui ela fica global para usarmos em qualquer lugar(variavel global)
List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({ Key? key }) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}