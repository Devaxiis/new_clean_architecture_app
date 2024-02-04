// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BreakingNewsUI.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BreakingNewsUI(),
      );
    }
  };
}

/// generated route for
/// [BreakingNewsUI]
class BreakingNewsUI extends PageRouteInfo<void> {
  const BreakingNewsUI({List<PageRouteInfo>? children})
      : super(
          BreakingNewsUI.name,
          initialChildren: children,
        );

  static const String name = 'BreakingNewsUI';

  static const PageInfo<void> page = PageInfo<void>(name);
}
