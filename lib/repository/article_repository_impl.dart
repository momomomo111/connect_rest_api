import '../api/api_client.dart';
import '../data/article.dart';
import '../response/result.dart';
import 'article_repository.dart';

class ArticleRepositoryImpl with ArticleRepository {
  ArticleRepositoryImpl(this._client);

  final ApiClient _client;

  @override
  Future<Result<List<Article>>> fetchArticles() {
    return _client
        .fetchArticles()
        .then((articles) => Result<List<Article>>.success(articles))
        .catchError((error) => Result<List<Article>>.failure(error));
  }
}
