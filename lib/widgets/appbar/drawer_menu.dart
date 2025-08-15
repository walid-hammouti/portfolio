import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/providers.dart';
import 'package:portfolio/widgets/appbar/my_app_bar.dart';

class DrawerMenu extends ConsumerStatefulWidget {
  const DrawerMenu({super.key});

  @override
  ConsumerState<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(drawerMenuControllerProvider, (previous, next) {
      if (next.value ?? false) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });

    return ClipRRect(
      child: SlideTransition(
        position: _animation,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.4),
                blurRadius: 6,
                spreadRadius: 3,
              ),
            ],
          ),
          child: const SmallMenu(),
        ),
      ),
    );
  }
}

class DrawerMenuController extends AsyncNotifier<bool> {
  @override
  FutureOr<bool> build() {
    return false;
  }

  void open() {
    state = AsyncData(true);
  }

  void close() {
    state = AsyncData(false);
  }
}
