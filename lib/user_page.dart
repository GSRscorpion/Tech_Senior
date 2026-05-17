import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int abaSelecionanada = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'asset/images/logo_TechSenior.png',
              width: 100,
              height: 50,
              alignment: AlignmentGeometry.directional(-1, 1),
            ),

            Text(
              "Aprenda tecnologia\n no seu ritmo!",
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoSlab(
                fontWeight: FontWeight.bold,
                color: Color(0xFF00EE7B),
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
                fontSize: 18,
              ),
            ),
          ],
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
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF00EE7B),
                              Color.fromARGB(176, 94, 217, 222),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.6),
                              spreadRadius: 1,
                              blurRadius: 0,
                              offset: const Offset(4, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // 1. FOTO DE PERFIL (AVATAR)
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF5de0e6),
                                    Color(0xFF004aad),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.6),
                                    spreadRadius: 2,
                                    blurRadius: 0,
                                    offset: const Offset(1, 3),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.person_2_rounded,
                                color: Colors.white,
                                size: 100,
                              ),
                            ),
                            const SizedBox(height: 10),

                            // 2. TEXTO USUÁRIO
                            Stack(
                              children: [
                                Text(
                                  "Usuário",
                                  style: GoogleFonts.changaOne(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 4
                                      ..color = const Color(0xFF01234F),
                                  ),
                                ),
                                Text(
                                  "Usuário",
                                  style: GoogleFonts.changaOne(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),

                            // 3. BARRA AZUL INTERNA: MEU PROGRESSO
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF5de0e6),
                                    Color(0xFF004aad),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.white24,
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.emoji_events,
                                        color: Colors.amber,
                                        size: 30,
                                      ),
                                      const SizedBox(width: 6),
                                      Stack(
                                        children: [
                                          Text(
                                            "Meu progresso",
                                            style: GoogleFonts.changaOne(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              foreground: Paint()
                                                ..style = PaintingStyle.stroke
                                                ..strokeWidth = 4
                                                ..color = const Color(
                                                  0xFF01234F,
                                                ),
                                            ),
                                          ),
                                          Text(
                                            "Meu progresso",
                                            style: GoogleFonts.changaOne(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 6),
                                      Image.asset(
                                        "asset/images/whatsapp.png",
                                        height: 23,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "lições concluídas: 4/10",
                                    style: GoogleFonts.robotoSlab(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(2, 2),
                                          blurRadius: 4,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    // 1. O Container cria a borda colorida por fora
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(
                                            alpha: 0.7,
                                          ),
                                          spreadRadius: 1,
                                          offset: const Offset(2, 3),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: LinearProgressIndicator(
                                        value: 0.4,
                                        minHeight: 14,
                                        borderRadius: BorderRadius.circular(10),

                                        backgroundColor: Color(0xFF004aad),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Color(0xFF00EE7B),
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),

                            // 4. BARRA AZUL INTERNA: CONTA
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF5de0e6),
                                    Color(0xFF004aad),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white24,
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Text(
                                        "Conta",
                                        style: GoogleFonts.changaOne(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 4
                                            ..color = const Color(0xFF01234F),
                                        ),
                                      ),
                                      Text(
                                        "Conta",
                                        style: GoogleFonts.changaOne(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),

                                  // Botão Alterar Nome (Verde)
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFF00EE7B),
                                      minimumSize: Size(200, 40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Text(
                                          "Alterar nome",
                                          style: GoogleFonts.changaOne(
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 4
                                              ..color = const Color(0xFF01234F),
                                          ),
                                        ),
                                        Text(
                                          "Alterar nome",
                                          style: GoogleFonts.changaOne(
                                            fontSize: 21,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  // Botão Apagar Dados (Vermelho)
                                  ElevatedButton(
                                    
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFD32F2F),
                                      minimumSize: const Size(200, 40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Text(
                                          "Apagar meus dados \ne sair",
                                          style: GoogleFonts.changaOne(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 4
                                              ..color = const Color(0xFF01234F),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "Apagar meus dados \ne sair",
                                          style: GoogleFonts.changaOne(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                    ], //children
                  ),
                ),
              ),
            );
          },
        ),
      ),
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
          currentIndex: abaSelecionanada,
          onTap: (indice) {
            setState(() {
              abaSelecionanada = indice;
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
