import 'package:flutter/material.dart';
import 'package:tech_senior/config_page.dart';
import 'package:tech_senior/home_page.dart';
import 'package:tech_senior/user_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_senior/widgets/ajustes_controller.dart';

class BottomnavPage extends StatefulWidget {
  const BottomnavPage({super.key});

  @override
  State<BottomnavPage> createState() => _BottomnavPageState();
}

class _BottomnavPageState extends State<BottomnavPage> {
  int abaSelecionada = 1;
  void _tocarSomClique() {
      AjustesController().tocarSomClique();
    }


  final List<Widget> _paginas = [
    const UserPage(),
    const HomePage(),
    const ConfigPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[abaSelecionada],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF5de0e6), Color(0xFF004aad)], //colors
          ),
        ),
        child: BottomNavigationBar(
          iconSize: 30,
          selectedLabelStyle: GoogleFonts.robotoSlab(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 4,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
          unselectedLabelStyle: GoogleFonts.robotoSlab(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 4,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          selectedItemColor: Color(0xFF00EE7B),
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: abaSelecionada,
          onTap: (indice) {_tocarSomClique();
            setState(() {
              abaSelecionada = indice;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_sharp,
                size: 35,
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
              label: "Perfil",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
              label: "Inicio",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 35,
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
              ),
              label: "Ajustes",
            ),
          ],
        ),
      ),
    );
  }
}