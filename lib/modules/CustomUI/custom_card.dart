import 'package:flutter/material.dart';
import 'package:nome_whatsclone/model/chat_model.dart';
import 'package:nome_whatsclone/modules/pages/individual_page.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({Key? key, this.chatModel}) : super(key: key);

  final ChatModel? chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => IndividualPage(chatModel: chatModel),
          ),
        );
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blueGrey,
                child:
                    Icon(chatModel!.isGroup ? (Icons.group) : (Icons.person), color: Colors.white,),
              ),
              title: Text(
                chatModel!.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.done,
                    color: Colors.grey,
                    size: 18,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    chatModel!.currentMessage,
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
              trailing: Text(chatModel!.time),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, left: 80),
              child: Divider(
                thickness: 1,
                height: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
