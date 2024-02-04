import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'src/config/router/app_router.dart';
import 'src/config/theme/app_theme.dart';

Future<void> main() async{
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: Apptheme.light,
        routerConfig: _appRouter.config(),
        // routerDelegate: _appRouter.delegate(),
        // routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}

