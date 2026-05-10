import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _mostrarSenha = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                            "Entre com",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.changaOne(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 4
                                ..color = const Color.fromARGB(189, 1, 35, 79),
                            ),
                          ),
                          Text(
                            "Entre com",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.changaOne(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),

                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 20,
                        children: [
                          // BOTÃO FACEBOOK
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
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  0,
                                  238,
                                  123,
                                ),
                                fixedSize: const Size(147, 55),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Row(
                                // Mudamos para Row para alinhar horizontalmente
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Centraliza tudo no botão
                                children: [
                                  Image.asset(
                                    alignment: AlignmentGeometry.directional(
                                      6,
                                      9,
                                    ),
                                    'asset/images/facebook.png',
                                    height: 24,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ), // AQUI você controla o espaço entre a logo e o texto
                                  // O seu Stack de texto entra aqui como um "filho" da Row
                                  Stack(
                                    children: [
                                      Text(
                                        "Facebook",
                                        style: GoogleFonts.changaOne(
                                          fontSize: 16,
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
                                        "Facebook",
                                        style: GoogleFonts.changaOne(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // BOTÃO GOOGLE
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
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  0,
                                  238,
                                  123,
                                ),
                                fixedSize: const Size(147, 55),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),

                              child: Row(
                                // Mudamos para Row para alinhar horizontalmente
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Centraliza tudo no botão
                                children: [
                                  Image.asset(
                                    'asset/images/google.png',
                                    height: 24,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ), // AQUI você controla o espaço entre a logo e o texto
                                  // O seu Stack de texto entra aqui como um "filho" da Row
                                  Stack(
                                    children: [
                                      Text(
                                        "Google",
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
                                        "Google",
                                        style: GoogleFonts.changaOne(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 60),
                      Divider(
                        color: Color.fromARGB(
                          255,
                          87,
                          135,
                          239,
                        ), // O verde que você está usando
                        thickness: 2, // Grossura da linha
                        indent: 10, // Espaço vazio na esquerda
                        endIndent: 10, // Espaço vazio na direita
                      ),

                      const SizedBox(height: 60),

                      Stack(
                        children: [
                          Text(
                            "Endereço de email",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.changaOne(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 4
                                ..color = const Color.fromARGB(189, 1, 35, 79),
                            ),
                          ),
                          Text(
                            "Endereço de email",
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
                            child: TextField(
                              cursorColor: const Color(0xFF00EE7B),
                              style: GoogleFonts.robotoSlab(
                                color: Color.fromARGB(255, 63, 144, 251),
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                labelText: "seuNome@Exemplo.com",
                                labelStyle: GoogleFonts.robotoSlab(
                                  color: Color(0xFF00EE7B),
                                  fontSize: 17,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                filled: true,
                                fillColor: Colors.white.withValues(alpha: 0.8),
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
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      Stack(
                        children: [
                          Text(
                            "senha",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.changaOne(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 4
                                ..color = const Color.fromARGB(189, 1, 35, 79),
                            ),
                          ),
                          Text(
                            "senha",
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
                            child: TextFormField(
                              obscureText: _mostrarSenha,
                              obscuringCharacter: '*',
                              cursorColor: const Color(0xFF00EE7B),
                              style: GoogleFonts.robotoSlab(
                                color: Color.fromARGB(255, 63, 144, 251),
                                fontSize: 17,
                              ),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  icon: Icon(
                                    // Alterna o desenho do ícone baseado na variável
                                    _mostrarSenha
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: const Color(0xFF00EE7B),
                                  ),
                                  onPressed: () {
                                    // O setState avisa o Flutter para redesenhar a tela
                                    setState(() {
                                      _mostrarSenha = !_mostrarSenha;
                                    });
                                  },
                                ),
                                labelText: "Insira sua senha",
                                labelStyle: GoogleFonts.robotoSlab(
                                  color: Color(0xFF00EE7B),
                                  fontSize: 17,
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                filled: true,
                                fillColor: Colors.white.withValues(alpha: 0.8),
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
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
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
                          onPressed: () {},
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
                                "Entrar",
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
                                "Entrar",
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
            );
          },
        ),
      ),
    );
  }
}
