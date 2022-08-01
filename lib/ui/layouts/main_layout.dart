import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import '../../providers/mobilemenu_provider.dart';
import '../../services/graphql/queries/query_menu.dart';

import '../widgets/components/backgrounds/main_background.dart';
import '../widgets/menu/menu.dart';
import '../widgets/menu/mobile/mobile_menu.dart';
import 'basic_page_layout.dart';

class MainLayout extends StatelessWidget {
  final Widget view;
  final String pageTitle;
  final bool fullView;

  const MainLayout(
      {Key? key,
      required this.view,
      required this.pageTitle,
      required this.fullView})
      : super(key: key);

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
            return const Text('');
          }

          return mainLayout(result, context);
        });
  }

  Widget mainLayout(menuResult, context) {
    final menuProvider = Provider.of<MenuProvider>(context);

    return Stack(
      fit: StackFit.loose,
      children: [
        MobileMenu(
            menuContent: menuResult.data?['webMenu']['data']['attributes']),
        GestureDetector(
          onTap: () {
            menuProvider.closeMenu();
          },
          child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: menuProvider.opener),
              duration: const Duration(milliseconds: 250),
              builder: (_, double val, __) {
                return (Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, 200 * val)
                      ..rotateY((pi / 6) * val),
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        const MainBackground(),
                        Scaffold(
                          //Necesario para ver el fondo (ps sí)
                          backgroundColor: Colors.transparent,
                          body: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MenuContainer(
                                    menuContent: menuResult.data?['webMenu']
                                        ['data']['attributes']),
                                Flexible(
                                    child: BasicPageLayout(
                                        pageTitle: pageTitle,
                                        content: view,
                                        fullView: fullView)),
                              ]),
                        ),
                      ],
                    )));
              }),
        ),
      ],
    );
  }
}
