import 'package:go_router/go_router.dart';
import 'package:se7ety/feature/splash/splash_screen.dart';
class AppRouter {
  static   GoRouter router = GoRouter(
    routes:[
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),

    ],
  );
}
