import 'package:flutter/material.dart';
import '../ui/layouts/main_layout.dart';
import '../ui/pages/about_us_page/about_us_page.dart';
import '../ui/pages/blog_page/blog_page.dart';
import '../ui/pages/communities_page/communities_page.dart';
import '../ui/pages/error_404_page.dart';
import '../ui/pages/friends_for_change_page/friends_for_change_page.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/join_page/join_page.dart';
import '../ui/pages/models_page/modelo_atencion_page.dart';
import '../ui/pages/ods_alignment_page/ods_alignment_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return fadeRoute(
            const MainLayout(
                view: HomePage(), pageTitle: 'Home', fullView: true),
            '/');

      case '/blog':
        return fadeRoute(
            const MainLayout(
                view: BlogPage(), pageTitle: 'Blog', fullView: false),
            '/blog');

      case '/conocenos':
        return fadeRoute(
            const MainLayout(
                view: AboutUsPage(), pageTitle: 'Conócenos', fullView: false),
            '/conocenos');

      case '/participa':
        return fadeRoute(
            const MainLayout(
                view: JoinPage(), pageTitle: 'Participa', fullView: false),
            '/participa');

      case '/alineacion-con-ODS':
        return fadeRoute(
            const MainLayout(
                view: OdsAlignmentPage(),
                pageTitle: 'Alineación con ODS',
                fullView: false),
            '/alineacion-con-ODS');

      case '/amigos-del-cambio':
        return fadeRoute(
            const MainLayout(
                view: FriendsForChangePage(),
                pageTitle: 'Amigos del cambio',
                fullView: false),
            '/amigos-del-cambio');

      case '/comunidades':
        return fadeRoute(
            const MainLayout(
                view: CommunitiesPage(),
                pageTitle: 'Comunidades',
                fullView: false),
            '/comunidades');

      case '/modelo-de-atencion':
        return fadeRoute(
            const MainLayout(
                view: ModeloPage(),
                pageTitle: 'Modelo de Atención',
                fullView: false),
            '/modelo-de-atencion');

      case '/404':
        return fadeRoute(const NoPageFoundView(), '/404');

      default:
        return fadeRoute(const NoPageFoundView(), '/404');
    }
  }

  static fadeRoute(Widget child, String routeName) {
    return PageRouteBuilder(
        settings: RouteSettings(name: routeName),
        pageBuilder: (_, __, ___) => child,
        transitionDuration: const Duration(milliseconds: 200),
        transitionsBuilder: (_, animation, __, ___) {
          return FadeTransition(opacity: animation, child: child);
        });
  }
}
