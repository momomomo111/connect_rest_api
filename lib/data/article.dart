import 'user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Article({
    required String id,
    required String title,
    required String url,
    required User user,
  }) = _Article;

  factory Article.fromJson(Map<String, Object?> json) =>
      _$ArticleFromJson(json);
}
