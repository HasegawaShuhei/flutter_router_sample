import 'package:flutter/material.dart';
import 'package:go_router_sample/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('login'),
            ElevatedButton(
              onPressed: () =>
                  ref.read(isLoggedInProvider.notifier).update((s) => true),
              child: const Text('ログイン'),
            )
          ],
        ),
      ),
    );
  }
}
