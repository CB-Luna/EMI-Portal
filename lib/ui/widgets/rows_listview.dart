import 'package:flutter/material.dart';
import 'package:emi_portal/ui/widgets/row/row_widget.dart';

import '../../data/constants.dart';

class RowsListWidget extends StatelessWidget {
  final List<dynamic> rows;

  const RowsListWidget({Key? key, required this.rows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pictureColors = themeColorsList(context);

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: rows.length,
        itemBuilder: (_, int index) {
          index == 0
              ? rows[index].picAtStart = true
              : index % 2 == 0
                  ? rows[index].picAtStart = true
                  : rows[index].picAtStart = false;

          rows[index].pictureColor =
              pictureColors[index % pictureColors.length];

          return PrimaryRowWidget(rowContent: rows[index]);
        });
  }
}
