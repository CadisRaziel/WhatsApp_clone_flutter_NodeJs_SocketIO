import 'package:flutter/material.dart';
import 'package:nome_whatsclone/model/chat_model.dart';
import 'package:nome_whatsclone/modules/CustomUI/custom_card.dart';

import 'contatos_screen.dart';

class ConversasPage extends StatefulWidget {
  const ConversasPage({Key? key, this.chatmodels, this.sourchChatConversas})
      : super(key: key);
  final List<ChatModel>? chatmodels;
  final ChatModel? sourchChatConversas;

  @override
  _ConversasPageState createState() => _ConversasPageState();
}

class _ConversasPageState extends State<ConversasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //*para ao clicarmos no button irmos para a pagina de contatos
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContatosPage(),
              ));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: widget.chatmodels!.length,
        itemBuilder: (BuildContext context, index) => SingleChildScrollView(
          child: CustomCardWidget(
            chatModel: widget.chatmodels![index],
            sourceChatCustom: widget.sourchChatConversas,
          ),
        ),
      ),
    );
  }
}
