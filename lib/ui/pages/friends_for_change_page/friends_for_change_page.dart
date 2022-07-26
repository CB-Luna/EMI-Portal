import 'package:flutter/material.dart';
import '../../../data/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../services/graphql/queries/query_friendschange.dart';

import 'Section_Be_Friend/section_be_friend.dart';
import 'section_patrocinios/section_patrocinios.dart';

class FriendsForChangePage extends StatelessWidget {
  const FriendsForChangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document: gql(queryFriendsChange),
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

          return friendsPage(result, context);
        });
  }

  Widget friendsPage(result, context) {
    var pageData = result.data?['webFriendsChange']['data']['attributes'];

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: [
            SectionBeFriends(sectionData: pageData['Amigos']),
            SectionPatrocinios(sectionData: pageData['Patrocinios'])
          ],
        ),
      ),
    );
  }
}
