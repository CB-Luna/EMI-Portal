import 'package:flutter/material.dart';

class IconTitleWidget extends StatelessWidget {
  final String? title;
  final String? titleLogo;
  final bool? titleCenter;

  const IconTitleWidget(
      {Key? key, this.title, this.titleLogo, this.titleCenter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Align(
          alignment:
              titleCenter != null ? Alignment.center : Alignment.centerLeft,
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              if (titleLogo != null) Image.network(titleLogo!, width: 45.0),
              const SizedBox(width: 10.0),
              if (title != null)
                Text(title!,
                    style: textTheme.headlineLarge,
                    textAlign: TextAlign.center),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }
}
