import 'package:flutter/material.dart';
import '../../data/constants.dart';
import 'basic_picture.dart';
import 'components/backgrounds/glass.dart';

class TableWidget extends StatelessWidget {
  final dynamic tableData;

  const TableWidget({Key? key, required this.tableData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projects = tableData['projects']['data'];
    final cellColors = themeColorsList(context);

    getColor(element) {
      return cellColors[projects.indexOf(element) % cellColors.length];
    }

    return Table(
      columnWidths: const {
        0: FractionColumnWidth(0.4),
        1: FractionColumnWidth(0.6)
      },
      children: [
        //Cabecera de la tabla
        TableRow(
          decoration: BoxDecoration(
            color: colorsTheme(context).surface,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          children: <Widget>[
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: titleText(tableData['Header1'], Colors.white, 22)),
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            left: BorderSide(color: Colors.white, width: 2))),
                    child: titleText(tableData['Header2'], Colors.white, 22))),
          ],
        ),

        //Contenido repeater de la tabla
        for (var project in projects)
          TableRow(
            //decoration: BoxDecoration(color: Colors.white),
            children: <Widget>[
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.fill,
                  child: GlassMorphism(
                      start: 0.35,
                      end: 0.25,
                      color: getColor(project),
                      child: Center(
                          child: titleText(project['attributes']['Name'],
                              colorsTheme(context).surface, 20)))),
              TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    padding: mobile(context)
                        ? const EdgeInsets.all(8.0)
                        : const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(
                                color: getColor(project), width: 1.5),
                            right: BorderSide(
                                color: getColor(project), width: 1.5))),
                    child: Wrap(alignment: WrapAlignment.center, children: [
                      for (var ods in project['attributes']['RelatedODS']
                          ['data'])
                        BasicPicture(picture: ods['attributes']['url']),
                    ]),
                  ))
            ],
          ),
      ],
    );
  }
}

Widget titleText(text, txtColor, fontSize) {
  return Text(
    text,
    style: TextStyle(
        color: txtColor, fontSize: fontSize, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
  );
}
