import '../data/article.dart';
import '../response/result.dart';

abstract class ArticleRepository {
  Future<Result<List<Article>>> fetchArticles();
}
