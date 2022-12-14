import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/router/route_path.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('search screen'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('search screen'),
            ElevatedButton(
              onPressed: () => context.go(RoutePath.searchResultPath),
              child: const Text('結果画面'),
            )
          ],
        ),
      ),
    );
  }
}
