import 'package:flutter/material.dart';
import 'package:nome_whatsclone/model/chat_model.dart';

class ContatosCard extends StatelessWidget {
  const ContatosCard({Key? key, this.contatos}) : super(key: key);
  final ChatModel? contatos;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          backgroundColor: Colors.blueGrey[200],
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        title: Text(
          contatos!.name,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          contatos!.status,
          style: TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
