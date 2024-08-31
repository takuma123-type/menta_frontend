import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: () {
                // Sign In処理をここに追加
              },
            ),
            SizedBox(height: 16),
            TextButton(
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                // パスワードリセット処理
              },
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                TextButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}