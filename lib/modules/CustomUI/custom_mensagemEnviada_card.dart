import 'package:flutter/material.dart';

class MensagemEnviadaCard extends StatelessWidget {
  const MensagemEnviadaCard({
    Key? key,
    this.message,
  }) : super(key: key);
  //! nunca deixe como required quando for enviar ou receber mensagem !
  final String? message;

  @override
  Widget build(BuildContext context) {
    //*ConstrainedBox ele cria um card que ocupa somente o tamnho e largura da frase ou palavra
    //*ou seja se eu digitar 'oi' ele vai criar um card to tamanho do oi
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            //*-45 para que o card não pegue nas duas laterias da tela, fique só em uma
            maxWidth: MediaQuery.of(context).size.width - 40),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadowColor: Colors.blueGrey,          
          color: Color(0xFFDCF8C6),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          //*Stack aqui pois tem o texto que o usuario digita a hora e a verificação
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 60, top: 5, bottom: 22),
                child: Text(
                  message!,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      '15:34',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 18,
                      color: Colors.blueGrey,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
