import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/router/bottom_nav_bar_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScaffoldWithBottomNavBar extends HookConsumerWidget {
  const ScaffoldWithBottomNavBar({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = useRef<BottomNavBarItem>(BottomNavBarItem.screenA);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: BottomNavBarItem.values
            .map(
              (i) => BottomNavigationBarItem(
                label: i.label,
                icon: Icon(i.icon),
              ),
            )
            .toList(),
        currentIndex: BottomNavBarItem.values.indexOf(currentTab.value),
        onTap: (index) {
          currentTab.value = BottomNavBarItem.values[index];
          GoRouter.of(context).go(currentTab.value.path);
        },
      ),
    );
  }
}
