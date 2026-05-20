import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  int abaSelecionanada = 0;
  bool sonsAtivados = true;
  double valorTexto = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 24, 255, 143),),
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
                              Color.fromARGB(235, 94, 218, 222),
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
                            // ICONE CONFIGURAR
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
                                Icons.settings,
                                color: Colors.white,
                                size: 100,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Stack(
                              children: [
                                Text(
                                  "Ajustes",
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
                                  "Ajustes",
                                  style: GoogleFonts.changaOne(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),

                            // 3. BARRA AZUL INTERNA FONTE
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
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
                                  color: const Color(0xFF01234F),
                                  width: 2,
                                ),
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
                                  Wrap(
                                    children: [
                                      const Icon(
                                        Icons.text_fields,
                                        color: Color.fromARGB(255, 0, 255, 132),
                                        size: 33,
                                      ),
                                      const SizedBox(width: 8),
                                      Stack(
                                        children: [
                                          Text(
                                            "Tamanho do Texto",
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
                                            "Tamanho do Texto",
                                            style: GoogleFonts.changaOne(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // Envolva o Slider com o SliderTheme para mudar a grossura e o formato
                                  SliderTheme(
                                    data: SliderTheme.of(context).copyWith(
                                      // AQUI ESTÁ O SEGREDO: Define a grossura da barra (padrão é 4, 12 a 16 fica excelente)
                                      trackHeight: 14.0,

                                      // Deixa os cantos da barra arredondados (igual à sua barra de progresso)
                                      trackShape:
                                          const RoundedRectSliderTrackShape(),

                                      // Aumenta um pouquinho o tamanho da bolinha verde que o usuário arrasta
                                      thumbShape: const RoundSliderThumbShape(
                                        enabledThumbRadius: 12.0,
                                      ),

                                      // Tira aquela bordinha/sombra cinza padrão que aparece quando clica na bolinha
                                      overlayShape:
                                          const RoundSliderOverlayShape(
                                            overlayRadius: 0.0,
                                          ),
                                    ),
                                    child: Slider(
                                      value: valorTexto,
                                      min: 0,
                                      max: 2,
                                      divisions:
                                          2, // Trava nos 3 pontos do seu protótipo (Pequeno, Médio, Grande)
                                      // Suas cores personalizadas
                                      activeColor: const Color(0xFF00EE7B),
                                      inactiveColor: Colors
                                          .white, // Parte vazia (Azul Escuro)
                                      thumbColor: const Color(0xFF00EE7B),

                                      onChanged: (double novoValor) {
                                        setState(() {
                                          valorTexto = novoValor;
                                        });
                                      },
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Text(
                                        textAlign: TextAlign.center,
                                        "Ajustar para pequeno/medio/grande",
                                        style: GoogleFonts.changaOne(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 4
                                            ..color = const Color(0xFF01234F),
                                        ),
                                      ),
                                      Text(
                                        textAlign: TextAlign.center,
                                        "Ajustar para pequeno/medio/grande",
                                        style: GoogleFonts.changaOne(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),

                            // 3. BARRA AZUL INTERNA SOM
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
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.6),
                                    spreadRadius: 1,
                                    blurRadius: 0,
                                    offset: const Offset(4, 5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.white24,
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Wrap(
                                    children: [
                                      const Icon(
                                        Icons.volume_up,
                                        color: Color.fromARGB(255, 0, 255, 132),
                                        size: 33,
                                      ),
                                      const SizedBox(width: 6),
                                      Stack(
                                        children: [
                                          Text(
                                            "Sons do Aplicativo",
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
                                            "Sons do Aplicativo",
                                            style: GoogleFonts.changaOne(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 6),
                                    ],
                                  ),

                                  SwitchListTile(
                                    subtitle: Stack(
                                      children: [
                                        Text(
                                          "Ligar\nDesligar",
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
                                          "Ligar\nDesligar",
                                          style: GoogleFonts.changaOne(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Configuração das cores do Switch no estilo do seu app
                                    activeThumbColor: Color(0xFF00EE7B),
                                    activeTrackColor: Color.fromARGB(
                                      255,
                                      6,
                                      199,
                                      158,
                                    ),
                                    inactiveThumbColor: Color(0xFF01234F),
                                    inactiveTrackColor: Color.fromARGB(
                                      255,
                                      2,
                                      62,
                                      146,
                                    ),
                                    trackOutlineColor:
                                        WidgetStateProperty.resolveWith<
                                          Color?
                                        >((Set<WidgetState> states) {
                                          // Não importa se está ativo, focado ou pressionado, a borda sempre será o cinza escuro
                                          return Colors.white;
                                        }),

                                    value: sonsAtivados,
                                    onChanged: (bool valorNovo) {
                                      // O setState muda a chavinha de lado na tela na hora!
                                      setState(() {
                                        sonsAtivados = valorNovo;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),

                            // 4. BARRA AZUL INTERNA: AJUDA
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
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.6),
                                    spreadRadius: 1,
                                    blurRadius: 0,
                                    offset: const Offset(4, 5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.white24,
                                  width: 2,
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Wrap(
                                  children: [
                                    Icon(
                                      Icons.live_help_rounded,
                                      color: Color.fromARGB(255, 0, 255, 132),
                                      size: 33,
                                    ),
                                    const SizedBox(width: 3),
                                    Stack(
                                      children: [
                                        Text(
                                          "Dúvidas e Ajuda",
                                          style: GoogleFonts.changaOne(
                                            fontSize: 24,
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
                                          "Dúvidas e Ajuda",
                                          style: GoogleFonts.changaOne(
                                            fontSize: 24,
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
    );
  }
}
