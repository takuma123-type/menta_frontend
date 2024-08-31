import 'package:flutter/material.dart';
import 'package:menta_frontend/src/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      initialRoute: AppRoutes.index,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
