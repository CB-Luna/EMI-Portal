import 'package:flutter/material.dart';
import 'package:emi_portal/services/graphql/queries/query_odsalignment.dart';
import '../../../data/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../widgets/basic_picture.dart';
import '../../widgets/components/backgrounds/glass.dart';
import '../../widgets/row/section_paragraph/paragraph.dart';
import '../../widgets/table.dart';

class OdsAlignmentPage extends StatelessWidget {
  const OdsAlignmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document: gql(queryODSAlignment),
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

          return odsPage(result, context);
        });
  }

  Widget odsPage(result, context) {
    var odsAlignData = result.data?['webOdsAlignment']['data']['attributes'];
    var compromisos = odsAlignData['PgpSection']['Compromisos']['data'];

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: mobile(context) ? 20.0 : 50.0),
        child: Column(
          children: [
            //Sección de compromisos con ONU
            PrimaryParagraphArea(
                paragraph: odsAlignData['Description'], textCenter: true),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TableWidget(tableData: odsAlignData['OdsTable']),
            ),

            const SizedBox(height: 30),

            //Sección de compromisos con CEM
            PrimaryParagraphArea(
                paragraph: odsAlignData['PgpSection']['Description'],
                textCenter: true),
            Container(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.only(bottom: 50.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 30,
                      spreadRadius: -15,
                      color: colorsTheme(context).primary.withOpacity(0.20),
                      offset: const Offset(0, 20),
                    )
                  ]),
              child: GlassMorphism(
                color: colorsTheme(context).primary,
                start: 0.55,
                end: 0.30,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      for (var compromiso in compromisos)
                        BasicPicture(picture: compromiso['attributes']['url'])
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
