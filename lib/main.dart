import 'package:flutter/material.dart';
//import 'package:tech_senior/exerciciozap_page.dart';
//import 'package:tech_senior/bottomnav_page.dart';
//import 'package:tech_senior/config_page.dart';
//import 'package:tech_senior/home_page.dart';
//import 'package:tech_senior/user_page.dart';
//import 'package:tech_senior/cadastro_page.dart';
//import 'package:tech_senior/login_page.dart';
//import 'package:tech_senior/sem_conta.dart';
import 'welcome_page.dart';
void main(){
runApp(AppTechSenior());
}

class AppTechSenior extends StatelessWidget {
  const AppTechSenior({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech Senior',
      home: WelcomePage(),
      theme: ThemeData(
        primaryColor: const Color(0xFF00EE7B),
        splashColor: Colors.transparent, // Remove o efeito de clique em tudo
        highlightColor: Colors.transparent,
      ),
    );
  }
}