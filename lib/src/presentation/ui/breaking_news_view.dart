import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_clean_app/src/domain/models/article.dart';

import '../../utils/extensions/scroll_controller.dart';
import '../cubit/remote_articles/remote_articles_cubit.dart';

@RoutePage()
class BreakingNewsUI extends StatefulWidget {
  const BreakingNewsUI({super.key});

  @override
  State<BreakingNewsUI> createState() => _BreakingNewsUIState();
}

class _BreakingNewsUIState extends State<BreakingNewsUI> {

  @override
  Widget build(BuildContext context) {
    final remoteArticleCubit = BlocProvider.of<RemoteArticlesCubit>(context);
    final scrollController = useScrollController();


    useEffect(() {
      scrollController.onScrollEndListener(() {
        remoteArticleCubit.getBreakingNewArticle();
      });
      return scrollController.dispose;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily News',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<RemoteArticlesCubit, RemoteArticlesState>(
          builder: (_, state) {
            switch (state.runtimeType) {
              case RemoteArticlesLoading:
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              case RemoteArticlesFailed:
                return const Center(
                  child: Icon(Icons.refresh),
                );
              case RemoteArticlesSuccess:
                return _buildArticles(
                    scrollController, state.articles, state.noMoreData);
              default:
                const SizedBox();
            }
            return SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildArticles(
      ScrollController scrollController,
      List<Article> articles,
      bool noMoreData,
      ) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
              height: 20,
              alignment: Alignment.center,
              child: Text(
                '${articles[index]}',
                style: const TextStyle(color: Colors.black),
              ),
            ),
            childCount: articles.length,
          ),
        ),
        if (!noMoreData)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 14, bottom: 32),
              child: CupertinoActivityIndicator(),
            ),
          )
      ],
    );
  }
}
