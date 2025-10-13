import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_size.dart';

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -(context.width / 2 / 2),
      top: (-(context.width / 2 / 2)) + Insets.xxxl,
      child: Container(
        width: context.width / 2,
        height: context.width / 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 200,
              spreadRadius: 100,
              color: context.colorScheme.primary.withOpacity(0.4),
            ), // BoxShadow
          ],
        ), // BoxDecoration
      ), // Container
    ); // Positioned
  }
}

class AnimatedDotsBackground extends StatefulWidget {
  final int dotCount;
  final Color dotColor;
  final double dotSize;
  final Duration animationDuration;

  const AnimatedDotsBackground({
    Key? key,
    this.dotCount = 50,
    this.dotColor = Colors.blue,
    this.dotSize = 6.0,
    this.animationDuration = const Duration(seconds: 3),
  }) : super(key: key);

  @override
  State<AnimatedDotsBackground> createState() => _AnimatedDotsBackgroundState();
}

class _AnimatedDotsBackgroundState extends State<AnimatedDotsBackground>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  List<Offset>? _positions;
  final Random _random = Random();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Only initialize once (after first layout)
    if (_positions != null) return;

    final size = MediaQuery.of(context).size;

    // Skip initialization if widget has zero size (not laid out yet)
    if (size.width == 0 || size.height == 0) return;

    _positions = List.generate(
      widget.dotCount,
      (_) => Offset(
        _random.nextDouble() * size.width,
        _random.nextDouble() * size.height,
      ),
    );

    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // If not initialized yet → empty box
    if (_controller == null || _positions == null) {
      return const SizedBox.expand();
    }

    return AnimatedBuilder(
      animation: _controller!,
      builder: (_, __) {
        return CustomPaint(
          painter: _DotsPainter(
            progress: _controller!.value,
            positions: _positions!,
            dotColor: widget.dotColor,
            dotSize: widget.dotSize,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class _DotsPainter extends CustomPainter {
  final double progress;
  final List<Offset> positions;
  final Color dotColor;
  final double dotSize;

  _DotsPainter({
    required this.progress,
    required this.positions,
    required this.dotColor,
    required this.dotSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (final pos in positions) {
      // Gentle random motion
      final dx = sin(progress * 2 * pi + pos.dx) * 5;
      final dy = cos(progress * 2 * pi + pos.dy) * 5;

      paint.color = dotColor.withOpacity(0.3 + 0.7 * sin(progress * pi).abs());
      canvas.drawCircle(Offset(pos.dx + dx, pos.dy + dy), dotSize, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _DotsPainter oldDelegate) => true;
}
