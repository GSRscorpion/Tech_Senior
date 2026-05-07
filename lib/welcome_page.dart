import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(//CONTAINER DO GRADIENTE DE FUNDO
        
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF5de0e6),
              Color(0xFF004aad),
            ]
          ),
        ),
        
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset((
                "asset/images/logo_TechSenior.png"),
                width: 200,
                height: 200,
                ),
                SizedBox(height: 20),
                Text(
                  "Olá! Bem vindo ao Tech Senior. Vamos aprender a usar o celular juntos!",                  
                  textAlign: TextAlign.center,
                  style:                 
                   GoogleFonts.poppins(
                    height: 1.5,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
                        color: Color.fromARGB(255, 5, 36, 76),
                      )
                    ],
                    color: Color(0xFF74ff13),
                  ),
                ),
          
                 Expanded(
                  child: Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    
                                Container(//CONTAINER DO GRADIENTE DO BOTÃO ENTRAR
                                  width: 150,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xFF5de65e),
                                        Color(0xFF00d9a3),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3), 
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                    ),
                                    onPressed: () {},
                                    child: Text("Entrar",
                                      style: GoogleFonts.poppins(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFfffae6),
                                      ),
                                    ),
                                  ),
                                ),
                  
                                Container(//CONTAINER DO GRADIENTE DO BOTÃO CRIE SUA CONTA
                                  width: 150,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xFF5de65e),
                                        Color(0xFF00d9a3),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3), 
                                      ),
                                    ],
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Crie sua Conta",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFfffae6),
                                      ),
                                    ),
                                    
                                  ),
                                ),
                              ],
                            ),
          ),
         
                  Container(//CONTAINER DO GRADIENTE DO BOTÃO ACESSE SEM CONTA
                    width: 250, // Define uma largura boa para o botão
                    height: 50,  // E uma altura padrão
                    decoration: BoxDecoration(
                      // Aqui você define o gradiente (use as mesmas cores do fundo se quiser!)
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF5de65e),
                          Color(0xFF00d9a3),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10), // Bordas bem arredondadas
                      // Opcional: Adicionar uma sombra leve
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3), 
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Sua ação aqui
                      },
                style: ElevatedButton.styleFrom(
                  // 2. IMPORTANTE: Deixa o fundo do botão transparente
                  backgroundColor: Colors.transparent, 
                  shadowColor: Colors.transparent, // Remove a sombra padrão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Mesma borda do Container
                  ),
                ),

                

                child: Text(
                  "Acesse sem Conta",
                  style: GoogleFonts.poppins(
                    color: Color(0xFFfffae6), // Cor do texto
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Spacer(flex: 1),
            ],
          ),
        ),
      
      ),
    );
  }
}