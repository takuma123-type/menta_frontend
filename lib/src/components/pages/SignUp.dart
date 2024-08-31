import 'package:flutter/material.dart';
import 'package:menta_frontend/src/components/templates/SignUpTemplate.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新規登録'),
      ),
      body: SignUpTemplate(),
    );
  }
}
