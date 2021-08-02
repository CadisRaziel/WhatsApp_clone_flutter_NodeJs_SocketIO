import 'package:flutter/material.dart';
import 'package:nome_whatsclone/shared/theme/app_colors.dart';
import 'package:nome_whatsclone/shared/theme/app_images.dart';
import 'package:nome_whatsclone/shared/theme/text_style.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                'Bem-vindo ao WhatsApp',
                style: TextStyles.telalInicial,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              Image.asset(
                AppImages.telaInicial,
                color: AppColors.accent,
                height: 340,
                width: 340,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              //* RichText -> para atribuir duas cores para uma unica frase
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  //*esse primeiro TextStyle é para a primeira frase 'Concorde e continue aceitando os'
                  text: TextSpan(style: TextStyles.subt1elalInicial, children: [
                    TextSpan(
                        text: 'Concorde e continue aceitando os ',
                        style: TextStyle(color: Colors.grey[600])),
                    TextSpan(
                      text:
                          'Termos de Serviço e Política de Privacidade do WhatsApp',
                      style: TextStyles.subt2elalInicial,
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width - 110,
                  height: 50,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    elevation: 8,
                    color: AppColors.buttonColor,
                    child: Center(
                      child: Text(
                        'CONCORDAR E CONTINUAR',
                        style: TextStyles.buttonTelalInicial,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
