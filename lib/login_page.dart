import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_senior/bottomnav_page.dart';
import 'package:tech_senior/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _mostrarSenha = true;
  
  // Apenas UMA chave para controlar o formulário inteiro
  final _formKey = GlobalKey<FormState>(); 
  
  // Controladores separados para cada campo
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  // CORREÇÃO 1: O dispose() precisa ficar FORA do build()
  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 24, 255, 143)),
        title: Image.asset(
          'asset/images/logo_TechSenior.png',
          width: 100,
          height: 50,
          alignment: const AlignmentGeometry.directional(-1, 1),
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
                // CORREÇÃO 2: Envolvemos toda a estrutura de inputs em um único Form
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
                                    color: const Color.fromARGB(133, 0, 0, 0).withValues(alpha: 0.5),
                                    spreadRadius: 1,
                                    blurRadius: 0,
                                    offset: const Offset(6, 6),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 0, 238, 123),
                                  fixedSize: const Size(147, 55),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'asset/images/facebook.png',
                                      height: 24,
                                      alignment: const AlignmentGeometry.directional(6, 9),
                                    ),
                                    const SizedBox(width: 3),
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
                                              ..color = const Color.fromARGB(189, 1, 35, 79),
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
                                    color: const Color.fromARGB(133, 0, 0, 0).withValues(alpha: 0.5),
                                    spreadRadius: 1,
                                    blurRadius: 0,
                                    offset: const Offset(6, 6),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 0, 238, 123),
                                  fixedSize: const Size(147, 55),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'asset/images/google.png',
                                      height: 24,
                                    ),
                                    const SizedBox(width: 4),
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
                                              ..color = const Color.fromARGB(189, 1, 35, 79),
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

                        const SizedBox(height: 40),
                        const Divider(
                          color: Color.fromARGB(255, 87, 135, 239),
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                        const SizedBox(height: 40),

                        // CAMPO EMAIL
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
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController, // CORREÇÃO 3: Controlador próprio
                          cursorColor: const Color(0xFF00EE7B),
                          style: GoogleFonts.robotoSlab(
                            color: const Color.fromARGB(255, 63, 144, 251),
                            fontSize: 17,
                          ),
                          decoration: InputDecoration(
                            labelText: "seuNome@Exemplo.com",
                            labelStyle: GoogleFonts.robotoSlab(
                              color: const Color(0xFF00EE7B),
                              fontSize: 17,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            fillColor: Colors.white.withValues(alpha: 0.8),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 238, 123),
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
                            // Configuração para manter o design bonito em caso de erro
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red, width: 2),
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

                        const SizedBox(height: 30),

                        // CAMPO SENHA
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
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _senhaController, // CORREÇÃO 4: Controlador próprio
                          obscureText: _mostrarSenha,
                          obscuringCharacter: '*',
                          cursorColor: const Color(0xFF00EE7B),
                          style: GoogleFonts.robotoSlab(
                            color: const Color.fromARGB(255, 63, 144, 251),
                            fontSize: 17,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon: Icon(
                                _mostrarSenha ? Icons.visibility_off : Icons.visibility,
                                color: const Color(0xFF00EE7B),
                              ),
                              onPressed: () {
                                setState(() {
                                  _mostrarSenha = !_mostrarSenha;
                                });
                              },
                            ),
                            labelText: "Insira sua senha",
                            labelStyle: GoogleFonts.robotoSlab(
                              color: const Color(0xFF00EE7B),
                              fontSize: 17,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            fillColor: Colors.white.withValues(alpha: 0.8),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 238, 123),
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
                              borderSide: const BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Por favor, insira sua senha!';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 40),

                        // BOTÃO ENTRAR
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(133, 0, 0, 0).withValues(alpha: 0.5),
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
                              backgroundColor: const Color.fromARGB(255, 0, 238, 123),
                              fixedSize: const Size(270, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Text(
                                  "Entrar",
                                  style: GoogleFonts.changaOne(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 4
                                      ..color = const Color.fromARGB(246, 1, 35, 79),
                                  ),
                                ),
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
                      ],
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