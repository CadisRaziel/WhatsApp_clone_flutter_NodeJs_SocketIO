import 'package:flutter/material.dart';
import 'package:nome_whatsclone/model/chat_model.dart';
import 'package:nome_whatsclone/modules/CustomUI/Avatar_card_grupos.dart';
import 'package:nome_whatsclone/modules/CustomUI/contatos_card.dart';
import 'package:nome_whatsclone/shared/theme/text_style.dart';

class CriarGrupoPage extends StatefulWidget {
  const CriarGrupoPage({Key? key}) : super(key: key);

  @override
  _CriarGrupoPageState createState() => _CriarGrupoPageState();
}

class _CriarGrupoPageState extends State<CriarGrupoPage> {
  //*se eu defini algo aqui fora ele sera global

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
      name: 'Amor TIM \u{2665}',
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

  List<ChatModel> grupos = [];

  @override
  Widget build(BuildContext context) {
    //*se eu defini algo aqui dentro ele não sera global
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Novo grupo',
              style: TextStyles.titleContatos,
            ),
            Text('Adicionar participantes', style: TextStyles.subTitleContatos)
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 26,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            //! +2 e -2 = para que o nosso contexto(contatosModel) vai começar do zero e os dois indices abaixo ajusta os -2
            itemCount: contatosModel.length + 1,
            itemBuilder: (context, index) {
              //*Colocamos essa condição if para que quando nao tiver contato selecionado para começar um grupo, não apareça aquele container branco
              //*vai aparecer somente os contatos, um efeito para ficar mais bonito ao invez de ficar o container branco estatico sem nada
              //*o index foi para que quando clicarmos em um contato o container nao sobreponha o primeiro contato
              //*precisamos colocar o +1 e -1 pois colocamos o index == 0, se nao fizermos isso o container tira o 1 contato da lista
              //*ou seja o +1 é para quando o container aparecer ele coloque mais .lenght assim não teremos erro de comprimento
              if (index == 0) {
                return Container(height: grupos.length > 0 ? 90 : 10);
              }
              return InkWell(
                  onTap: () {
                    //*abaixo temos a condição
                    if (contatosModel[index - 1].selectGroup == false) {
                      setState(() {
                        //*se clicarmos no contato ele fica true e coloca o checkbox
                        contatosModel[index - 1].selectGroup = true;
                        grupos.add(contatosModel[index - 1]);
                      });
                    } else {
                      setState(() {
                        //*se o contato ja estiver selecionado com o checkbox e clicarmos nele novamente ele vai tirar o checkbox
                        contatosModel[index - 1].selectGroup = false;
                        grupos.remove(contatosModel[index - 1]);
                      });
                    }
                  },
                  child: ContatosCard(contatos: contatosModel[index - 1]));
            },
          ),
          //*Container criado para que quando clicarmos em um contato ele va para dentro desse container mostrando que ele foi selecionado
          //*operador ternario para mostrar esse container somente quando adicionarmos um contato na lista de grupo
          //*quando nao tiver contato na lista de grupo ele vai desaparecer
          grupos.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contatosModel.length,
                          itemBuilder: (context, index) {
                            //*condição para que ao clicar nos contatos ele apareã no container, mostrando que selecionamos o contato
                            if (contatosModel[index].selectGroup == true) {
                              //*InkWell para deixar o icone 'x' clicavel para podermos quando clicar no X remover o contato da seleção do grupo
                              return InkWell(
                                onTap: () {
                                  //*condição para que a hora que eu clicar no contato, removemos ele da lista de seleção do grupo
                                  setState(() {
                                    contatosModel[index].selectGroup = false;
                                    grupos.remove(contatosModel[index]);
                                  });
                                },
                                child: AvatarCardGrupo(
                                  contatos: contatosModel[index],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    Divider(
                      thickness: 1,
                    )
                  ],
                  //*fim da operação ternaria
                )
              : Container()
        ],
      ),
    );
  }
}
