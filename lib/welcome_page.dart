import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_senior/cadastro_page.dart';
import 'package:tech_senior/login_page.dart';
import 'package:tech_senior/sem_conta.dart';
import 'package:tech_senior/widgets/ajustes_controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void _tocarSomClique() {
      AjustesController().tocarSomClique();
    }
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF5de0e6), Color(0xFF004aad)],
          ),
        ),

        // AJUSTE 1: Use LayoutBuilder para pegar as constraints da tela
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  // AJUSTE 2: Isso impede que o conteúdo suma
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "asset/images/logo_TechSenior.png",
                        width: 200,
                        height: 200,
                      ),

                      const SizedBox(height: 20),

                      Text(
                        "Olá! Bem vindo ao Tech Senior. Vamos aprender a usar o celular juntos!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.changaOne(
                          height: 1.5,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 4,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                          color: const Color.fromARGB(255, 0, 238, 123),
                        ),
                      ),

                      const SizedBox(height: 25),

                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          // BOTÃO ENTRAR
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(
                                    133,
                                    0,
                                    0,
                                    0,
                                  ).withValues(alpha: 0.5),
                                  spreadRadius: 1,
                                  blurRadius: 0,
                                  offset: const Offset(6, 6),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                _tocarSomClique();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  0,
                                  238,
                                  123,
                                ),
                                fixedSize: const Size(155, 60),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Text(
                                    "Entrar",
                                    style: GoogleFonts.changaOne(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 4
                                        ..color = const Color.fromARGB(
                                          189,
                                          1,
                                          35,
                                          79,
                                        ),
                                    ),
                                  ),
                                  Text(
                                    "Entrar",
                                    style: GoogleFonts.changaOne(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // BOTÃO CRIE UMA CONTA
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(
                                    133,
                                    0,
                                    0,
                                    0,
                                  ).withValues(alpha: 0.5),
                                  spreadRadius: 1,
                                  blurRadius: 0,
                                  offset: const Offset(6, 6),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                _tocarSomClique();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CadastroPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  0,
                                  238,
                                  123,
                                ),
                                fixedSize: const Size(155, 60),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Text(
                                    "Crie uma Conta",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.changaOne(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 4
                                        ..color = const Color.fromARGB(
                                          189,
                                          1,
                                          35,
                                          79,
                                        ),
                                    ),
                                  ),
                                  Text(
                                    "Crie uma Conta",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.changaOne(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),

                      // BOTÃO ACESSE SEM CONTA
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(
                                133,
                                0,
                                0,
                                0,
                              ).withValues(alpha: 0.5),
                              spreadRadius: 1,
                              blurRadius: 0,
                              offset: const Offset(6, 6),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            _tocarSomClique();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SemConta(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              0,
                              238,
                              123,
                            ),
                            fixedSize: const Size(270, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                          child: Stack(
                            children: [
                              // CAMADA 1: O contorno (fica por baixo)
                              Text(
                                "Acesse sem Conta",
                                style: GoogleFonts.changaOne(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth =
                                        4 // Grossura do contorno
                                    ..color = const Color.fromARGB(
                                      246,
                                      1,
                                      35,
                                      79,
                                    ), // Azul escuro
                                ),
                              ),
                              // CAMADA 2: O preenchimento (fica por cima)
                              Text(
                                "Acesse sem Conta",
                                style: GoogleFonts.changaOne(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // AJUSTE 3: Removi o Spacer() e usei um SizedBox para dar respiro no fim
                      const SizedBox(height: 70),
                    ], //children
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
