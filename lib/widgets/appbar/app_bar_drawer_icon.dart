import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/providers.dart';

class AppBarDrawerIcon extends ConsumerStatefulWidget {
  const AppBarDrawerIcon({super.key});

  @override
  ConsumerState<AppBarDrawerIcon> createState() => _AppBarDrawerIconState();
}

class _AppBarDrawerIconState extends ConsumerState<AppBarDrawerIcon>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,
      icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: animation),

      onPressed: () {
        setState(() {
          if (!isOpen) {
            controller.forward();
            ref.read(drawerMenuControllerProvider.notifier).open();
          } else {
            controller.reverse();
            ref.read(drawerMenuControllerProvider.notifier).close();
          }

          isOpen = !isOpen;
        });
      },
    );
  }
}
