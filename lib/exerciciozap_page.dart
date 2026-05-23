import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_senior/bottomnav_page.dart';
import 'package:tech_senior/widgets/indicador.dart';

class ExerciciozapPage extends StatefulWidget {
  const ExerciciozapPage({super.key});

  @override
  State<ExerciciozapPage> createState() => _ExerciciozapPageState();
}

class _ExerciciozapPageState extends State<ExerciciozapPage> {
  int passoAtual = 1;
  int? imagemSelecionada;

  // Lista única e centralizada das fotos estáveis de paisagem
  final List<String> fotosGaleria = [
    'https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/1072179/pexels-photo-1072179.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/247599/pexels-photo-247599.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/531756/pexels-photo-531756.jpeg?auto=compress&cs=tinysrgb&w=400',
    'https://images.pexels.com/photos/1450360/pexels-photo-1450360.jpeg?auto=compress&cs=tinysrgb&w=400',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFE5DDD5,
      ), // Cor de fundo clássica do chat do WhatsApp
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 24, 255, 143),
        ),
        title: Row(
          children: [
            Image.asset(
              'asset/images/logo_TechSenior.png',
              width: 100,
              height: 50,
              alignment: const AlignmentGeometry.directional(-1, 1),
            ),
            Text(
              "Exercício: WhatsApp",
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
      body: Column(
        children: [
          // 1. BANNER DE INSTRUÇÃO (Top Verde)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: const Color(0xFF3DD169),
            child: Row(
              children: [
                Image.asset('asset/images/whatsapp.png', height: 45),
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
                          fontSize: 19,
                          shadows: [
                            const Shadow(
                              offset: Offset(2, 3),
                              blurRadius: 2,
                              color: Color.fromARGB(150, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Stack(
                        children: [
                          Text(
                            _obterTextoInstrucao(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoSlab(
                              fontSize: 18,
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
                const SizedBox(width: 45),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 2. CONTEÚDO DINÂMICO DO CHAT
          Expanded(
            child: Stack(
              children: [
                // Balão de Instrução Centralizado
                Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: _construirBalaoDeFala(),
                ),

                // FOTO ENVIADA: Aparece na tela após clicar em enviar (Passos 4 e 5)
                if (passoAtual >= 4 && imagemSelecionada != null)
                  Positioned(
                    bottom: 20,
                    right: 16,
                    child: Container(
                      width: 160,
                      height: 220,
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFFD9FDD3,
                        ), // Cor do balão de msg enviada do Zap
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF30A24A),
                          width: 2,
                        ),
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

                // Interfaces flutuantes de acordo com o passo
                if (passoAtual == 2) _construirMenuAnexo(),
                if (passoAtual == 3) _construirGradeGaleria(),
                if (passoAtual == 5) _construirModalParabens(),
              ],
            ),
          ),

          // 3. BARRA DE DIGITAÇÃO SIMULADA
          if (passoAtual < 3) _construirBarraDigitacao(),
        ],
      ),
    );
  }

  // Altera dinamicamente o texto do banner verde superior
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
    if (passoAtual >= 4)
      return const SizedBox.shrink(); // Some no envio/sucesso

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Text(
        texto,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _construirBarraDigitacao() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      color: const Color(0xFFF0F2F5),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.grey,
                    size: 26,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: "Digitar mensagem",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
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
                  const SizedBox(width: 14),
                  const Icon(Icons.camera_alt, color: Colors.grey, size: 24),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF00A884),
            ),
            child: const Icon(Icons.mic, color: Colors.white, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _construirMenuAnexo() {
    final List<Map<String, dynamic>> itensMenu = [
      {'icon': Icons.image, 'color': Colors.blue, 'label': 'Galeria', 'id': 1},
      {
        'icon': Icons.camera_alt,
        'color': Colors.pink,
        'label': 'Câmera',
        'id': 2,
      },
      {
        'icon': Icons.location_on,
        'color': Colors.teal,
        'label': 'Localização',
        'id': 3,
      },
      {
        'icon': Icons.person,
        'color': Colors.lightBlue,
        'label': 'Contato',
        'id': 4,
      },
      {
        'icon': Icons.insert_drive_file,
        'color': Colors.purple,
        'label': 'Documento',
        'id': 5,
      },
      {
        'icon': Icons.headset,
        'color': Colors.orange,
        'label': 'Áudio',
        'id': 6,
      },
      {'icon': Icons.poll, 'color': Colors.amber, 'label': 'Enquete', 'id': 7},
      {
        'icon': Icons.pix,
        'color': Colors.tealAccent[700],
        'label': 'Pix',
        'id': 8,
      },
      {
        'icon': Icons.calendar_month,
        'color': Colors.pinkAccent,
        'label': 'Evento',
        'id': 9,
      },
      {
        'icon': Icons.auto_awesome,
        'color': Colors.blueAccent,
        'label': 'Imagens de IA',
        'id': 10,
      },
    ];

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 317,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: const BoxDecoration(
          color: Color(0xFF1F2225),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 12,
            mainAxisExtent: 85,
          ),
          itemCount: itensMenu.length,
          itemBuilder: (context, index) {
            final item = itensMenu[index];
            final bool ehGaleria = item['id'] == 1;

            Widget iconeWidget = Icon(
              item['icon'],
              color: item['color'],
              size: 26,
            );

            if (ehGaleria) {
              iconeWidget = Indicador(
                ativo: passoAtual == 2,
                child: iconeWidget,
              );
            }

            return GestureDetector(
              onTap: () {
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
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2F33),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(child: iconeWidget),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item['label'],
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFFE9EDEF),
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _construirGradeGaleria() {
    bool temFotoSelecionada = imagemSelecionada != null;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 322,
        color: const Color(0xFF1B1B1D),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                  itemCount: fotosGaleria.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemBuilder: (context, index) {
                    final bool estaSelecionada = imagemSelecionada == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          imagemSelecionada =
                              index; // Apenas seleciona visualmente a foto
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
                                        width: 3,
                                      )
                                    : null,
                              ),
                              child: Image.network(
                                fotosGaleria[index],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(
                                      Icons.image,
                                      color: Colors.white30,
                                    ),
                              ),
                            ),
                          ),
                          if (estaSelecionada)
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF00A884),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 18,
                                ),
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              color: const Color(0xFF1B1B1D),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2B2E),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        "Adicione uma legenda...",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Indicador(
                    ativo: passoAtual == 3 && temFotoSelecionada,
                    child: GestureDetector(
                      onTap: () {
                        if (passoAtual == 3 && temFotoSelecionada) {
                          setState(() {
                            passoAtual =
                                4; // Avança para renderizar a foto na tela do chat
                          });

                          // Espera 1.5 segundos exibindo a foto antes de lançar o modal de Parabéns
                          Future.delayed(
                            const Duration(milliseconds: 1500),
                            () {
                              if (mounted) {
                                setState(() {
                                  passoAtual = 5; // Ativa a janela de Parabéns
                                });
                              }
                            },
                          );
                        }
                      },
                      child: Container(
                        width: 50,
                        height: 50,
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
                          size: 24,
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
        color: Colors.black.withValues(alpha: 0.4),
        child: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 300,
                padding: const EdgeInsets.only(
                  top: 60,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF00C853),
                      Color.fromARGB(255, 0, 255, 153),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "PARABÉNS!",
                      style: GoogleFonts.changaOne(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Você aprendeu a enviar uma foto no WhatsApp!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoSlab(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                        minimumSize: const Size.fromHeight(45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.home),
                      label: const Text(
                        "Voltar para o Início",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomnavPage(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text(
                        "Próximo Exercício",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        print("Avançando para o próximo exercício...");
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -50,
                child: Image.asset(
                  'asset/images/crown.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
