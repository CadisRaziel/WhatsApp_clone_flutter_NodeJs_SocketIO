import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nome_whatsclone/modules/screen/cameraView_screen.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

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


  //metodo para tirar a foto ao clicar no botão usando o package path_provider
  void tirarFoto(BuildContext context) async {
    final path = join((await getTemporaryDirectory()).path, '${DateTime.now()}.jpg');   
    XFile foto = await _cameraController!.takePicture(); 
    foto.saveTo(path);   
    //*vamos passar um path como parametro para a proxima tela
    Navigator.push(context, MaterialPageRoute(builder: (builder) => CameraViewScreen(path: path)));
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
  void dispose(){
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
                  return CameraPreview(_cameraController!);
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
                          Icons.flash_off,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {},
                      ),
                      InkWell(
                        onTap: () {
                          tirarFoto(context);                          
                        },
                        child: Icon(
                          Icons.panorama_fish_eye,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.flip_camera_ios,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () {},
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
