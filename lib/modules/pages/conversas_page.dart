import 'package:flutter/material.dart';
import 'package:nome_whatsclone/model/chat_model.dart';
import 'package:nome_whatsclone/modules/CustomUI/custom_card.dart';

class ConversasPage extends StatefulWidget {
  const ConversasPage({ Key? key }) : super(key: key);

  @override
  _ConversasPageState createState() => _ConversasPageState();
}

class _ConversasPageState extends State<ConversasPage> {

  List<ChatModel> chats = [
    ChatModel(
      name: 'Dev Vitor noob',
      isGroup: false,
      currentMessage: 'Olá amigo, me ajuda em uma api ?',
      time: '15:30',
      icon: Icon(Icons.person, color: Colors.white70,)
    ),
    ChatModel(
      name: 'Flutter iniciantes',
      isGroup: true,
      currentMessage: 'fiz uma tela de login muito massa',
      time: '00:57',
      icon: Icon(Icons.group,
                  color: Colors.white70)
    ),
    ChatModel(
      name: 'Mãe \u{2665}',
      isGroup: false,
      currentMessage: 'sai desse computador, vem almoçar',
      time: '12:27',
      icon: Icon(Icons.person, color: Colors.white70,)
    ),
    ChatModel(
      name: 'Amor \u{2665}',
      isGroup: false,
      currentMessage: 'Compra fralda pra Ari',
      time: '18:02',
      icon: Icon(Icons.person, color: Colors.white70,)
    ),
    ChatModel(
      name: 'Dev não tem vida social',
      isGroup: true,
      currentMessage: 'Kkkkk, a gente pode ver no discord',
      time: '03:50',
      icon: Icon(Icons.group, color: Colors.white70,)
    ),
    ChatModel(
      name: 'Trabalho',
      isGroup: true,
      currentMessage: 'foda é acordar cedo amanha =(',
      time: '22:20',
      icon: Icon(Icons.group, color: Colors.white70,)
    ),
    ChatModel(
      name: 'Vitor',
      isGroup: false,
      currentMessage: 'eu to resumindo a doc do dart',
      time: '17:38',
      icon: Icon(Icons.group, color: Colors.white70,)
    ),
    ChatModel(
      name: 'Animes 90s',
      isGroup: true,
      currentMessage: 'Eu vi o filme do Vampire Hunter D',
      time: '17:38',
      icon: Icon(Icons.group, color: Colors.white70,)
    ),
    ChatModel(
      name: 'Biker Lovers',
      isGroup: true,
      currentMessage: 'O pneu da minha bike muchou',
      time: '17:38',
      icon: Icon(Icons.group, color: Colors.white70,)
    ),
    ChatModel(
      name: 'Amigo',
      isGroup: false,
      currentMessage: 'to cansado hoje',
      time: '17:38',
      icon: Icon(Icons.group, color: Colors.white70,)
    ),
    ChatModel(
      name: 'Sk8',
      isGroup: true,
      currentMessage: 'shape quebrou',
      time: '17:38',
      icon: Icon(Icons.group, color: Colors.white70,)
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
       itemCount: chats.length,
       itemBuilder: (BuildContext context, index) => SingleChildScrollView(child: CustomCardWidget(chatModel: chats[index]))
      ),
    );
  }
}