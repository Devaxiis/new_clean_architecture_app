

import 'package:new_clean_app/src/utils/resource/data_satate.dart';

import '../models/request/breaking_news_request.dart';
import '../models/response/breaking_news_response.dart';

abstract class ApiRepository{
  Future<DataState<BreakingNewsResponse>> getBreakingNewArticles({
    required BreakingNewsRequest request,
});
}