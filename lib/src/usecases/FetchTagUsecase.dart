import 'package:menta_frontend/src/infrastructure/repositories/TagRepository.dart';
import 'package:menta_frontend/src/models/presentation/TagItem.dart';

class FetchTagsOutput {
  final List<TagItem> tags;

  FetchTagsOutput({required this.tags});
}

class FetchTagsUsecase {
  final TagsRepository tagsRepository;

  FetchTagsUsecase({required this.tagsRepository});

  Future<FetchTagsOutput> fetch() async {
    try {
      final response = await tagsRepository.fetch();
      if (response.isEmpty) {
        throw Exception('No results found in the response');
      }

      final tags = response.map((tag) => TagItem(name: tag['name'])).toList();
      return FetchTagsOutput(tags: tags);
    } catch (error) {
      print('Error fetching tags: $error');
      throw error;
    }
  }
}