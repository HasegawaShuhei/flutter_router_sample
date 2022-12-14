import 'package:flutter/material.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('screen result'),
      ),
      body: const Center(
        child: Text('screen result'),
      ),
    );
  }
}
