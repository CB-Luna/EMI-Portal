import 'package:flutter/material.dart';
import '../../data/constants.dart';

class NotFoundLayout extends StatelessWidget {
  final String slug;

  const NotFoundLayout({Key? key, required this.slug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 30, horizontal: mobile(context) ? 30.0 : 50.0),
        child: SizedBox(
          width: 400,
          height: screenSize(context).height * 0.64,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Recórcholis, parece que no encontramos ningún contenido como el que buscas, pero tenemos otras secciones que podrían ser de tu interés.",
                  style: textTheme(context).titleSmall,
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
