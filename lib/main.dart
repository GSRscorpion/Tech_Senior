import 'package:flutter/material.dart';
import 'welcome_page.dart';
void main(){
runApp(AppTechSenior());
}

class AppTechSenior extends StatelessWidget {
  const AppTechSenior({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Senior',
      home: WelcomePage(),
    );
  }
}