

import '../../domain/models/request/breaking_news_request.dart';
import '../../domain/models/response/breaking_news_response.dart';
import '../../domain/repositories/api_repository.dart';
import '../../utils/resource/data_satate.dart';
import '../data_source/remote/base/base_api_repository.dart';
import '../data_source/remote/news_api_service.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository{
  final NewsApiService _newsApiService;

  ApiRepositoryImpl(this._newsApiService);


  @override
  Future<DataState<BreakingNewsResponse>> getBreakingNewArticles({required BreakingNewsRequest request}) {
    return getStateOf<BreakingNewsResponse>(
        request: ()=> _newsApiService.getBreakingNewsArticles(
          apiKey: request.apiKey,
          country: request.country,
          category: request.category,
          page: request.page,
          pageSize: request.pageSize,
        )
    );
  }
  
}