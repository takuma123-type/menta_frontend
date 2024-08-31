import 'package:flutter/material.dart';
import 'package:menta_frontend/src/usecases/CreateUserUsecase.dart';
import 'package:menta_frontend/src/infrastructure/repositories/UsersRepository.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  late CreateUserUsecase _createUserUsecase;

  @override
  void initState() {
    super.initState();
    _createUserUsecase = CreateUserUsecase(usersRepository: UsersRepository());
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _handleSignUp() async {
    final input = CreateUserInput(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
    );

    try {
      await _createUserUsecase.execute(input);
 
      print('User created successfully');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('作成完了'),
            content: Text('ログインページに遷移します。'),
            actions: <Widget>[
              TextButton(
                child: Text('Go to Home'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('/sign-in');
                },
              ),
            ],
          );
        },
      );
    } catch (error) {
      print('Failed to create user: $error');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to create user. Please try again.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新規登録'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              child: Text('新規登録'),
              onPressed: _handleSignUp,
            ),
          ],
        ),
      ),
    );
  }
}