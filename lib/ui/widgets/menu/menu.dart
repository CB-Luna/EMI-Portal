import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../services/graphql/queries/query_menu.dart';
import 'menu_bars/menu_main_bar/menu_main_bar.dart';
import 'menu_bars/menu_services_bar.dart';

class MenuContainer extends StatelessWidget {
  const MenuContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document: gql(queryMenu),
          pollInterval: const Duration(seconds: 0),
        ),
        builder: (
          QueryResult result, {
          refetch,
          fetchMore,
        }) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Text('Loading');
          }

          return menu(result);
        });
  }

  Widget menu(result) {
    var menuData = result.data?['webMenu']['data']['attributes'];

    return Column(children: [
      MenuMainBar(
          logo: menuData['logo']['data']['attributes']['url'],
          menu: menuData['MainMenu'],
          featBtn: menuData['FeaturedButton']),
      MenuServicesBar(submenu: menuData['SubMenu']),
    ]);
  }
}
