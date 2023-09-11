import 'package:flutter/material.dart';
import 'package:movies_app/common/common.dart';
import 'package:movies_app/ui/screen/login/login_screen.dart';
import 'package:movies_app/ui/ui.dart';

class RouteConfig {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    final dynamic args = routeSettings.arguments;
    switch (routeSettings.name) {
      case RouteName.splash:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
          ),
          builder: (_) => const SplashScreen(),
        );
        case RouteName.login:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
          ),
          builder: (_) => const LoginScreen(),
        );
        case RouteName.home:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
          ),
          builder: (_) => const HomeScreen(),
        );
        case RouteName.movieDetail:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
          ),
          builder: (_) {
            MovieModel movie = args as MovieModel;
            return MovieDetailScreen(movie: movie);
          },
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Halaman Tidak Ditemukan'),
            ),
          ),
        );
    }
  }
}
