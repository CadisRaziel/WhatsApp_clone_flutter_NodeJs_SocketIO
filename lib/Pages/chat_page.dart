import 'package:flutter/material.dart';
import 'package:nome_whatsclone/Pages/camera_page.dart';
import 'package:nome_whatsclone/modules/screen/conversas_screen.dart';
import 'package:nome_whatsclone/shared/theme/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//! lembre-se de colocar o mixin aqui : with SingleTickerProviderStateMixin
class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //* Para criar o AnimationController em um estado que usa apenas um único AnimationController , faça a mixagem nessa classe
  //* e passe vsync: this para o construtor do controlador de animação.
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    //* initialIndex = coloquei 1, pois se eu coloco 0 ele inicia na camera, e não queremos isso e o 1 eu fiz a pagina de conversas
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WhatsApp Vitor',
          style: TextStyles.title,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
          //* PopupMenuButton = para criar o menu do lado o icone de procurar
          PopupMenuButton<String>(
            onSelected: (value) {
              ///[aqui podemos fazer um switch e adicionar as telas de cada um]
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Novo grupo'),
                  value: 'Novo grupo',
                ),
                PopupMenuItem(
                  child: Text('Nova transmissão'),
                  value: 'Nova transmissão',
                ),
                PopupMenuItem(
                  child: Text('WhatsApp Web'),
                  value: 'WhatsApp Web',
                ),
                PopupMenuItem(
                  child: Text('Mensagens favoritas'),
                  value: 'Mensagens favoritas',
                ),
                PopupMenuItem(
                  child: Text('Pagamentos'),
                  value: 'Pagamentos',
                ),
                PopupMenuItem(
                  child: Text('Configurações'),
                  value: 'Configurações',
                ),
              ];
            },
          ),
        ],
        //* criando as tabs onde fica a camera, conversas, status, chamadas
        bottom: TabBar(
          indicatorColor: Colors.white,
          labelStyle: TextStyles.titleTab,
          controller: _controller,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'CONVERSAS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CHAMADAS',
            ),
          ],
        ),
      ),
      body: TabBarView(
        //temos que definir o controller aqui
        controller: _controller,
        children: [
          //* aqui nós vamos colocar as paginas widgets referente a cada tab
          CameraPage(),
          ConversasPage(),
          Center(child: Text('STATUS')),
          Center(child: Text('CHAMADAS')),
        ],
      ),
    );
  }
}
