import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'cameraVideoView_screen.dart';
import 'cameraView_screen.dart';

//*Colocando uma variavel aqui ela fica global para usarmos em qualquer lugar(variavel global)
//*vai colcoar todas as cameras do dispotivo disponivel em uma lista
List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  Future<void>? cameraValue;
  bool isRecoring = false;
  bool isFlash = false;
  bool isCameraFront = false;
  String videoPath = '';
  XFile? fotoFile;
  XFile? videoFile;

  //metodo para tirar a foto ao clicar no botão usando o package path_provider
  void tirarFoto(BuildContext context) async {
    fotoFile = await _cameraController!.takePicture();
    //*vamos passar um path como parametro para a proxima tela
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraViewScreen(path: fotoFile!.path)));
  }

  //*precisamos inicializar as daus variaveis '_cameraController' e 'cameraValue' no initState
  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraValue = _cameraController!.initialize();
  }

  //*ja que iniciamos no initState, devemos fechar no dispose
  @override
  void dispose() {
    super.dispose();
    _cameraController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //*FutureBuilder para podermos acessar a camera
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: CameraPreview(_cameraController!));
                } else {
                  return Center(
                      //*spinkit = CircularProgressindicator personalizado
                      child: SpinKitThreeBounce(
                    color: Colors.teal,
                    size: 30.0,
                  ));
                }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          //*condição do icone do flash ligado e desligado
                          isFlash ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {
                          setState(() {
                            isFlash = !isFlash;
                          });
                          //*condição para ligar o flash e desligar o flash
                          isFlash
                              ? _cameraController!.setFlashMode(FlashMode.torch)
                              : _cameraController!.setFlashMode(FlashMode.off);
                        },
                      ),
                      GestureDetector(
                        onLongPress: () async {
                          await _cameraController!.startVideoRecording();
                          setState(() {
                            isRecoring = true;
                          });
                        },

                        //*onLongPressUp = para encerrar o longPress
                        onLongPressUp: () async {
                          videoFile =
                              await _cameraController!.stopVideoRecording();
                          setState(() {
                            isRecoring = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => CameraVideoViewScreen(
                                        path: videoFile!.path,
                                      )));
                        },
                        onTap: () {
                          if (!isRecoring) tirarFoto(context);
                        },
                        //*condição pois se clicar e segurar ele aparece o radio_button_on e se nao segurar ele aparece o panorama_fish_eye
                        child: isRecoring
                            ? Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 80,
                              )
                            : Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.white,
                                size: 70,
                              ),
                      ),
                      IconButton(
                        //*animação do icone de girar o icone da camera de ao clicar nele
                        icon: Icon(
                          Icons.flip_camera_ios,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () async {
                          //*condição para usarmos a camera frontal ao clicar no icone de virar a camera
                          setState(() {
                            isCameraFront = !isCameraFront;
                          });
                          int cameraFlip = isCameraFront ? 1 : 0;
                          _cameraController = CameraController(
                              cameras![cameraFlip], ResolutionPreset.high);
                          cameraValue = _cameraController!.initialize();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Segure para video, clique para foto',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
