import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:new_clean_app/src/domain/models/article.dart';
import 'package:new_clean_app/src/domain/repositories/api_repository.dart';

import '../../../domain/models/request/breaking_news_request.dart';
import '../../../utils/constants/nums.dart';
import '../../../utils/resource/data_satate.dart';
import '../base/base_cubit.dart';

part 'remote_articles_state.dart';

class RemoteArticlesCubit extends BaseCubit<RemoteArticlesState,List<Article>> {
  final ApiRepository _apiRepository;

  RemoteArticlesCubit(this._apiRepository) : super(const RemoteArticlesLoading(),[]);

  int _page = 1;

  Future<void> getBreakingNewArticle()async{
    if(isBusy)return ;

    await run(() async{
      final response = await _apiRepository.getBreakingNewArticles(request: BreakingNewsRequest(page: _page));

      if(response is DataSuccess){
        final articles = response.data!.articles;
        final noMoreData = articles.length < defaultpageSize;

        data.addAll(articles);
        _page++;

        emit( RemoteArticlesSuccess(articles: data,noMoreData: noMoreData));
      }else{
        emit(RemoteArticlesFailed(error: response.error));
      }

    });

  }

}
