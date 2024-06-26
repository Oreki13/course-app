import 'package:auto_route/auto_route.dart';

import '../features/course/presentation/pages/course_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CourseRoute.page, initial: true),
      ];
}
