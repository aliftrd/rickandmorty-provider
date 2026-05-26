import 'package:flutter/material.dart';
import 'package:rickandmorty/core/di/injector.dart';
import 'package:rickandmorty/core/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return MaterialApp.router(
      routerConfig: appRouter.config(),
    );
  }
}
