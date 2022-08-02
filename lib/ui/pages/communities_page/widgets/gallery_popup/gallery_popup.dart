import 'package:flutter/material.dart';

import '../../../../../data/constants.dart';
import 'carousel_widget.dart';

class GalleryPopup extends StatelessWidget {
  final dynamic pictures;
  const GalleryPopup({Key? key, required this.pictures}) : super(key: key);

  //El slider de extensiones sigue pendiente
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        clipBehavior: Clip.antiAlias,
        contentPadding: const EdgeInsets.all(0.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(35.0))),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: Container(
            width: mobile(context)
                ? screenSize(context).width
                : maxWidth < screenSize(context).width
                    ? screenSize(context).width * 0.6
                    : screenSize(context).width * 0.8,
            height: screenSize(context).height,
            child: CarouselGallery(pictures: pictures),
          ),
        ));
  }
}
