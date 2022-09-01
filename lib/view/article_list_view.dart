import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/article.dart';
import '../main.dart';
import 'article_list_tile.dart';

class ArticleListView extends HookConsumerWidget {
  const ArticleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleListState = ref.watch(articleListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qiita Articles'),
      ),
      body: RefreshIndicator(
        child: _buildListView(articleListState),
        onRefresh: () => ref.read(articleListProvider.notifier).fetchArticles(),
      ),
    );
  }

  Widget _buildListView(AsyncValue<List<Article>> articlesListState) {
    return articlesListState.when(
      data: (articlesList) => ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemBuilder: (context, index) {
            return ArticleListTile(article: articlesList[index]);
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: articlesList.length),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
    );
  }
}
