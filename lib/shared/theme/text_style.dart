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
  static final titleTelaCountry = GoogleFonts.openSans(    
    color: AppColors.accent,
    fontWeight: FontWeight.w700,
    wordSpacing: 1,
    fontSize: 18
  );
  static final verifyTelaCountry = GoogleFonts.openSans(        
    fontSize: 13.5
  );
  static final whatsMyNumberTelaCountry = GoogleFonts.openSans(        
    fontSize: 12.8,
    color: Colors.cyan[800]
  );
  static final paisTelaCountry = GoogleFonts.openSans(        
    fontSize: 16,    
  );
  static final countryPage = GoogleFonts.openSans(        
    color: AppColors.accent,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    wordSpacing: 1
  );
  static final countryCode = GoogleFonts.openSans(         
    fontSize: 15,   
  );
  static final countryCodeMais = GoogleFonts.openSans(         
    fontSize: 18,   
  );
  static final countryProximo = GoogleFonts.openSans(         
    fontWeight: FontWeight.w600
  );
  static final countryAlert = GoogleFonts.openSans(         
    fontSize: 14
  );
  static final countryAlertNumber = GoogleFonts.openSans(         
    fontSize: 14,
    fontWeight: FontWeight.w500 
  );
  static final otpCountry = GoogleFonts.openSans(    
    color: AppColors.accent,     
    fontSize: 16.5
  );
  static final otpCountry1 = GoogleFonts.openSans(    
    color: Colors.black, 
    fontSize: 14.5
  );
  static final otpCountry2 = GoogleFonts.openSans(    
    color: Colors.black, 
    fontSize: 14.5,
    fontWeight: FontWeight.bold
  );
  static final otpCountry3 = GoogleFonts.openSans(    
    color: AppColors.accent, 
    fontSize: 14.5
  );
}
