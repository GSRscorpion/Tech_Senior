import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 1. IMPORTADO PARA USAR OS SONS DO SISTEMA
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_senior/widgets/ajustes_controller.dart';
import 'package:tech_senior/widgets/indicador.dart';

class ExerciciozapPage extends StatefulWidget {
  const ExerciciozapPage({super.key});

  @override
  State<ExerciciozapPage> createState() => _ExerciciozapPageState();
}

class _ExerciciozapPageState extends State<ExerciciozapPage> {
  int passoAtual = 1;
  int? imagemSelecionada;
  final multiplicador = AjustesController().multiplicadorFonte;

  final List<String> fotosGaleria = [
    'https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/1072179/pexels-photo-1072179.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/247599/pexels-photo-247599.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/531756/pexels-photo-531756.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/1450360/pexels-photo-1450360.jpeg?auto=compress&cs=tinysrgb&w=400',
  ];

  // FUNÇÃO AUXILIAR PARA REPRODUZIR O SOM DE CLIQUE
  void _tocarSomClique() {
    SystemSound.play(SystemSoundType.click);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5DDD5),
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 24, 255, 143)),
        title: Row(
          children: [
            Image.asset(
              'asset/images/logo_TechSenior.png',
              width: 100,
              height: 50,
              alignment: const AlignmentGeometry.directional(-1, 1),
            ),
            Expanded(
              child: Text(
                "Exercício\n WhatsApp",
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
      body: Column(
        children: [
          // 1. BANNER DE INSTRUÇÃO
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: const Color(0xFF3DD169),
            child: Row(
              children: [
                Image.asset(
                  'asset/images/whatsapp.png',
                  height: 35,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Instrução",
                        style: GoogleFonts.robotoSlab(
                          color: const Color.fromARGB(255, 255, 111, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 16 * multiplicador,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Stack(
                        children: [
                          Text(
                            _obterTextoInstrucao(),
                            textAlign: TextAlign.center,
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
                            _obterTextoInstrucao(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoSlab(
                              fontSize: 14 * multiplicador,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 35),
              ],
            ),
          ),

          // 2. CONTEÚDO DINÂMICO RESPONSIVO
          Expanded(
            child: OrientationBuilder(
              builder: (context, orientation) {
                final bool isLandscape = orientation == Orientation.landscape;

                return LayoutBuilder(
                  builder: (context, constraints) {
                    final double alturaMaxPainel = isLandscape
                        ? constraints.maxHeight
                        : constraints.maxHeight * 0.45;
                    final double larguraMaxPainel = isLandscape
                        ? constraints.maxWidth * 0.5
                        : constraints.maxWidth;

                    return Stack(
                      children: [
                        // Balão de Instrução Centralizado/Lateralizado
                        Positioned(
                          top: 10,
                          left: 16,
                          right: isLandscape ? larguraMaxPainel + 16 : 16,
                          bottom: passoAtual >= 4 || isLandscape
                              ? 10
                              : alturaMaxPainel + 10,
                          child: SingleChildScrollView(
                            child: _construirBalaoDeFala(),
                          ),
                        ),

                        // FOTO ENVIADA
                        if (passoAtual >= 4 && imagemSelecionada != null)
                          Align(
                            alignment: isLandscape
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: isLandscape ? 16 : 0,
                                right: isLandscape ? 0 : 16,
                                top: 10,
                              ),
                              child: Container(
                                width: constraints.maxWidth *
                                    (isLandscape ? 0.35 : 0.45),
                                height: constraints.maxHeight * 0.6,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD9FDD3),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: const Color(0xFF30A24A), width: 2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(4),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    fotosGaleria[imagemSelecionada!],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),

                        // Menus injetando as configurações de tela adaptadas
                        if (passoAtual == 2)
                          _construirMenuAnexo(
                              alturaMaxPainel, larguraMaxPainel, isLandscape),
                        if (passoAtual == 3)
                          _construirGradeGaleria(
                              alturaMaxPainel, larguraMaxPainel, isLandscape),
                        if (passoAtual == 5) _construirModalParabens(),
                      ],
                    );
                  },
                );
              },
            ),
          ),

          // 3. BARRA DE DIGITAÇÃO SIMULADA
          if (passoAtual < 3) _construirBarraDigitacao(),
        ],
      ),
    );
  }

  String _obterTextoInstrucao() {
    if (passoAtual == 1) return "Toque no clipe amarelo para escolher sua foto";
    if (passoAtual == 2) return "Toque no ícone azul da Galeria";
    if (passoAtual == 3) return "Selecione uma foto e toque na seta verde";
    return "Excelente trabalho!";
  }

  Widget _construirBalaoDeFala() {
    String texto = "";
    if (passoAtual == 1)
      texto = "Vamos aprender a enviar fotos! Toque no clipe.";
    if (passoAtual == 2)
      texto = "Selecione o ícone da Galeria e escolha uma foto.";
    if (passoAtual == 3)
      texto = "Depois de escolher a foto, envie selecionando a seta verde.";
    if (passoAtual >= 4) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16 * multiplicador, // AQUI: Multiplicador aplicado no balão
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _construirBarraDigitacao() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      color: const Color(0xFFF0F2F5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const Icon(Icons.emoji_emotions_outlined,
                      color: Colors.grey, size: 24),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: "Digitar mensagem",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _tocarSomClique(); // AQUI: Som adicionado ao clicar no clipe
                      if (passoAtual == 1) {
                        setState(() {
                          passoAtual = 2;
                        });
                      }
                    },
                    child: Indicador(
                      ativo: passoAtual == 1,
                      child: const Icon(
                        Icons.attach_file,
                        color: Color(0xFF54656F),
                        size: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.camera_alt, color: Colors.grey, size: 24),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF00A884),
            ),
            child: const Icon(Icons.mic, color: Colors.white, size: 22),
          ),
        ],
      ),
    );
  }

  Widget _construirMenuAnexo(
      double alturaMax, double larguraMax, bool isLandscape) {
    final List<Map<String, dynamic>> itensMenu = [
      {'icon': Icons.image, 'color': Colors.blue, 'label': 'Galeria', 'id': 1},
      {'icon': Icons.camera_alt, 'color': Colors.pink, 'label': 'Câmera', 'id': 2},
      {'icon': Icons.location_on, 'color': Colors.teal, 'label': 'Localização', 'id': 3},
      {'icon': Icons.person, 'color': Colors.lightBlue, 'label': 'Contato', 'id': 4},
      {'icon': Icons.insert_drive_file, 'color': Colors.purple, 'label': 'Documento', 'id': 5},
      {'icon': Icons.headset, 'color': Colors.orange, 'label': 'Áudio', 'id': 6},
      {'icon': Icons.poll, 'color': Colors.amber, 'label': 'Enquete', 'id': 7},
      {'icon': Icons.pix, 'color': const Color(0xFF00BFA5), 'label': 'Pix', 'id': 8},
      {'icon': Icons.calendar_month, 'color': Colors.pinkAccent, 'label': 'Evento', 'id': 9},
      {'icon': Icons.auto_awesome, 'color': Colors.blueAccent, 'label': 'Imagens de IA', 'id': 10},
    ];

    return Positioned(
      bottom: 0,
      right: 0,
      left: isLandscape ? null : 0,
      width: isLandscape ? larguraMax : null,
      height: alturaMax,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: Color(0xFF1F2225),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isLandscape ? 3 : 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 70,
          ),
          itemCount: itensMenu.length,
          itemBuilder: (context, index) {
            final item = itensMenu[index];
            final bool ehGaleria = item['id'] == 1;

            Widget iconeWidget =
                Icon(item['icon'], color: item['color'], size: 24);

            if (ehGaleria) {
              iconeWidget =
                  Indicador(ativo: passoAtual == 2, child: iconeWidget);
            }

            return GestureDetector(
              onTap: () {
                _tocarSomClique(); // AQUI: Som adicionado ao clicar em qualquer item do menu anexo
                if (ehGaleria && passoAtual == 2) {
                  setState(() {
                    passoAtual = 3;
                  });
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2F33),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(child: iconeWidget),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item['label'],
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        const TextStyle(color: Color(0xFFE9EDEF), fontSize: 10),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _construirGradeGaleria(
      double alturaMax, double larguraMax, bool isLandscape) {
    bool temFotoSelecionada = imagemSelecionada != null;

    return Positioned(
      bottom: 0,
      right: 0,
      left: isLandscape ? null : 0,
      width: isLandscape ? larguraMax : null,
      height: alturaMax,
      child: Container(
        color: const Color(0xFF1B1B1D),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: fotosGaleria.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isLandscape ? 2 : 3, crossAxisSpacing: 4, mainAxisSpacing: 4,
                  ),
                  itemBuilder: (context, index) {
                    final bool estaSelecionada = imagemSelecionada == index;

                    return GestureDetector(
                      onTap: () {
                        _tocarSomClique(); // AQUI: Som adicionado ao escolher uma foto
                        setState(() {
                          imagemSelecionada = index;
                        });
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                border: estaSelecionada
                                    ? Border.all(
                                        color: const Color(0xFF00A884),
                                        width: 3)
                                    : null,
                              ),
                              child: Image.network(
                                fotosGaleria[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (estaSelecionada)
                            Positioned(
                              top: 4,
                              right: 4,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF00A884),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.check,
                                    color: Colors.white, size: 14),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              color: const Color(0xFF1B1B1D),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2B2E),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        "Legenda...",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Indicador(
                    ativo: passoAtual == 3 && temFotoSelecionada,
                    child: GestureDetector(
                      onTap: () {
                        _tocarSomClique(); // AQUI: Som adicionado ao clicar no botão de enviar (seta verde)
                        if (passoAtual == 3 && temFotoSelecionada) {
                          setState(() {
                            passoAtual = 4;
                          });

                          Future.delayed(const Duration(milliseconds: 1500),
                              () {
                            if (mounted) {
                              setState(() {
                                passoAtual = 5;
                              });
                            }
                          });
                        }
                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: temFotoSelecionada
                              ? const Color(0xFF00A884)
                              : const Color(0xFF2A2B2E),
                        ),
                        child: Icon(
                          Icons.send,
                          color: temFotoSelecionada
                              ? Colors.white
                              : Colors.grey[600],
                          size: 20,
                        ),
                      ),
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

  Widget _construirModalParabens() {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 290,
                  margin: const EdgeInsets.only(top: 40, bottom: 20),
                  padding: const EdgeInsets.only(
                      top: 50, bottom: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00C853), Color(0xFF00B0FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "PARABÉNS!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Você aprendeu a enviar uma foto no WhatsApp!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black87,
                          minimumSize: const Size.fromHeight(40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        icon: const Icon(Icons.home),
                        label: const Text("Voltar para o Início",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: () {
                          _tocarSomClique(); // AQUI: Som adicionado no botão fechar/home
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text("Próximo Exercício",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: () {
                          _tocarSomClique(); // AQUI: Som adicionado no botão avançar
                          debugPrint("Avançando para o próximo exercício...");
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -10,
                  child: Image.asset(
                    'asset/images/crown.png',
                    width: 75,
                    height: 75,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}