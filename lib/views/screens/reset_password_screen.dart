import 'package:flutter/material.dart';
import '../../services/firebase_auth_service.dart';

class ResetPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () async {
                String email = _emailController.text.trim();
                if (email.isNotEmpty) {
                  FirebaseAuthService.resetPassword(email: email);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Emailga habar jo'natildi")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Iltimos email mazilni kiriting')),
                  );
                }
              },
              child: const Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}