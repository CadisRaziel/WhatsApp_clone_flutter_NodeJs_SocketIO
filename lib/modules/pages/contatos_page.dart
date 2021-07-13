import 'package:flutter/material.dart';
import 'package:nome_whatsclone/model/chat_model.dart';
import 'package:nome_whatsclone/modules/CustomUI/contatos_button_card.dart';
import 'package:nome_whatsclone/modules/CustomUI/contatos_card.dart';
import 'package:nome_whatsclone/shared/theme/text_style.dart';

class ContatosPage extends StatefulWidget {
  const ContatosPage({Key? key}) : super(key: key);

  @override
  _ContatosPageState createState() => _ContatosPageState();
}

class _ContatosPageState extends State<ContatosPage> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contatosModel = [
      ChatModel(
        name: 'Rosana',
        status: 'Olá! Eu estou usando WhatsApp.',
      ),
      ChatModel(
        name: 'Pedro bike',
        status: 'andando de bike',
      ),
      ChatModel(
        name: 'Loja 2 skate',
        status: 'Av Nossa Senhora da Paz',
      ),
      ChatModel(
        name: 'Amor antigo numero \u{2665}',
        status: 'Vitor <3',
      ),
      ChatModel(
        name: 'Lucas Linkedin',
        status: 'Trabalhando',
      ),
      ChatModel(
        name: 'Lucas trab',
        status: 'Palmeiras te amo',
      ),
      ChatModel(
        name: 'Vinicius trabalho',
        status: 'Live na twitch as 20:00',
      ),
      ChatModel(
        name: 'Padaria',
        status: 'Abre as 07hrs',
      ),
      ChatModel(
        name: 'Carro',
        status: 'Livrais do mal',
      ),
      ChatModel(
        name: 'Vizinho',
        status: 'pagodinho',
      ),
      ChatModel(
        name: 'cabelo',
        status: 'Revenge Tattoo',
      ),
      ChatModel(
        name: 'Revenge Tatto',
        status: 'Venha tatuar sua história',
      ),
      ChatModel(
        name: 'Trabalho',
        status: 'Desenvolvendo pessoa',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contatos',
              style: TextStyles.titleContatos,
            ),
            Text('${contatosModel.length} contatos',
                style: TextStyles.subTitleContatos)
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 26,
              )),
          PopupMenuButton<String>(
            onSelected: (value) {
              ///[aqui podemos fazer um switch e adicionar as telas de cada um]
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Convidar um amigo'),
                  value: 'Convidar um amigo',
                ),
                PopupMenuItem(
                  child: Text('Contatos'),
                  value: 'Contatos',
                ),
                PopupMenuItem(
                  child: Text('Atualizar'),
                  value: 'Atualizar',
                ),
                PopupMenuItem(
                  child: Text('Ajuda'),
                  value: 'Ajuda',
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        //! +2 e -2 = para que o nosso contexto(contatosModel) vai começar do zero e os dois indices abaixo ajusta os -2
          itemCount: contatosModel.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return ContatoButton(
                icon: Icons.group, name: 'Novo grupo',
              );
            } else if (index == 1) {
              return ContatoButton(
                icon: Icons.person_add, name: 'Novo contato',
              );
            }
            return ContatosCard(contatos: contatosModel[index - 2]);
          }),
    );
  }
}
