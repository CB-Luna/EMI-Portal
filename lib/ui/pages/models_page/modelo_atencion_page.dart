import 'package:flutter/material.dart';
import '../../../classes/graphql_call.dart';
import '../../../classes/primary_row.dart';
import '../../../data/constants.dart';
import '../../../services/graphql/queries/query_modelo.dart';
import '../../widgets/row/row_widget.dart';
import '../../widgets/row_multipicture.dart';
import 'voluntarios_section/voluntarios_section.dart';

class ModeloPage extends StatelessWidget {
  const ModeloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataCall(query: queryModelo, page: modeloPage);
  }

  Widget modeloPage(result, context) {
    var modeloData = result.data?['webModelo']['data']['attributes'];
    var ambitosSection = modeloData['Ambitos'];
    var volsSection = modeloData['Voluntarios'];

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Column(
        children: [
          //Sección: Introducción
          PrimaryRowWidget(
              rowContent: setRow(modeloData['Introduccion']),
              colored: true,
              pictureHeight: 550),

          //Sección: Ámbitos de trabajo
          for (var ambito in ambitosSection['Ambitos']['data'])
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
              child: RowMultipicture(
                  title: ambito['attributes']['Name'],
                  icon: ambito['attributes']['Icon']['data']['attributes']
                      ['url'],
                  description: ambito['attributes']['Description'],
                  pictures: ambito['attributes']['RelatedODS']['data'],
                  rtl:
                      ambitosSection['Ambitos']['data'].indexOf(ambito) % 2 == 0
                          ? null
                          : true),
            ),

          // Sección: Voluntarios
          VoluntariosSection(data: volsSection)
        ],
      ),
    );
  }
}
