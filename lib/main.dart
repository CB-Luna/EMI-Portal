import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:emi_portal/theme/theme_data.dart';
import 'locator.dart';
import 'routes/route_generator.dart';
import 'services/graphql_config.dart';
import 'services/navigation_service.dart';

void main() {
  setupLocator();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: GraphQLConfiguration.clientToQuery(), child: const MyApp());
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
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
