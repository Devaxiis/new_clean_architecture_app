
import 'package:auto_route/auto_route.dart';

import '../../presentation/ui/breaking_news_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: BreakingNewsUI.page,initial: true),
  ];
}

