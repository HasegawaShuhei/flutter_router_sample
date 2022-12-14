import 'package:flutter/material.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({
    super.key,
    required this.userName,
    required this.email,
  });

  final String userName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('profile edit'),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('userName: $userName'),
            Text('email: $email'),
          ],
        ),
      ),
    );
  }
}
