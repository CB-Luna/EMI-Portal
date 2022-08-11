import 'package:flutter/material.dart';
import '../../../classes/graphql_call.dart';
import '../../../data/constants.dart';
import '../../../services/graphql/queries/query_join.dart';

import '../../widgets/row_multipicture.dart';
import '../../widgets/section_aliados.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataCall(query: queryJoin, page: joinPage);
  }

  Widget joinPage(result, context) {
    var joinData = result.data?['webJoin']['data']['attributes'];
    var projectData = joinData['project']['data']['attributes'];

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Column(
        children: [
          //Sección: Jóvenes por México

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: RowMultipicture(
                title: projectData['Name'],
                icon: projectData['Icon']['data']['attributes']['url'],
                description: projectData['Description'],
                pictures: projectData['RelatedODS']['data']),
          ),

          //Sección: Aliados
          AliadosSection(content: joinData['Convenio'])
        ],
      ),
    );
  }
}
