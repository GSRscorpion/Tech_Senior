import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_senior/widgets/ajustes_controller.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  int abaSelecionanada = 0;
  
  // Instância do seu Gerenciador Global
  final _ajustesController = AjustesController();

  // Função para abrir a área de suporte simples e direta (Requisito do sistema)
  void _mostrarModalAjuda(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Color(0xFF01234F), width: 2),
          ),
          backgroundColor: const Color(0xFF5de0e6),
          title: Row(
            children: [
              const Icon(Icons.live_help_rounded, color: Color(0xFF01234F), size: 30),
              const SizedBox(width: 10),
              Text(
                "Central de Ajuda",
                style: GoogleFonts.changaOne(
                  fontSize: 24,
                  color: const Color(0xFF01234F),
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _itemSuporte(
                  context,
                  icon: Icons.text_fields,
                  titulo: "Tamanho do Texto",
                  descricao: "Arraste a barra para a direita para aumentar as letras do aplicativo se tiver dificuldade para ler.",
                ),
                const Divider(color: Colors.white38),
                _itemSuporte(
                  context,
                  icon: Icons.volume_up,
                  titulo: "Sons do Aplicativo",
                  descricao: "Deixe ativado para ouvir estalos ao clicar nos botões e uma música de parabéns ao acertar as tarefas.",
                ),
                const Divider(color: Colors.white38),
                _itemSuporte(
                  context,
                  icon: Icons.touch_app,
                  titulo: "Como jogar?",
                  descricao: "Leia a barra verde no topo de cada exercício. Ela diz exatamente o que você deve clicar para avançar.",
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF004aad),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                _ajustesController.tocarSomClique();
                Navigator.pop(context);
              },
              child: Text(
                "Entendi !",
                style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
  }

  // Widget auxiliar para deixar a explicação simples e visual
  Widget _itemSuporte(BuildContext context, {required IconData icon, required String titulo, required String descricao}) {
    double multiplicador = _ajustesController.multiplicadorFonte;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF004aad), size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: GoogleFonts.robotoSlab(
                    fontWeight: FontWeight.bold,
                    fontSize: 16 * multiplicador,
                    color: const Color(0xFF01234F),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  descricao,
                  style: GoogleFonts.robotoSlab(
                    fontSize: 14 * multiplicador,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // O AnimatedBuilder reconstrói a tela sempre que o Slider ou o Switch mudarem no Controller
    return AnimatedBuilder(
      animation: _ajustesController,
      builder: (context, child) {
        // Pega o multiplicador de tamanho atual (0.8, 1.0 ou 1.3)
        double multiplicador = _ajustesController.multiplicadorFonte;

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            iconTheme: const IconThemeData(color: Color.fromARGB(255, 24, 255, 143)),
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
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                                // ÍCONE CONFIGURAR
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF5de0e6), Color(0xFF004aad)],
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
                                        fontSize: 24 * multiplicador, // Dinâmico!
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
                                        fontSize: 24 * multiplicador, // Dinâmico!
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),

                                // 1. CARD INTERNO: TAMANHO DO TEXTO
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF5de0e6), Color(0xFF004aad)],
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
                                        alignment: WrapAlignment.center,
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
                                                  fontSize: 24 * multiplicador,
                                                  fontWeight: FontWeight.bold,
                                                  foreground: Paint()
                                                    ..style = PaintingStyle.stroke
                                                    ..strokeWidth = 4
                                                    ..color = const Color(0xFF01234F),
                                                ),
                                              ),
                                              Text(
                                                "Tamanho do Texto",
                                                style: GoogleFonts.changaOne(
                                                  fontSize: 24 * multiplicador,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          trackHeight: 14.0,
                                          trackShape: const RoundedRectSliderTrackShape(),
                                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                                          overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
                                        ),
                                        child: Slider(
                                          // Conectado com as variáveis globais do seu Controller
                                          value: _ajustesController.tamanhoTextoSlider,
                                          min: 0,
                                          max: 2,
                                          divisions: 2,
                                          activeColor: const Color(0xFF00EE7B),
                                          inactiveColor: Colors.white,
                                          thumbColor: const Color(0xFF00EE7B),
                                          onChanged: (double novoValor) {
                                            _ajustesController.tamanhoTextoSlider = novoValor;
                                            _ajustesController.tocarSomClique(); // Toca som ao arrastar
                                          },
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Text(
                                            _obterTextoEtiqueta(_ajustesController.tamanhoTextoSlider),
                                            style: GoogleFonts.changaOne(
                                              fontSize: 20 * multiplicador,
                                              fontWeight: FontWeight.bold,
                                              foreground: Paint()
                                                ..style = PaintingStyle.stroke
                                                ..strokeWidth = 4
                                                ..color = const Color(0xFF01234F),
                                            ),
                                          ),
                                          Text(
                                            _obterTextoEtiqueta(_ajustesController.tamanhoTextoSlider),
                                            style: GoogleFonts.changaOne(
                                              fontSize: 20 * multiplicador,
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

                                // 2. CARD INTERNO: SOM DO APLICATIVO
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF5de0e6), Color(0xFF004aad)],
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
                                        alignment: WrapAlignment.center,
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
                                                  fontSize: 24 * multiplicador,
                                                  fontWeight: FontWeight.bold,
                                                  foreground: Paint()
                                                    ..style = PaintingStyle.stroke
                                                    ..strokeWidth = 4
                                                    ..color = const Color(0xFF01234F),
                                                ),
                                              ),
                                              Text(
                                                "Sons do Aplicativo",
                                                style: GoogleFonts.changaOne(
                                                  fontSize: 24 * multiplicador,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SwitchListTile(
                                        subtitle: Stack(
                                          children: [
                                            Text(
                                              _ajustesController.sonsAtivos ? "Ligado" : "Desligado",
                                              style: GoogleFonts.changaOne(
                                                fontSize: 24 * multiplicador,
                                                fontWeight: FontWeight.bold,
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 4
                                                  ..color = const Color(0xFF01234F),
                                              ),
                                            ),
                                            Text(
                                              _ajustesController.sonsAtivos ? "Ligado" : "Desligado",
                                              style: GoogleFonts.changaOne(
                                                fontSize: 24 * multiplicador,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        activeThumbColor: const Color(0xFF00EE7B),
                                        activeTrackColor: const Color.fromARGB(255, 6, 199, 158),
                                        inactiveThumbColor: const Color(0xFF01234F),
                                        inactiveTrackColor: const Color.fromARGB(255, 2, 62, 146),
                                        trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((states) => Colors.white),
                                        // Conectado com o Controller Global
                                        value: _ajustesController.sonsAtivos,
                                        onChanged: (bool valorNovo) {
                                          _ajustesController.sonsAtivos = valorNovo;
                                          if (valorNovo) _ajustesController.tocarSomClique();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15),

                                // 3. CARD INTERNO: BOTÃO DINÂMICO DE DÚVIDAS E AJUDA
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF5de0e6), Color(0xFF004aad)],
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
                                    // AÇÃO DO BOTÃO TOTALMENTE FUNCIONAL AGORA
                                    onPressed: () {
                                      _ajustesController.tocarSomClique();
                                      _mostrarModalAjuda(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.live_help_rounded,
                                          color: Color.fromARGB(255, 0, 255, 132),
                                          size: 33,
                                        ),
                                        const SizedBox(width: 8),
                                        Stack(
                                          children: [
                                            Text(
                                              "Dúvidas e Ajuda",
                                              style: GoogleFonts.changaOne(
                                                fontSize: 24 * multiplicador,
                                                fontWeight: FontWeight.bold,
                                                foreground: Paint()
                                                  ..style = PaintingStyle.stroke
                                                  ..strokeWidth = 4
                                                  ..color = const Color.fromARGB(189, 1, 35, 79),
                                              ),
                                            ),
                                            Text(
                                              "Dúvidas e Ajuda",
                                              style: GoogleFonts.changaOne(
                                                fontSize: 24 * multiplicador,
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
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  // Método simples para traduzir o valor numérico do slider em texto amigável
  String _obterTextoEtiqueta(double valor) {
    if (valor == 0.0) return "Letra: Pequena";
    if (valor == 2.0) return "Letra: Grande";
    return "Letra: Média";
  }
}