import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api/api_client.dart';
import 'data/article.dart';
import 'repository/article_repository_impl.dart';
import 'view/article_list_view.dart';
import 'view_model/article_list_view_model.dart';

final apiClientProvider = Provider.autoDispose((ref) => ApiClient(Dio()));

final articleRepositoryProvider = Provider.autoDispose(
    (ref) => ArticleRepositoryImpl(ref.read(apiClientProvider)));

final articleListProvider = StateNotifierProvider.autoDispose<
    ArticleListViewModel, AsyncValue<List<Article>>>(
  (ref) => ArticleListViewModel(
    ref.read(articleRepositoryProvider),
  ),
);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ArticleListView(),
    );
  }
}
