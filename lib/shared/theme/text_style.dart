import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nome_whatsclone/shared/theme/app_colors.dart';

class TextStyles {
  static final title = GoogleFonts.openSans();

  static final titleTab =
      GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold);

  static final titleItalic = GoogleFonts.openSans(
    fontStyle: FontStyle.italic,
    fontSize: 16,
  );
  static final titleBold = GoogleFonts.openSans(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static final titleContatos = GoogleFonts.openSans(
    fontWeight: FontWeight.w600,
    fontSize: 19,
  );
  static final subTitleContatos = GoogleFonts.openSans(
    fontSize: 13,
  );
  static final status =
      GoogleFonts.openSans(fontWeight: FontWeight.bold, color: Colors.black);
  static final substatus =
      GoogleFonts.openSans(fontSize: 13, color: Colors.grey[900]);
  static final updateStatus = GoogleFonts.openSans(
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );
  static final outrosStatus = GoogleFonts.openSans(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static final horaStatus = GoogleFonts.openSans(
    fontSize: 14,
    color: Colors.grey[900],
  );
  static final telalInicial = GoogleFonts.openSans(
    fontSize: 29,
    color: AppColors.accent,
    fontWeight: FontWeight.w600,
  );
  static final subt1elalInicial = GoogleFonts.openSans(
    fontSize: 17,
    color: Colors.black,
  );
  static final subt2elalInicial = GoogleFonts.openSans(
    fontSize: 17,
    color: AppColors.accent,
  );
  static final buttonTelalInicial = GoogleFonts.openSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
