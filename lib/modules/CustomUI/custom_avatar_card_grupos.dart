import 'package:flutter/material.dart';
import 'package:nome_whatsclone/model/chat_model.dart';

class AvatarCardGrupo extends StatelessWidget {
  const AvatarCardGrupo({Key? key, this.contatos}) : super(key: key);

  final ChatModel? contatos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: Colors.blueGrey[200],
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              //*Positioned = para posicionar a bolinha verde do check em baixo da foto do usuario
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 13,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 2,),
          Text(contatos!.name , style: TextStyle(fontSize: 12),)
        ],
      ),
    );
  }
}
