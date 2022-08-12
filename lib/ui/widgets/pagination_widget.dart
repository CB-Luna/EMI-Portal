import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../data/constants.dart';

class PaginationWidget extends StatefulWidget {
  final List<Widget> items;
  final int itemsPerPage;

  const PaginationWidget(
      {Key? key, required this.items, required this.itemsPerPage})
      : super(key: key);

  @override
  _PaginationWidgetState createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends State<PaginationWidget> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    int numPages = getNumPages(widget.items.length, widget.itemsPerPage);
    var pages = List.generate(numPages, (index) {
      // Se obtiene el rango de los elementos que deben estar por página de la siguiente manera:
      var lowerRange = widget.itemsPerPage * (index + 1) - widget.itemsPerPage;

      var upperRange = widget.itemsPerPage * (index + 1);

      var filteredList = widget.items
          .where((e) =>
              widget.items.indexOf(e) >= lowerRange &&
              widget.items.indexOf(e) < upperRange)
          .toList();

      return pageContent(filteredList);
    });

    return Column(
      children: [
        Container(
          child: pages[_currentPage],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: NumberPaginator(
            numberPages: numPages,
            buttonSelectedBackgroundColor:
                colorsTheme(context).primary.withOpacity(0.5),
            buttonSelectedForegroundColor: Colors.white,
            onPageChange: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget pageContent(items) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mobile(context) ? 0 : 30),
      child: Wrap(
          runAlignment: WrapAlignment.start,
          alignment: WrapAlignment.start,
          children: items),
    );
  }

  getNumPages(itemsLength, itemsPerPage) {
    int numPages = 0;
    var result = (itemsLength / itemsPerPage);
    result % 1 == 0
        ? numPages = result.toInt()
        : numPages = (result + 1).toInt();

    return numPages;
  }
}
