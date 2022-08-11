import 'package:fluro/fluro.dart';

import '../classes/blog_post.dart';
import '../ui/layouts/main_layout.dart';
import '../ui/pages/about_us_page/about_us_page.dart';
import '../ui/pages/blog_page/blog_page.dart';
import '../ui/pages/communities_page/communities_page.dart';
import '../ui/pages/friends_for_change_page/friends_for_change_page.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/join_page/join_page.dart';
import '../ui/pages/models_page/modelo_atencion_page.dart';
import '../ui/pages/ods_alignment_page/ods_alignment_page.dart';

class TheFluroRouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    TheFluroRouter().defineRoute('/', _homeHandler);
    TheFluroRouter().defineRoute('/blog', _blogHandler);
    TheFluroRouter().defineRoute('/blog/:slug', _blogPostHandler);
    TheFluroRouter().defineRoute('/conocenos', _conocenosHandler);
    TheFluroRouter().defineRoute('/participa', _participaHandler);
    TheFluroRouter().defineRoute('/alineacion-con-ods', _alineacionODSHandler);
    TheFluroRouter().defineRoute('/amigos-del-cambio', _amigosCambioHandler);
    TheFluroRouter().defineRoute('/comunidades', _comunidadesHandler);
    TheFluroRouter().defineRoute('/modelo-de-atencion', _modeloAtencionHandler);
  }

  defineRoute(route, handler) {
    return router.define(route,
        handler: handler, transitionType: TransitionType.fadeIn);
  }

  // H A N D L E R S

  // Home Handler
  static final Handler _homeHandler = Handler(
    handlerFunc: (context, params) =>
        const MainLayout(view: HomePage(), pageTitle: 'Home', fullView: true),
  );

  // Blog Handler
  static final Handler _blogHandler = Handler(handlerFunc: (context, params) {
    return const MainLayout(
        view: BlogPage(), pageTitle: 'Blog', fullView: false);
  });

  // Blog Post Handler
  static final Handler _blogPostHandler =
      Handler(handlerFunc: (context, params) {
    return MainLayout(
        view: getPostPage(context, params['slug']![0]),
        pageTitle: 'Post',
        fullView: true);
  });

  // Conócenos Handler
  static final Handler _conocenosHandler = Handler(
    handlerFunc: (context, params) => const MainLayout(
        view: AboutUsPage(), pageTitle: 'Conócenos', fullView: false),
  );

  // Conócenos Handler
  static final Handler _participaHandler = Handler(
    handlerFunc: (context, params) => const MainLayout(
        view: JoinPage(), pageTitle: 'Participa', fullView: false),
  );

  // Alineación con ODS Handler
  static final Handler _alineacionODSHandler = Handler(
    handlerFunc: (context, params) => const MainLayout(
        view: OdsAlignmentPage(),
        pageTitle: 'Alineación con ODS',
        fullView: false),
  );

  // Amigos del Cambio Handler
  static final Handler _amigosCambioHandler = Handler(
    handlerFunc: (context, params) => const MainLayout(
        view: FriendsForChangePage(),
        pageTitle: 'Amigos del Cambio',
        fullView: false),
  );

  // Comunidades Handler
  static final Handler _comunidadesHandler = Handler(
    handlerFunc: (context, params) => const MainLayout(
        view: CommunitiesPage(), pageTitle: 'Comunidades', fullView: false),
  );

  // Modelo de Atención Handler
  static final Handler _modeloAtencionHandler = Handler(
    handlerFunc: (context, params) => const MainLayout(
        view: ModeloPage(), pageTitle: 'Modelo de Atención', fullView: false),
  );
}
