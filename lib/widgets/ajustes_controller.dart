import 'package:flutter/material.dart';
// Certifique-se de adicionar o pacote 'audioplayers' no seu pubspec.yaml se for tocar áudios reais
// Para este exemplo, usaremos uma simulação com print ou recursos nativos.

class AjustesController extends ChangeNotifier {
  // Instância única (Singleton) para acessar de qualquer tela
  static final AjustesController _instance = AjustesController._internal();
  factory AjustesController() => _instance;
  AjustesController._internal();

  // 1. Estado do Tamanho do Texto (0 = Pequeno, 1 = Médio, 2 = Grande)
  double _tamanhoTextoSlider = 1.0;
  double get tamanhoTextoSlider => _tamanhoTextoSlider;

  // Multiplicador que você vai usar nos seus Text widgets: TextStyle(fontSize: 16 * AjustesController().multiplicadorFonte)
  double get multiplicadorFonte {
    if (_tamanhoTextoSlider == 0.0) return 0.8; // Pequeno
    if (_tamanhoTextoSlider == 2.0) return 1.3; // Grande
    return 1.0; // Médio
  }

  set tamanhoTextoSlider(double valor) {
    _tamanhoTextoSlider = valor;
    notifyListeners(); // Atualiza as telas
  }

  // 2. Estado dos Sons do Aplicativo
  bool _sonsAtivos = true;
  bool get sonsAtivos => _sonsAtivos;

  set sonsAtivos(bool valor) {
    _sonsAtivos = valor;
    notifyListeners();
  }

  // 3. Funções de Som (Item 2 e 3 da sua lista)
  void tocarSomClique() {
    if (_sonsAtivos) {
      debugPrint("🔊 Som tocado: Clique no botão!");
      // Aqui você coloca o código do seu pacote de áudio, ex: audioPlayer.play(AssetSource('sons/clique.mp3'));
    }
  }

  void tocarSomSucesso() {
    if (_sonsAtivos) {
      debugPrint("🎉 Som tocado: Exercício Concluído com Sucesso!");
      // ex: audioPlayer.play(AssetSource('sons/sucesso.mp3'));
    }
  }
}