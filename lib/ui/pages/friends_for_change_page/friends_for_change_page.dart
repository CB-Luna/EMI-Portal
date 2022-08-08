import 'package:flutter/material.dart';
import '../../../classes/graphql_call.dart';
import '../../../data/constants.dart';
import '../../../services/graphql/queries/query_friendschange.dart';

import 'Section_Be_Friend/section_be_friend.dart';
import 'section_patrocinios/section_patrocinios.dart';

class FriendsForChangePage extends StatelessWidget {
  const FriendsForChangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataCall(query: queryFriendsChange, page: friendsPage);
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
            SectionPatrocinios(
                sectionData: pageData['Patrocinios'], form: pageData['Form'])
          ],
        ),
      ),
    );
  }
}
