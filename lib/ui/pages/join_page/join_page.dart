import 'package:flutter/material.dart';
import '../../../classes/graphql_call.dart';
import '../../../data/constants.dart';
import '../../../services/graphql/queries/query_join.dart';
import '../../../services/graphql_config.dart';
import '../../widgets/basic_picture.dart';
import '../../widgets/row/section_paragraph/paragraph.dart';
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
    bool isMobile = mobile(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Column(
        children: [
          //Sección: Jóvenes por México
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                FractionallySizedBox(
                  widthFactor: isMobile ? 1 : 0.6,
                  child: PrimaryParagraphArea(
                      title: projectData['Name'],
                      titleLogo: setPath(
                          projectData['Icon']['data']['attributes']['url']),
                      paragraph: projectData['Description']),
                ),

                //Sección de ODS Relacionados al proyecto
                FractionallySizedBox(
                  widthFactor: isMobile ? 1 : 0.4,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      for (var ods in projectData['RelatedODS']['data'])
                        BasicPicture(
                          picture: ods['attributes']['url'],
                        )
                    ],
                  ),
                )
              ],
            ),
          ),

          //Sección: Valores

          //Sección: Aliados
          AliadosSection(content: joinData['Convenio'])
        ],
      ),
    );
  }
}
