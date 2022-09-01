import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../data/article.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://qiita.com/api/v2")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/items")
  Future<List<Article>> fetchArticles();
}
