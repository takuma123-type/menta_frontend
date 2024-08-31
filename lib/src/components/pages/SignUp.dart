import 'package:flutter/cupertino.dart';
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
      // サインアップが成功した場合の処理
      print('User created successfully');
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('作成完了'),
            content: Text('ログインページに遷移します。'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('Go to Home'),
                onPressed: () {
                  Navigator.of(context).pop(); // ダイアログを閉じる
                  Navigator.of(context).pushReplacementNamed('/'); // ホームページに遷移
                },
              ),
            ],
          );
        },
      );
    } catch (error) {
      // エラーが発生した場合の処理
      print('Failed to create user: $error');
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Error'),
            content: Text('Failed to create user. Please try again.'),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // ダイアログを閉じる
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Sign Up'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoTextField(
              controller: _firstNameController,
              placeholder: 'First Name',
              padding: EdgeInsets.all(16),
            ),
            SizedBox(height: 16),
            CupertinoTextField(
              controller: _lastNameController,
              placeholder: 'Last Name',
              padding: EdgeInsets.all(16),
            ),
            SizedBox(height: 24),
            CupertinoButton.filled(
              child: Text('新規登録'),
              onPressed: _handleSignUp,
            ),
          ],
        ),
      ),
    );
  }
}
