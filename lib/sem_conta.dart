import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_senior/bottomnav_page.dart';
import 'package:tech_senior/home_page.dart';

class SemConta extends StatefulWidget {
  const SemConta({super.key});

  @override
  State<SemConta> createState() => _SemContaState();
}

final _formKey = GlobalKey<FormState>();
final _nomeController = TextEditingController();

class _SemContaState extends State<SemConta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 24, 255, 143)),
        title: Image.asset(
          'asset/images/logo_TechSenior.png',
          width: 100,
          height: 50,
          alignment: AlignmentGeometry.directional(-1, 1),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF5de0e6), Color(0xFF004aad)], //colors
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.5,
            colors: [
              Color.fromARGB(28, 152, 255, 214),
              Color.fromARGB(73, 0, 165, 154),
            ],
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
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 40,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Text(
                              "Qual é seu nome ?",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.changaOne(
                                fontSize: 28,
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
                              "Qual é seu nome ?",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.changaOne(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        Stack(
                          children: [
                            const SizedBox(height: 40),
                            Text(
                              "Insira seu nome",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.changaOne(
                                fontSize: 18,
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
                              "Insira seu nome",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.changaOne(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          spacing: 5,
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: _nomeController,
                                cursorColor: const Color(0xFF00EE7B),
                                style: GoogleFonts.robotoSlab(
                                  color: Color.fromARGB(255, 63, 144, 251),
                                  fontSize: 17,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Nome",
                                  labelStyle: GoogleFonts.robotoSlab(
                                    color: Color(0xFF00EE7B),
                                    fontSize: 17,
                                  ),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  filled: true,
                                  fillColor: Colors.white.withValues(
                                    alpha: 0.8,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                        255,
                                        0,
                                        238,
                                        123,
                                      ),
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 63, 144, 251),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Por favor, digite seu e-mail!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

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
                              // Valida o Form inteiro de uma só vez
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BottomnavPage(),
                                  ),
                                );
                              } else {
                                print("Campos obrigatórios vazios.");
                              }
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
                                  "Começar a aprender",
                                  style: GoogleFonts.changaOne(
                                    fontSize: 23,
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
                                  "Começar a aprender",
                                  style: GoogleFonts.changaOne(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 70),
                      ], //children
                    ),
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
