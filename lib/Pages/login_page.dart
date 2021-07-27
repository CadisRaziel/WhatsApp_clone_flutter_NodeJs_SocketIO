import 'package:flutter/material.dart';
import 'package:nome_whatsclone/Pages/chat_page.dart';
import 'package:nome_whatsclone/model/chat_model.dart';
import 'package:nome_whatsclone/modules/CustomUI/custom_contatos_button_card.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ChatModel? sourceChat;

  List<ChatModel> chatmodel = [
    ChatModel(
        name: 'Dev Vitor noob',
        isGroup: false,
        currentMessage: 'Olá amigo, me ajuda em uma api ?',
        time: '15:30',
        id: 1,
        icon: Icon(
          Icons.person,
          color: Colors.white70,
        )),
    ChatModel(
        name: 'Dart',
        isGroup: false,
        currentMessage: 'fiz uma tela de login muito massa',
        time: '00:57',
        id: 2,
        icon: Icon(Icons.person, color: Colors.white70)),
    ChatModel(
        name: 'mae \u{2665}',
        isGroup: false,
        currentMessage: 'vem jantar',
        time: '12:30',
        id: 3,
        icon: Icon(Icons.person, color: Colors.white70)),
    ChatModel(
        name: 'pub dev',
        isGroup: false,
        currentMessage: 'mensagem pub dev',
        time: '05:57',
        id: 4,
        icon: Icon(Icons.person, color: Colors.white70)),
    // ChatModel(
    //     name: 'NodeJs',
    //     isGroup: true,
    //     currentMessage: 'nova mensagem nodejs',
    //     time: '12:27',
    //     icon: Icon(
    //       Icons.person,
    //       color: Colors.white70,
    //     )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatmodel.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            sourceChat = chatmodel.removeAt(index);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (builder) => HomeScreen(
                          chatmodels: chatmodel,  
                          sourceChatHome: sourceChat,
                        )));
          },
          child: ContatoButton(
            name: chatmodel[index].name,
            icon: Icons.person,
          ),
        ),
      ),
    );
  }
}
