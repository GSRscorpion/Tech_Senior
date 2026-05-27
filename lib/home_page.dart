import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_senior/exerciciozap_page.dart';
import 'package:tech_senior/widgets/ajustes_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Pegamos o multiplicador para ajustar dinamicamente o preenchimento se necessário
    final multiplicador = AjustesController().multiplicadorFonte;
    void _tocarSomClique() {
      AjustesController().tocarSomClique();
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 24, 255, 143),
        ),
        title: Row(
          children: [
            Image.asset(
              'asset/images/logo_TechSenior.png',
              width: 100,
              height: 50,
              alignment: AlignmentGeometry.directional(-1, 1),
            ),
            Expanded(
              child: Text(
                "Aprenda tecnologia\n no seu ritmo!",
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoSlab(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF00EE7B),
                  shadows: [
                    const Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 4,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF5de0e6), Color(0xFF004aad)],
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ================= BOTÃO WHATSAPP =================
                      _buildMenuButton(
                        context: context,
                        backgroundColor: const Color.fromARGB(
                          255,
                          61,
                          209,
                          105,
                        ),
                        imageAsset: 'asset/images/whatsapp.png',
                        text: "Aprenda a mandar \náudios e fotos",
                        lessonsDone: "6",
                        lessonsTotal: "14",
                        multiplicador: multiplicador,
                        onPressed: () {
                          _tocarSomClique();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExerciciozapPage(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 35),

                      // ================= BOTÃO BANCO =================
                      _buildMenuButton(
                        context: context,
                        backgroundColor: const Color(0xFF5de0e6),
                        imageAsset: 'asset/images/banco.png',
                        text: "Crie sua conta de \nbanco com email",
                        lessonsDone: "8",
                        lessonsTotal: "12",
                        multiplicador: multiplicador,
                        onPressed: () {_tocarSomClique();},
                      ),

                      const SizedBox(height: 35),

                      // ================= BOTÃO PIX/QRCODE =================
                      _buildMenuButton(
                        context: context,
                        backgroundColor: const Color(0xFF4906d9),
                        imageAsset: 'asset/images/credito.png',
                        text: "Pague sua conta \ncom pix/qr code",
                        lessonsDone: "5",
                        lessonsTotal: "9",
                        multiplicador: multiplicador,
                        onPressed: () {_tocarSomClique();},
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Componente de botão otimizado para evitar repetição de código e aceitar fontes grandes
  Widget _buildMenuButton({
    required BuildContext context,
    required Color backgroundColor,
    required String imageAsset,
    required String text,
    required String lessonsDone,
    required String lessonsTotal,
    required double multiplicador,
    required VoidCallback onPressed,
  }) {
    return Container(
      // Largura máxima controlada pelo Container externo do grupo de botões
      constraints: const BoxConstraints(maxWidth: 280),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.7),
            spreadRadius: 1,
            offset: const Offset(3, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          // AJUSTE CHAVE: Tiramos o fixedSize e colocamos tamanhos flexíveis
          minimumSize: const Size(240, 130),
          maximumSize: const Size(
            280,
            300,
          ), // Permite o botão esticar para baixo se a fonte crescer
          overlayColor: const Color.fromARGB(255, 43, 57, 136),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        ),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Ocupa apenas o tamanho necessário na vertical
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Parte Superior: Ícone + Texto lado a lado de forma segura
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(imageAsset, height: 38, width: 38),
                const SizedBox(width: 12),
                Expanded(
                  // <--- Faz o texto saber exatamente quanto espaço ele tem antes de quebrar a linha
                  child: Stack(
                    children: [
                      Text(
                        text,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.robotoSlab(
                          fontSize: 14 * multiplicador,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = const Color(0xFF01234F),
                        ),
                      ),
                      Text(
                        text,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.robotoSlab(
                          fontSize: 14 * multiplicador,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Parte Inferior: A Barra de Lições azul ocupando espaço proporcional
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF004aad),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    spreadRadius: 0.5,
                    offset: const Offset(1, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Color.fromARGB(255, 225, 202, 0),
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Lições",
                    style: GoogleFonts.robotoSlab(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          14 *
                          (multiplicador > 1.2
                              ? 1.1
                              : 1.2), // Evita que a palavra "Lições" estoure muito a barra azul
                      shadows: [
                        const Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 2,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "$lessonsDone/$lessonsTotal",
                    style: GoogleFonts.robotoSlab(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      shadows: [
                        const Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 2,
                          color: Colors.black,
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
    );
  }
}
