import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/article.dart';
import '../repository/article_repository.dart';

class ArticleListViewModel extends StateNotifier<AsyncValue<List<Article>>> {
  ArticleListViewModel(this._articleRepository)
      : super(const AsyncValue.loading()) {
    fetchArticles();
  }
  final ArticleRepository _articleRepository;

  Future<void> fetchArticles() async {
    state = const AsyncValue.loading();
    await _articleRepository.fetchArticles().then((result) {
      result.when(success: (articles) {
        state = AsyncValue.data(articles);
      }, failure: (error) {
        state = AsyncValue.error(error);
      });
    });
  }
}
