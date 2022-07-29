import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../data/constants.dart';
import '../../../services/graphql/queries/query_footer.dart';
import '../../../services/graphql_config.dart';
import '../components/buttons/custom_iconbutton.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(
          document: gql(queryFooter),
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

          return footer(context, result);
        });
  }

  Widget footer(BuildContext context, result) {
    var footerData = result.data?['webFooter']['data']['attributes'];
    var socialMedia = footerData['SocialMedia'];
    var iconColors = themeColorsList(context);

    return Container(
      color: colorsTheme(context).surface,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          //Sección de links de contacto
          Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                FractionallySizedBox(
                  widthFactor: mobile(context) ? 1.0 : 0.35,
                  child: Align(
                    alignment: mobile(context)
                        ? Alignment.center
                        : Alignment.centerLeft,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        for (var contact in footerData['Contact'])
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomIconButton(
                                  text: contact['ButtonText'],
                                  textColor: Colors.white,
                                  iconColor: colorsTheme(context).primary,
                                  buttonColor: Colors.transparent,
                                  icon: contact['ButtonIcon']['data']
                                      ['attributes']['url'],
                                  function: () =>
                                      openNewTab(contact['ButtonLink'])),
                              if (contact != footerData['Contact'].last)
                                const SizedBox(
                                  height: 20.0,
                                  child: VerticalDivider(
                                    width: 20,
                                    color: Colors.white,
                                  ),
                                )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: mobile(context) ? 1.0 : 0.3,
                  alignment: Alignment.center,
                  child: Image.network(
                      setPath(footerData['LogoSimple']['data']['attributes']
                          ['url']),
                      height: 80),
                ),
                FractionallySizedBox(
                  widthFactor: mobile(context) ? 1.0 : 0.35,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: mobile(context)
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.end,
                      children: [
                        for (var social in socialMedia)
                          Container(
                            width: 25,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: iconColors[socialMedia.indexOf(social) %
                                      iconColors.length]
                                  .withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                                padding: const EdgeInsets.all(1),
                                icon: SvgPicture.network(
                                    setPath(social['ButtonIcon']['data']
                                        ['attributes']['url']),
                                    color: Colors.white,
                                    height: 12),
                                onPressed: () {
                                  openNewTab(social['ButtonLink']);
                                }),
                          ),
                      ]),
                )
              ]),
          const Divider(
            height: 1.0,
            color: Colors.white,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(footerData['Copyright'],
                style: const TextStyle(color: Colors.white),
                textAlign:
                    mobile(context) ? TextAlign.center : TextAlign.center),
          ),
        ],
      ),
    );
  }
}
