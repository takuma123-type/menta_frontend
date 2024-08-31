import 'package:flutter/cupertino.dart';
import 'package:menta_frontend/src/components/pages/index.dart';

class AppRoutes {
  static const String index = '/';
  static const String another = '/another';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case index:
        return CupertinoPageRoute(builder: (_) => IndexPage());
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
}
