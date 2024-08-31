import 'package:flutter/material.dart';
import 'package:menta_frontend/src/components/organisms/SignUpForm.dart';
import 'package:menta_frontend/src/usecases/CreateUserUsecase.dart';
import 'package:menta_frontend/src/infrastructure/repositories/UsersRepository.dart';

class SignUpTemplate extends StatefulWidget {
  @override
  _SignUpTemplateState createState() => _SignUpTemplateState();
}

class _SignUpTemplateState extends State<SignUpTemplate> {
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
      
      if (!mounted) return;

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
      if (!mounted) return;

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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SignUpForm(
        firstNameController: _firstNameController,
        lastNameController: _lastNameController,
        onSignUp: _handleSignUp,
      ),
    );
  }
}
