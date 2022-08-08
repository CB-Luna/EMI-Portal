import 'package:flutter/material.dart';
import '../../../classes/graphql_call.dart';
import '../../../data/constants.dart';
import '../../../services/graphql/queries/query_communities.dart';
import 'widgets/gallery_card/gallery_card_widget.dart';

class CommunitiesPage extends StatelessWidget {
  const CommunitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataCall(query: queryCommunity, page: communityPage);
  }

  Widget communityPage(result, context) {
    var communities = result.data?['communities']['data'];
    var cardColors = themeColorsList(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: mobile(context) ? 10.0 : 50.0),
            child: Wrap(
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  for (var community in communities)
                    GalleryCard(
                        title: community['attributes']['Title'],
                        pictures: community['attributes']['Gallery']['data'],
                        cardColor: cardColors[
                            communities.indexOf(community) % cardColors.length])
                ]),
          )
        ],
      ),
    );
  }
}
