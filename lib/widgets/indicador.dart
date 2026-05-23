import 'package:flutter/material.dart';

class Indicador extends StatefulWidget {
  final Widget child;
  final bool ativo;

  const Indicador({super.key, required this.child, required this.ativo});

  @override
  State<Indicador> createState() => _IndicadorState();
}

class _IndicadorState extends State<Indicador> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(); // Tiramos o 'reverse' para dar um efeito de onda contínua que some
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.ativo) return widget.child;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // CORREÇÃO DO ERRO AZUL: Usando withValues para a nova especificação do Flutter
        // A opacidade diminui à medida que o anel expande
        final double opacidadeBorda = (1.0 - _controller.value).clamp(0.0, 1.0);
        final double opacidadeFundo = ((1.0 - _controller.value) * 0.3).clamp(0.0, 1.0);

        // O tamanho base do efeito será fixo em 40x40
        const double tamanhoBase = 40.0;

        return Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // Transform.scale faz o elemento crescer geometricamente a partir do centro
            // sem forçar o reposicionamento dos elementos irmãos
            Transform.scale(
              // Vai de escala 0.8 (menor que o clipe) até 1.6 (uma onda expansiva)
              scale: 0.8 + (_controller.value * 0.8),
              child: Container(
                width: tamanhoBase,
                height: tamanhoBase,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // Nova sintaxe do Flutter para tirar o alerta azul:
                  color: Colors.orange.withValues(alpha: opacidadeFundo),
                  border: Border.all(
                    color: Colors.orange.withValues(alpha: opacidadeBorda),
                    width: 2,
                  ),
                ),
              ),
            ),
            // O clipe original fica por cima, 100% estático
            widget.child,
          ],
        );
      },
    );
  }
}