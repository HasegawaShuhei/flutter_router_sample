import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/router/route_path.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('product'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('product'),
            ElevatedButton(
              onPressed: () => context.go(RoutePath.productDetailPath),
              child: const Text('詳細画面'),
            )
          ],
        ),
      ),
    );
  }
}
