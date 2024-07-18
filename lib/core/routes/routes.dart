import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

import '../../features/cat_detail/presentation/pages/pages.dart';
import '../../features/dashboard_home/presentation/pages/pages.dart';

List<GetPage<dynamic>> get getRoutes {
  const Duration transitionDuration = Duration(milliseconds: 350);
  return <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: '/onboarding_page',
      page: LandingPage.new,
      middlewares: <GetMiddleware>[GetMiddleware()],
    ),
    GetPage<dynamic>(
      name: '/detail_page',
      page: CatDetail.new,
      middlewares: <GetMiddleware>[GetMiddleware()],
      transitionDuration: transitionDuration,
    ),
  ];
}
