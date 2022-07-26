import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../classes/primary_row.dart';
import '../../../services/graphql/queries/query_home.dart';
import '../../widgets/rows_listview.dart';
import 'hero_section/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document: gql(queryHome),
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

          return homePage(result);
        });
  }

  Widget homePage(result) {
    List<PrimaryRow> rows = [];

    var fullHomeData = result.data?['webHome']['data']['attributes'];
    var homeS1Data = fullHomeData['VideoHeader'];
    var homeS3Data = fullHomeData['Rows'];

    for (var row in homeS3Data) {
      rows.add(setRow(row));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeroSection(content: homeS1Data),
        RowsListWidget(rows: rows),
      ],
    );
  }
}
