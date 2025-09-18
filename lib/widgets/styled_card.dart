import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';

class StyledCard extends StatefulWidget {
  const StyledCard({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    required this.child,
  });
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Widget child;
  @override
  State<StyledCard> createState() => _StyledCardState();
}

class _StyledCardState extends State<StyledCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding ?? EdgeInsets.all(context.insets.cardPadding),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        border: Border.all(color: context.colorScheme.outline),
        borderRadius: widget.borderRadius ?? BorderRadius.circular(24),
      ),
      child: widget.child,
    );
  }
}
