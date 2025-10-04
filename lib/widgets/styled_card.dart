import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';

class StyledCard extends StatefulWidget {
  const StyledCard({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    this.borderEffect = false,
    required this.child,
  });
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Widget child;
  final bool borderEffect;
  @override
  State<StyledCard> createState() => _StyledCardState();
}

class _StyledCardState extends State<StyledCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.borderEffect) ...[
          _BorderShadow(),
          Positioned(bottom: 0, right: 0, child: _BorderShadow()), // Container
        ],
        Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding ?? EdgeInsets.all(context.insets.cardPadding),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            border: Border.all(color: context.colorScheme.outline),
            borderRadius: widget.borderRadius ?? BorderRadius.circular(24),
          ),
          child: widget.child,
        ),
        if (widget.borderEffect) ...[
          CustomPaint(
            size: Size(widget.width ?? 0, widget.height ?? 0),
            painter: CurvedLinePainter(color: context.colorScheme.primary),
          ),
        ],
      ],
    );
  }
}

class CurvedLinePainter extends CustomPainter {
  final Color color;

  CurvedLinePainter({super.repaint, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const lineSize = 60.0;
    final topLeftPaint =
        Paint()
          ..shader = LinearGradient(
            colors: [color.withOpacity(0), color, color.withOpacity(0)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ).createShader(const Rect.fromLTWH(0, 0, lineSize, lineSize))
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round;
    ;
    final bottomRightPaint =
        Paint()
          ..shader = LinearGradient(
            colors: [color.withOpacity(0), color, color.withOpacity(0)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ).createShader(
            Rect.fromLTWH(
              size.width - lineSize,
              size.height - lineSize,
              lineSize,
              lineSize,
            ),
          )
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(lineSize, 0);
    path.cubicTo(0, 0, 0, 0, 0, lineSize);

    final path2 = Path();
    path2.moveTo(size.width - lineSize, size.height);
    path2.cubicTo(
      size.width,
      size.height,
      size.width,
      size.height,
      size.width,
      size.height - lineSize,
    );

    canvas.drawPath(path, topLeftPaint);
    canvas.drawPath(path2, bottomRightPaint);
  }

  @override
  bool shouldRepaint(CurvedLinePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CurvedLinePainter oldDelegate) => true;
}

class _BorderShadow extends StatelessWidget {
  const _BorderShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
          ), // BoxShadow
        ],
      ), // BoxDecoration
    );
  }
}
