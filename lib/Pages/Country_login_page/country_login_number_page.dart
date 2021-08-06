import 'package:flutter/material.dart';
import 'package:nome_whatsclone/Pages/Country_login_page/country.dart';
import 'package:nome_whatsclone/model/country_model.dart';
import 'package:nome_whatsclone/shared/theme/app_colors.dart';
import 'package:nome_whatsclone/shared/theme/text_style.dart';

class CountryNumberPage extends StatefulWidget {
  const CountryNumberPage({Key? key}) : super(key: key);

  @override
  _CountryNumberPageState createState() => _CountryNumberPageState();
}

class _CountryNumberPageState extends State<CountryNumberPage> {
  String countryName = 'Brasil';
  String countryCode = '+55';

  //*para capturar o que o usuario esta digitando nos inputs usamos esse controller
  TextEditingController _controller = TextEditingController();

  //*Widget para fazer uma linha verde
  Widget countryCards() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (builder) => CountryPage(
                  setCountryDataFunction: setCountryData,
                )));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.accent,
              width: 1.8,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                  child: Center(
                child: Text(
                  countryName,
                  style: TextStyles.paisTelaCountry,
                ),
              )),
            ),
            Icon(Icons.arrow_drop_down, color: AppColors.accent, size: 28),
          ],
        ),
      ),
    );
  }

  Widget number() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 38,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.accent,
                  width: 1.8,
                ),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  '+',
                  style: TextStyles.countryCodeMais,
                ),
                SizedBox(
                  width: 15,
                ),
                //*substring pois o countrycode tem um '+', então vamos remover ele
                Text(
                  countryCode.substring(1),
                  style: TextStyles.countryCode,
                )
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.accent,
                  width: 1.8,
                ),
              ),
            ),
            width: MediaQuery.of(context).size.width / 1.5 - 100,
            child: TextFormField(
              controller: _controller,
              cursorColor: AppColors.accent,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                //*esse border tira a cor 'azul' que é padrao ao clicar no textInput e deixa a cor que definimos a linha ali no decoration !!
                border: InputBorder.none,
                //*contentPadding é o padding da area do textInput que pode ser digitada
                contentPadding: EdgeInsets.all(8),
                hintText: 'Número de telefone',
              ),
            ),
          )
        ],
      ),
    );
  }

  void setCountryData(CountryModel countryModel) {
    setState(() {
      countryName = countryModel.name!;
      countryCode = countryModel.code!;
    });
    Navigator.of(context).pop();
  }

  //*caixa de dialogo caso eu queria editar o numero ou prosseguir
  Future<void> showDialogEdit() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //*por algum motivo desconhecido o SingleChildScrollView reduz o box criado pela column do alertDialog
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Estaremos verificando seu número de telefone: ',
                  style: TextStyles.countryAlert,
                ),
                SizedBox(height: 5),
                Text(
                  //*o controler.text vai pegar o numero digitado no TextInput e apresentar na caixa de dialogo
                  '$countryCode ${_controller.text}',
                  style: TextStyles.countryAlertNumber,
                ),
                SizedBox(height: 5),
                Text(
                  'Está tudo bem ou você gostaria de editar o número ?',
                  style: TextStyles.countryAlert,
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Editar',
                style: TextStyle(color: AppColors.accent),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Ok',
                style: TextStyle(color: AppColors.accent),
              ),
            ),
          ],
        );
      },
    );
  }

  //*caixa de dialogo caso algo estiver errado como numero de telefone incompleto ou nao conter numero
  Future<void> showDialogError() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //*por algum motivo desconhecido o SingleChildScrollView reduz o box criado pela column do alertDialog
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Número de telefone incorreto',
                  style: TextStyles.countryAlert,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Ok',
                style: TextStyle(color: AppColors.accent),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Coloque seu número de telefone',
          style: TextStyles.titleTelaCountry,
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.more_vert, color: Colors.black),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              'Whatsapp irá enviar uma mensagem sms para verificar o seu número',
              style: TextStyles.verifyTelaCountry,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Qual é o meu numero ?',
              style: TextStyles.whatsMyNumberTelaCountry,
            ),
            SizedBox(
              height: 15,
            ),
            countryCards(),
            SizedBox(
              height: 5,
            ),
            number(),
            //*esse expanded com container esta sendo usado apenas para mandar o container "Proximo" para baixo da tela
            Expanded(
              child: Container(),
            ),
            InkWell(
              onTap: () {
                if(_controller.text.length < 10){
                  showDialogError();
                } else {
                  showDialogEdit();
                }
              },
              child: Container(
                color: Colors.tealAccent[400],
                height: 40,
                width: 70,
                child: Center(
                    child: Text('Proximo', style: TextStyles.countryProximo)),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
