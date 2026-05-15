import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                        //BOTÃO WHATSAPP
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.7),
                              spreadRadius: 1,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              61,
                              209,
                              105,
                            ),
                            fixedSize: const Size(230, 120),
                            overlayColor: Color.fromARGB(255, 43, 57, 136),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'asset/images/whats.png',
                                    height: 43,
                                  ),
                                  const SizedBox(width: 20),
                                  Stack(
                                    children: [
                                      Text(
                                        "Aprenda a mandar \náudios e fotos",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.robotoSlab(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 3
                                            ..color = const Color(0xFF01234F),
                                        ),
                                      ),
                                      Text(
                                        "Aprenda a mandar \náudios e fotos",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.robotoSlab(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              // PARTE DE BAIXO: A Barra de Lições (Container azul)
                              Container(
                                width: 200,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 1,
                                ),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.7,
                                      ),
                                      spreadRadius: 1,
                                      offset: const Offset(2, 3),
                                    ),
                                  ],
                                  color: const Color(0xFF004aad),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      color: Color.fromARGB(255, 225, 202, 0),
                                      size: 20,
                                    ),
                                    Text(
                                      "Lições",
                                      style: GoogleFonts.robotoSlab(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      "6/14",
                                      style: GoogleFonts.robotoSlab(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),

                      Container(
                        //BOTÃO BANCO
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.7),
                              spreadRadius: 1,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF5de0e6),
                            fixedSize: const Size(230, 120),
                            overlayColor: Color.fromARGB(255, 43, 57, 136),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'asset/images/banco.png',
                                    height: 35,
                                  ),
                                  const SizedBox(width: 20),
                                  Stack(
                                    children: [
                                      Text(
                                        "Crie sua conta de \nbanco com email",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.robotoSlab(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 3
                                            ..color = const Color(0xFF01234F),
                                        ),
                                      ),
                                      Text(
                                        "Crie sua conta de \nbanco com email",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.robotoSlab(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              // PARTE DE BAIXO: A Barra de Lições (Container azul)
                              Container(
                                width: 200,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 1,
                                ),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.7,
                                      ),
                                      spreadRadius: 1,
                                      offset: const Offset(2, 3),
                                    ),
                                  ],
                                  color: const Color(0xFF004aad),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      color: Color.fromARGB(255, 225, 202, 0),
                                      size: 20,
                                    ),
                                    Text(
                                      "Lições",
                                      style: GoogleFonts.robotoSlab(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      "8/12",
                                      style: GoogleFonts.robotoSlab(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),

                      Container(
                        //BOTÃO PIX/QRCODE
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.7),
                              spreadRadius: 1,
                              offset: const Offset(2, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4906d9),
                            fixedSize: const Size(230, 120),
                            overlayColor: Color.fromARGB(255, 159, 107, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'asset/images/credito.png',
                                    height: 35,
                                  ),
                                  const SizedBox(width: 20),
                                  Stack(
                                    children: [
                                      Text(
                                        "pague sua conta \ncom pix/qr code",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.robotoSlab(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 3
                                            ..color = const Color(0xFF01234F),
                                        ),
                                      ),
                                      Text(
                                        "pague sua conta \ncom pix/qr code",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.robotoSlab(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              // PARTE DE BAIXO: A Barra de Lições (Container azul)
                              Container(
                                width: 200,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 1,
                                ),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.7,
                                      ),
                                      spreadRadius: 1,
                                      offset: const Offset(2, 3),
                                    ),
                                  ],
                                  color: const Color(0xFF004aad),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      color: Color.fromARGB(255, 225, 202, 0),
                                      size: 20,
                                    ),
                                    Text(
                                      "Lições",
                                      style: GoogleFonts.robotoSlab(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Text(
                                      "5/9",
                                      style: GoogleFonts.robotoSlab(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
