import 'package:flutter/cupertino.dart';
import 'package:menta_frontend/src/components/pages/index.dart';
import 'package:menta_frontend/src/components/pages/SignIn.dart';
import 'package:menta_frontend/src/components/pages/SignUp.dart';

class AppRoutes {
  static const String index = '/';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case index:
        return CupertinoPageRoute(builder: (_) => IndexPage());
      case signIn:
        return CupertinoPageRoute(builder: (_) => SignInPage());
      case signUp:
        return CupertinoPageRoute(builder: (_) => SignUp());
      default:
        return CupertinoPageRoute(
          builder: (_) => CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Error'),
            ),
            child: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static Map<String, WidgetBuilder> routes() {
    return {
      index: (_) => IndexPage(),
      signIn: (_) => SignInPage(),
      signUp: (_) => SignUp(),
    };
  }
}

