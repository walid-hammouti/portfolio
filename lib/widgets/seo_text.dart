import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class SEOText extends StatelessWidget {
  const SEOText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.textRendererStyle,
    this.maxlines,
    this.overflow,
    this.gradient,
  });
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextRendererStyle? textRendererStyle;
  final int? maxlines;
  final TextOverflow? overflow;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      textAlign: textAlign,
      style: style,
      maxLines: maxlines,
      overflow: overflow,
    );
    if (gradient != null) {
      return ShaderMask(
        shaderCallback:
            (bounds) => gradient!.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
        blendMode: BlendMode.srcIn,
        child: textWidget,
      );
    }
    return textWidget;
  }
}
