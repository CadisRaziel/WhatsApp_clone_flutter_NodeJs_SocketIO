import 'package:flutter/material.dart';
import 'package:nome_whatsclone/model/chat_model.dart';

class ContatosCard extends StatelessWidget {
  const ContatosCard({Key? key, this.contatos}) : super(key: key);
  final ChatModel? contatos;

  @override
  Widget build(BuildContext context) {
    //*Pagina criada para a criação de um 'novo grupo'
    return ListTile(
      //*precisamos colocar o container aqui para ele se adequar junto ao Positioned para que a bolinha de check fique certinha a lateral da foto do usuario
      leading: Container(
        height: 50,
        width: 50,
        child: Stack(
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
            //*estamos realizando uma operação ternaria para que o checkbox só apareã quando o usuario clicar
            //*se nao colocarmos essa operação ternaria o checkbox ja iria aparecer de cara
            contatos!.selectGroup ? Positioned(
              bottom: 4,
              right: 1,
                        child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 11,
                  child: Icon(
                Icons.check,
                color: Colors.white,
                size: 18,
              )),
              //*aqui é o final da operação ternaria
            ) : Container(),
          ],
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
    );
  }
}
