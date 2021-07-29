import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nome_whatsclone/model/chat_model.dart';
import 'package:nome_whatsclone/model/mensagem_model.dart';
import 'package:nome_whatsclone/modules/CustomUI/custom_mensagemEnviada_card.dart';
import 'package:nome_whatsclone/modules/CustomUI/custom_mensagemRecebida_card.dart';
import 'package:nome_whatsclone/shared/theme/app_colors.dart';
import 'package:nome_whatsclone/shared/theme/app_images.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, this.chatModel, this.sourceChatIndividual})
      : super(key: key);

  final ChatModel? sourceChatIndividual;

  //* usamos o chatModel aqui para passar como parametro na rota do 'custom_card' no navigator.push
  //* como na tela 'custom_card' é um stateless e a variavel final chatModel esta la, quando passamos para ca no statefull devemos por um widget antes
  final ChatModel? chatModel;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  bool sendButton = false;
  IO.Socket? socket;
  FocusNode focusNode = FocusNode();
  List<MessageModel> messages = [];
  ScrollController _scrollController = ScrollController();

  @override
//!cuidado ao escrever initState (eu havia escrito initStat e com isso ele não iniciava nada !!
  void initState() {
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          emojiShowing = false;
        });
      }
    });
    // connect();
  }

//! vera que criamos varias variaveis 'source' cada arquivo tem seu nome 'sourceChatHome'
//! o motivo disso é para conseguirmos criar multiplos clientes para podermos testarmos sozinhos o envio e recebimento de mensage
//! repare que no nodejs incluimos isso !

  //*abrindo conexão com o ip do wifi
  void connect() {
    socket = IO.io('http://192.168.15.9:5000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();
    socket!.emit('entrar', widget.sourceChatIndividual!.id);
    socket!.onConnect((data) {
      print('conectado');
      socket!.on('message', (msg) {
        print(msg);
        setMessage("destination", msg["message"]);
        //*quando recebermos a mensagem elas vao subindo e deixando as mais recentes na tela, o _scrollController.animateTo é reponsavel por isso !
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    });
    print(socket!.connected);
  }

  //*enviar mensagens
  void sendMenssage(String message, int sourceId, int targetId) {
    //*passando a função'setMessage' que armazena as mensagens aqui dentro para elas serem apresentadas
    setMessage("source", message);
    socket!.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  //*função para armazenar as mensagens para poder apresenta-las(vamos colocar o setMessage no backend 'sendMessage')
  void setMessage(String typee, String messagee) {
    MessageModel messageModel = MessageModel(
        type: typee,
        mesage: messagee,
        time: DateTime.now().toString().substring(10, 16));
    setState(() {
      messages.add(messageModel);
    });
  }

//*_onEmojiSelected, _onBackspacePressed = controlam os emojis quando selecionado
  _onEmojiSelected(Emoji emoji) {
    _controller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  //* emojiSelected = precisei colocar em uma função pois no código abaixo não entrava como um widget comunm
  //* emojiSelected = tem a configuração da tela de emojis

  Widget emojiSelected() {
    return Offstage(
      offstage: !emojiShowing,
      child: SizedBox(
        height: 250,
        child: EmojiPicker(
            onEmojiSelected: (Category category, Emoji emoji) {
              _onEmojiSelected(emoji);
            },
            onBackspacePressed: _onBackspacePressed,
            config: Config(
                columns: 7,
                emojiSizeMax: 32.0,
                verticalSpacing: 0,
                horizontalSpacing: 0,
                initCategory: Category.RECENT,
                bgColor: Color(0xFFF2F2F2),
                indicatorColor: AppColors.accent,
                iconColor: AppColors.accent,
                iconColorSelected: Colors.blueGrey,
                progressIndicatorColor: AppColors.accent,
                backspaceColor: AppColors.accent,
                showRecentsTab: true,
                recentsLimit: 28,
                noRecentsText: 'Você não tem emoji recente',
                noRecentsStyle: TextStyle(fontSize: 20, color: Colors.black26),
                categoryIcons: CategoryIcons(),
                buttonMode: ButtonMode.MATERIAL)),
      ),
    );
  }

  //*Widget do IconButton clips
  Widget bottomClips() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          //*SingleChildScrollView = para a hora de rotacionar ele nao quebre a tela por conta do tamanho do container
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    iconCreationClips(
                      icon: Icons.insert_drive_file,
                      color: Colors.indigo,
                      text: 'Documento',
                    ),
                    iconCreationClips(
                      icon: Icons.camera_alt,
                      color: Colors.pink,
                      text: 'Câmera',
                    ),
                    iconCreationClips(
                      icon: Icons.insert_photo,
                      color: Colors.purple,
                      text: 'Galeria',
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    iconCreationClips(
                      icon: Icons.headset,
                      color: Colors.orange,
                      text: 'Áudio',
                    ),
                    iconCreationClips(
                      icon: Icons.location_pin,
                      color: Colors.teal,
                      text: 'Localização',
                    ),
                    iconCreationClips(
                      icon: Icons.person,
                      color: Colors.blue,
                      text: 'Contato',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //*Icones para o IconButton clips
  //*Repare que a partir dos parametros que insereimos, a hora que instacimaos ali em cima,
  //*é só colocar o que queremos, isso evita a criação de varias e varias funções para a mesma finalidade
  //*repare como uso os parametros abaixo, e repare como eu os coloco ali em cima quando eu instancio a função
  Widget iconCreationClips({IconData? icon, Color? color, String? text}) {
    return Column(
      children: [
        //*Colocar esse inkwell depois apenas no 'icon'
        InkWell(
          onTap: () {},
          child: CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          text!,
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.papelDeParede,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 70,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                    child: Icon(widget.chatModel!.isGroup
                        ? (Icons.group)
                        : (Icons.person)),
                  ),
                ],
              ),
            ),
            title: InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatModel!.name,
                      style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Visto por último as 12:10',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.videocam),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.call),
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
                      child: Text('Ver contato'),
                      value: 'Ver contato',
                    ),
                    PopupMenuItem(
                      child: Text('Mídia, links e docs'),
                      value: 'Mídia, links e docs',
                    ),
                    PopupMenuItem(
                      child: Text('Pesquisar'),
                      value: 'Pesquisar',
                    ),
                    PopupMenuItem(
                      child: Text('Silenciar notificações'),
                      value: 'Silenciar notificações',
                    ),
                    PopupMenuItem(
                      child: Text('Papel de parede'),
                      value: 'Papel de parede',
                    ),
                  ];
                },
              ),
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
                child: Column(                  
                  children: [
                    //*vamos adicionar as conversas aqui no ListView
                    Expanded(
                      //* -143 para que as mensagens ao rolar nao fique atras da caixa de texto(textFormField), elas sumam ao chegar nela
                      // height: MediaQuery.of(context).size.height - 143,
                      child: ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemCount: messages.length + 1,
                        itemBuilder: (context, index) {
                          if (index == messages.length) {
                            return Container(
                              height: 70,
                            );
                          }
                          if (messages[index].type == "source") {
                            return MensagemEnviadaCard(
                              message: messages[index].mesage,
                              time: messages[index].time,
                            );
                          } else {
                            return MensagemRecebidaCard(
                              message: messages[index].mesage,
                              time: messages[index].time,
                            );
                          }
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        //! corrigir esse height, pois ele nao abre o teclado de emojis !!!
                        height: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,                          
                          children: [
                            Row(
                              children: [
                                Container(
                                  //* -55 para ele aparecer na tela, va testando !!
                                  width: MediaQuery.of(context).size.width - 55,
                                  //* repare que com o 'Card' eu tenho o mesmo resultado do InputDecoration, porém fora do TextFormField !!
                                  child: Card(
                                    margin: EdgeInsets.only(
                                        left: 5, right: 2, bottom: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: TextFormField(
                                      focusNode: focusNode,
                                      controller: _controller,
                                      //*onChanged = se eu digitar algo vai aparecer o icone para enviar, se eu nao digitar o icone de mandar audio permanece
                                      onChanged: (value) {
                                        if (value.length > 0) {
                                          setState(() {
                                            sendButton = true;
                                          });
                                        } else {
                                          setState(() {
                                            sendButton = false;
                                          });
                                        }
                                      },
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 5,
                                      minLines: 1,
                                      decoration: InputDecoration(
                                        //*o InputBorder.none tira aquela linha do InputDecoratio aonde indica para digitar o texto
                                        border: InputBorder.none,
                                        hintText: 'Digite uma mensagem',
                                        contentPadding: EdgeInsets.all(5),
                                        prefixIcon: IconButton(
                                          icon: Icon(
                                            Icons.emoji_emotions_outlined,
                                            color: Colors.grey,
                                          ),
                                          onPressed: () {
                                            //*o focusnode vai fazer que quando clicarmos no botão de emotion, o teclado não abra !!!
                                            focusNode.unfocus();
                                            focusNode.canRequestFocus = false;
                                            setState(() {
                                              emojiShowing = !emojiShowing;
                                            });
                                          },
                                        ),
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                //* showModalBottomSheet = é do proprio flutter, e abre uma caixa de dialogo
                                                //* por cima da tela atual, mostrando icones ou coisa que queremos, e deixando a tela de traz sem foco e escura clara
                                                //*podemos criar uma função de Widget e colocar o que quisermos dentro
                                                showModalBottomSheet(
                                                    //! colocamos a backgroundColor aqui para tirar a cor de fundo do container, e ficar somente a do card
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (builder) =>
                                                        bottomClips());
                                              },
                                              icon: Icon(
                                                Icons.attach_file,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.camera_alt,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: AppColors.accent,
                                    child: IconButton(
                                      onPressed: () {
                                        //*operação para envio e recebimento de mensagem
                                        if (sendButton) {
                                          //*quando enviarmos mensagem elas vao subindo e deixando as mais recentes na tela, o _scrollController.animateTo é reponsavel por isso !
                                          _scrollController.animateTo(
                                            _scrollController
                                                .position.maxScrollExtent,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeOut,
                                          );
                                          sendMenssage(
                                            _controller.text,
                                            widget.sourceChatIndividual!.id!,
                                            widget.chatModel!.id!,
                                          );
                                          //*quando enviar a mensagem ele vai limpar o inputtext
                                          _controller.clear();
                                          setState(() {
                                            //*quando digitarmos e apertar para enviar ele volta a aparecer o icone do microfone
                                            sendButton = false;
                                          });
                                        }
                                      },
                                      icon: Icon(
                                        //*condição do onChanged do textInput se o usuario digitar aparece o icone de enviar se ele nao digitar aparece o icone de mandar audio
                                        sendButton ? Icons.send : Icons.mic,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            emojiShowing ? emojiSelected() : Container()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                //* para evitar que quando arrastarmos a tela para sair do teclado ou do teclado de emoji, ele não vai sair da tela de conversa
                //* ele vai sair apenas dos teclados
                onWillPop: () {
                  if (emojiShowing) {
                    setState(() {
                      emojiShowing = false;
                    });
                  } else {
                    Navigator.pop(context);
                  }
                  return Future.value(false);
                }),
          ),
        ),
      ],
    );
  }
}
