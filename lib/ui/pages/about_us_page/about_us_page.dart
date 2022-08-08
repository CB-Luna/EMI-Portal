import 'package:flutter/material.dart';
import '../../../classes/graphql_call.dart';
import '../../../classes/primary_row.dart';
import '../../../data/constants.dart';
import '../../../services/graphql/queries/query_aboutus.dart';
import '../../../services/graphql_config.dart';
import '../../widgets/row/row_widget.dart';
import '../../widgets/row/section_paragraph/paragraph.dart';
import '../../widgets/section_aliados.dart';
import 'values_section/values_section.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataCall(query: queryAboutUs, page: aboutUsPage);
  }

  Widget aboutUsPage(result, [context]) {
    var aboutUsData = result.data?['webAboutUs']['data']['attributes'];

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Column(
        children: [
          //Sección: sobre EM
          PrimaryRowWidget(
              rowContent: setRow(aboutUsData['Introduction']),
              colored: true,
              pictureHeight: 550),

          //Sección: Objetivo General
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: PrimaryParagraphArea(
                textCenter: true,
                title: aboutUsData['Goal']['Title'],
                titleLogo: setPath(
                    aboutUsData['Goal']['Icon']['data']['attributes']['url']),
                paragraph: aboutUsData['Goal']['Description']),
          ),

          //Sección: Valores
          ValuesSection(content: aboutUsData['Values']),

          //Sección: Aliados
          AliadosSection(content: aboutUsData['Convenio'])
        ],
      ),
    );
  }
}
