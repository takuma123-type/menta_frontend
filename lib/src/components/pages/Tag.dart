import 'package:flutter/cupertino.dart';
import 'package:menta_frontend/src/usecases/FetchTagUsecase.dart';
import 'package:menta_frontend/src/models/presentation/TagItem.dart';
import 'package:menta_frontend/src/infrastructure/repositories/TagRepository.dart';

class TagPage extends StatefulWidget {
  @override
  _TagPageState createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  late FetchTagsUsecase _fetchTagsUsecase;
  late Future<FetchTagsOutput> _tagsFuture;

  @override
  void initState() {
    super.initState();
    _fetchTagsUsecase = FetchTagsUsecase(tagsRepository: TagsRepository());
    _tagsFuture = _fetchTagsUsecase.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Tags'),
      ),
      child: FutureBuilder<FetchTagsOutput>(
        future: _tagsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final tags = snapshot.data!.tags;
            return SingleChildScrollView(
              child: CupertinoListSection.insetGrouped(
                header: const Text('Tags'),
                children: tags.map((tag) {
                  return CupertinoListTile.notched(
                    title: Text(tag.name),
                    leading: Container(
                      width: 24.0, // 適切なサイズを設定
                      height: 24.0,
                      color: CupertinoColors.systemBlue,
                    ),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {
                      // タップ時の処理
                    },
                  );
                }).toList(),
              ),
            );
          } else {
            return Center(child: Text('No tags available'));
          }
        },
      ),
    );
  }
}
