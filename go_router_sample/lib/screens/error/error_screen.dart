import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/router/route_path.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('error'),
      ),
      body: SizedBox.expand(
        child: ColoredBox(
          color: Colors.red.withOpacity(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('error'),
              ElevatedButton(
                onPressed: () => context.go(RoutePath.productPath),
                child: const Text('ホームに戻る'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
