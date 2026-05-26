import 'package:auto_route/auto_route.dart';
import 'package:rickandmorty/core/router/router.gr.dart';

export 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: CharacterRoute.page, initial: true),
  ];
}
