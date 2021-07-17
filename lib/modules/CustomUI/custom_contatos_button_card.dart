import 'package:flutter/material.dart';
import 'package:nome_whatsclone/shared/theme/app_colors.dart';


//*criado para fazer os 2 icones na pagina de contatos que é 'Novo grupo' 'Novo Contato'
//* precisamos fazer isso para deixar dois botoes separados da lista de contatos !
class ContatoButton extends StatelessWidget {
  const ContatoButton({
    Key? key,
    this.name,
    this.icon,
  }) : super(key: key);
  final String? name;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        backgroundColor: AppColors.buttonColor,
        child: Icon(icon, color: Colors.white, size: 26 ,),
      ),
      title: Text(
        name!,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
