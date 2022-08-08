import 'package:flutter/material.dart';
import '../../../classes/graphql_call.dart';
import '../../../classes/primary_row.dart';
import '../../../services/graphql/queries/query_home.dart';
import '../../widgets/rows_listview.dart';
import 'hero_section/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataCall(query: queryHome, page: homePage);
  }

  Widget homePage(result, [context]) {
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
