import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
// Importação especial para rodar JavaScript nativo na Web sem quebrar o app
import 'dart:html' as html;

class AjustesController extends ChangeNotifier {
  static final AjustesController _instance = AjustesController._internal();
  
  factory AjustesController() => _instance;
  
  AjustesController._internal();

  // Player do pacote (será usado se um dia rodar em celular físico)
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Elementos de áudio HTML5 nativos para a Web não dar erro de codec/formato
  html.AudioElement? _audioCliqueWeb;
  html.AudioElement? _audioSucessoWeb;

  // ==========================================
  // ESTADO DO TAMANHO DO TEXTO
  // ==========================================
  double _tamanhoTextoSlider = 1.0;
  double get tamanhoTextoSlider => _tamanhoTextoSlider;

  set tamanhoTextoSlider(double valor) {
    _tamanhoTextoSlider = valor;
    notifyListeners();
  }

  double get multiplicadorFonte {
    if (_tamanhoTextoSlider == 0.0) return 0.8;
    if (_tamanhoTextoSlider == 2.0) return 1.3;
    return 1.0;
  }

  // ==========================================
  // ESTADO DOS SONS DO APLICATIVO
  // ==========================================
  bool _sonsAtivos = true;
  bool get sonsAtivos => _sonsAtivos;

  set sonsAtivos(bool valor) {
    _sonsAtivos = valor;
    notifyListeners();
  }

  // ==========================================
  // MÉTODOS DE ÁUDIO CORRIGIDOS COM FALLBACK WEB
  // ==========================================

  Future<void> tocarSomClique() async {
    if (!_sonsAtivos) return;

    try {
      if (kIsWeb) {
        // Na Web, criamos um elemento de áudio HTML5 puro que o Chrome aceita sem chiar
        _audioCliqueWeb ??= html.AudioElement('assets/asset/sounds/click.mp3');
        _audioCliqueWeb!.currentTime = 0; // Reseta para o início caso clique rápido
        _audioCliqueWeb!.play();
      } else {
        // Código para celular/emulador normal
        await _audioPlayer.stop(); 
        await _audioPlayer.play(AssetSource('sounds/click.mp3'));
      }
    } catch (e) {
      print("Erro ao tocar som de clique: $e");
    }
  }

  Future<void> tocarSomSucesso() async {
    if (!_sonsAtivos) return;

    try {
      if (kIsWeb) {
        _audioSucessoWeb ??= html.AudioElement('assets/asset/sounds/sucesso.mp3');
        _audioSucessoWeb!.currentTime = 0;
        _audioSucessoWeb!.play();
      } else {
        await _audioPlayer.stop();
        await _audioPlayer.play(AssetSource('sounds/sucesso.mp3'));
      }
    } catch (e) {
      print("Erro ao tocar som de sucesso: $e");
    }
  }
}