import 'package:flutter/material.dart';
import 'package:nome_whatsclone/shared/theme/app_colors.dart';
import 'package:nome_whatsclone/shared/theme/text_style.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpPageSMS extends StatefulWidget {
  const OtpPageSMS({
    Key? key,
    required this.numberOTP,
    required this.countryCodeOTP,
  }) : super(key: key);

  //*quando a variavel aqui esta fora da class '_OtpPageSMSSTATE' temos que usar o 'widget' para acessa-la
  final String numberOTP;
  final String countryCodeOTP;

  @override
  _OtpPageSMSState createState() => _OtpPageSMSState();
}

class _OtpPageSMSState extends State<OtpPageSMS> {
  //*repare nesse widget, precisamos usar ele em dois lugares porém o que muda é o texto e o icone
  //*repare que ao passar parametros nos substituimos o text e o icon
  //*com isso ao instanciar no codigo la em baixo ele vai pedir como parametro text e icon e la nos colocamos o que queremos
  Widget reenviarLigar({required String text, required IconData icon}) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.accent,
          size: 24,
        ),
        SizedBox(
          width: 25,
        ),
        Text(
          text,
          style: TextStyles.otpCountry3,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Verificando ${widget.countryCodeOTP} ${widget.numberOTP}',
          style: TextStyles.otpCountry,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: AppColors.accent,
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: 'Enviamos um SMS com um código para o número ',
                      style: TextStyles.otpCountry1),
                  TextSpan(
                      text: '${widget.countryCodeOTP} ${widget.numberOTP} ',
                      style: TextStyles.otpCountry2),
                  TextSpan(
                      text: 'Número errado?', style: TextStyles.otpCountry3),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            //*Package OTP_TEXT_FIELD, na documentação o codigi abaixo ja esta pronto
            OTPTextField(
              keyboardType: TextInputType.number,
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 30,
              style: TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Center(
                child: Text(
                  'Coloque o código de 6 digitos',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            reenviarLigar(
              text: 'Reenviar SMS',
              icon: Icons.message,
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: 15,
            ),
            reenviarLigar(
              text: 'Me ligue',
              icon: Icons.phone,
            )
          ],
        ),
      ),
    );
  }
}
