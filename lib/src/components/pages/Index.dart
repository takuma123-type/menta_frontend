import 'package:flutter/cupertino.dart';
import 'package:menta_frontend/src/components/pages/Tag.dart';
import 'package:menta_frontend/src/components/pages/SignIn.dart';
import 'package:menta_frontend/src/components/pages/SignUp.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Main',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      child: ListView(
        children: [
          CupertinoListSection.insetGrouped(
            header: Text('User Actions'),
            children: [
              CupertinoListTile(
                leading: Icon(CupertinoIcons.tag),
                title: Text(
                  'Tags',
                  style: TextStyle(
                    color: CupertinoColors.activeBlue,
                    fontSize: 18,
                  ),
                ),
                trailing: CupertinoListTileChevron(),
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => TagPage()),
                  );
                },
              ),
              CupertinoListTile(
                leading: Icon(CupertinoIcons.person),
                title: Text(
                  'Sign In',
                  style: TextStyle(
                    color: CupertinoColors.activeGreen,
                    fontSize: 18,
                  ),
                ),
                trailing: CupertinoListTileChevron(),
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => SignInPage()),
                  );
                },
              ),
              CupertinoListTile(
                leading: Icon(CupertinoIcons.person_add),
                title: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: CupertinoColors.activeOrange,
                    fontSize: 18,
                  ),
                ),
                trailing: CupertinoListTileChevron(),
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => SignUpPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
