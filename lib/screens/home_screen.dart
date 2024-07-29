import 'package:flutter/material.dart';
import '../extensions/auth_extension.dart';
import '../logics/auth_logic.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              logout(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome, ${context.auth(l: true).user?.token}!'),
      ),
    );
  }
}
