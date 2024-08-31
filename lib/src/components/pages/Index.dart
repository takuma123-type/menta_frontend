import 'package:flutter/material.dart';
import 'package:menta_frontend/src/components/pages/SignIn.dart';
import 'package:menta_frontend/src/components/pages/SignUp.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Sign In',
              style: TextStyle(
                color: Colors.green,
                fontSize: 18,
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SignInPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 18,
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SignUpPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}