import 'package:flutter/material.dart';
import 'package:go_router_sample/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoRouterSample extends HookConsumerWidget {
  const GoRouterSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'GoRouterSample',
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      routeInformationProvider: goRouter.routeInformationProvider,
    );
  }
}
