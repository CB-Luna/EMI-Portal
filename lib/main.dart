import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:emi_portal/theme/theme_data.dart';
import 'package:provider/provider.dart';
import 'locator.dart';
import 'providers/blog_provider.dart';
import 'providers/mobilemenu_provider.dart';
import 'routes/router.dart';
import 'services/graphql_config.dart';
import 'services/navigation_service.dart';

void main() {
  setupLocator();
  TheFluroRouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuProvider>(create: (_) => MenuProvider()),
        ChangeNotifierProvider<BlogProvider>(
            create: (_) => BlogProvider(), lazy: false)
      ],
      child: GraphQLProvider(
          client: GraphQLConfiguration.clientToQuery(), child: const MyApp()),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Encuentro con México',
      theme: defaultTheme,
      initialRoute: '/',
      onGenerateRoute: TheFluroRouter.router.generator,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
