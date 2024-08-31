import 'package:flutter/cupertino.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Sign In',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField(
              placeholder: 'Email',
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(12),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CupertinoTextField(
              placeholder: 'Password',
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CupertinoColors.systemGrey6,
                borderRadius: BorderRadius.circular(12),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            CupertinoButton.filled(
              child: Text('Sign In'),
              onPressed: () {
                // Sign In処理をここに追加
              },
            ),
            SizedBox(height: 16),
            CupertinoButton(
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: CupertinoColors.systemBlue),
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
                CupertinoButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: CupertinoColors.systemBlue),
                  ),
                  onPressed: () {
                    // Sign Upページへの遷移
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
