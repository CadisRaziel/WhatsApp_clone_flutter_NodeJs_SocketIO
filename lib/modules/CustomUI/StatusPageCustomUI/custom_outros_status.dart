import 'dart:math';

import 'package:flutter/material.dart';

import 'package:nome_whatsclone/shared/theme/text_style.dart';

class OutrosStatus extends StatelessWidget {
  const OutrosStatus({
    Key? key,
    this.name,
    this.time,
    this.imageName,
    this.isSeen1,
    this.statusNum1,
  }) : super(key: key);

  final String? name;
  final String? time;
  final String? imageName;
  final bool? isSeen1;
  final int? statusNum1;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //*com o CustomPaint e a classe Statusverde conseguimos colocar o circulo verde para mostrar que o status não foi visto
      leading: CustomPaint(
        painter: StatusVerde(isSeen: isSeen1, statusNum: statusNum1),
        child: CircleAvatar(
          radius: 26,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(imageName!),
        ),
      ),
      title: Text(
        name!,
        style: TextStyles.outrosStatus,
      ),
      subtitle: Text(
        'Hoje ${time!}',
        style: TextStyles.horaStatus,
      ),
    );
  }
}

//* as funlçoes e classe abaixo são para construir o circulo verde em volta da foto de status

double degreeToAngle(double degree) {
  return degree * pi / 180;
}

class StatusVerde extends CustomPainter {
  bool? isSeen;
  int? statusNum;

  StatusVerde({this.isSeen, this.statusNum});

  @override
  void paint(Canvas canvas, Size size) {
    //*Repare nessa instancia da classe paint como eu estou fazendo
    //  final Paint paint = Paint();
    //  paint.isAntiAlias = true;
    //  paint.strokeWidth = 5.0;
    //  paint.color = Color(0xFF21bfa6);
    //  paint.style = PaintingStyle.stroke;

    //*Agora repare nessa intancia da classe paint como eu fiz mais facil com o metodo cascata (..)
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 5.0
      ..color = isSeen! ? Colors.grey : Color(0xFF21BFA6)
      ..style = PaintingStyle.stroke;
    drawCirculo(canvas, size, paint);
  }

  void drawCirculo(Canvas canvas, Size size, Paint paint) {
    //desenhando o circulo verde
    //*a condição abaixo vai fazer o seguinte
    //*colocaremos um ID em cada usuario (statusNum) e com isso nos vamos cortar o circulo verde de acordo com seu numero ID
    //*o 1 vai ter o circulo completo
    //* o 2 vai ter o circulo divido em 2
    //* o 3 vai ter o circulo divido em 3 e por ai vai

    //*caso nao quisermos isso é só a gente colocar apenas esse codigo nessa classe
    // canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
    //       degreeToAngle(0), degreeToAngle(360), false, paint);

    if (statusNum == 1) {
      canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreeToAngle(0), degreeToAngle(360), false, paint);
    }

    {
      double degree = -90;
      double arc = 360 / statusNum!;
      for (int i = 0; i < statusNum!; i++) {
        canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            degreeToAngle(degree + 4), degreeToAngle(arc - 8), false, paint);
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
