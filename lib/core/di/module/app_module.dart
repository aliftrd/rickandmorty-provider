import 'package:injectable/injectable.dart';
import 'package:rickandmorty/core/router/router.dart';

@module
abstract class AppModule {
  @singleton
  AppRouter get appRouter => AppRouter();
}
