import 'package:flutter/material.dart';
//import 'package:graphql_flutter/graphql_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorsTheme = Theme.of(context).colorScheme;
    // return Query(
    //     options: QueryOptions(
    //       document: gql("queryFooter"),
    //       pollInterval: const Duration(seconds: 0),
    //     ),
    //     builder: (
    //       QueryResult result, {
    //       refetch,
    //       fetchMore,
    //     }) {
    //       if (result.hasException) {
    //         return Text(result.exception.toString());
    //       }

    //       if (result.isLoading) {
    //         return const Text('Loading');
    //       }

    //       return footer(result, colorsTheme);
    //     });
    return footer(colorsTheme);
  }

  Widget footer(colorsTheme) {
    // var fullFooterData = result.data?['rtapWebFooter']['data']['attributes'];
    // var footerS1Data =
    //     fullFooterData['rtap_web_f_1_sect']['data']['attributes'];

    var socialMedia = ['facebook', 'twitter', 'instagram'];
    return Container(
      color: colorsTheme.surface,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text("logo"),
          const Divider(
            color: Colors.white,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.mail, size: 14),
                        ),
                        TextSpan(
                          text: "mail",
                        ),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    width: 2.0,
                    color: Colors.white,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.phone, size: 14),
                        ),
                        TextSpan(
                          text: "phone number",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(mainAxisSize: MainAxisSize.min, children: [
              for (var social in socialMedia)
                Text(social, style: const TextStyle(color: Colors.white))
            ]),
            const Text("Copyright", style: TextStyle(color: Colors.white))
          ])
        ],
      ),
    );
  }
}
