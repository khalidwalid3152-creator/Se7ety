import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:se7ety/feature/auth/data/user_type.dart';
import 'package:se7ety/feature/auth/presentation/cubit/cubit_auth.dart';
import 'package:se7ety/feature/auth/presentation/pages/Login_screen.dart';
import 'package:se7ety/feature/auth/presentation/pages/register_screen.dart';
import 'package:se7ety/feature/intro/onboarding/onboarding.dart';
import 'package:se7ety/feature/intro/splash/splash_screen.dart';
import 'package:se7ety/feature/intro/welcome/welcome_screen.dart';

class AppRouter {
  static const String welcome = '/welcome';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(path: welcome, builder: (context, state) => WelcomeScreen()),
      GoRoute(path: onboarding, builder: (context, state) => Onboarding()),
      GoRoute(path: login, builder: (context, state) => BlocProvider(create: (context)=>CubitAuth(),
      child: LoginScreen(usertype: state.extra as UserType,))),
      GoRoute(path: register, builder: (context, state) => BlocProvider(create: (context) =>CubitAuth(),
      child: RegisterScreen(usertype: state.extra as UserType,))),


    ],
  );
}
