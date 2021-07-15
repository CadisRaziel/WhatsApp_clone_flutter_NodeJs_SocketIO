
import 'package:flutter/material.dart';
import 'package:nome_whatsclone/Pages/chat_page.dart';
import 'package:nome_whatsclone/shared/theme/app_colors.dart';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      theme: ThemeData(        
        primaryColor: AppColors.primary,
        accentColor: AppColors.accent
      ),
     debugShowCheckedModeBanner: false,
     home: HomeScreen(),     
    );
  }
}