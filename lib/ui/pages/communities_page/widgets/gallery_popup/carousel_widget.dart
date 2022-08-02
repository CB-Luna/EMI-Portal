import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../../data/constants.dart';
import 'carousel_slide.dart';

class CarouselGallery extends StatefulWidget {
  final dynamic pictures;

  const CarouselGallery({Key? key, required this.pictures}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselGalleryState();
  }
}

class _CarouselGalleryState extends State<CarouselGallery> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CarouselSlider(
        items: getPictures(widget.pictures),
        carouselController: _controller,
        options: CarouselOptions(
            height: mobile(context) ? null : screenSize(context).height * 0.75,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: getPictures(widget.pictures).asMap().entries.map((entry) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : colorsTheme(context).primary)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            ),
          );
        }).toList(),
      ),
    ]);
  }

  List<Widget> getPictures(pictures) {
    final List<Widget> _galleryWidget = [];

    for (var picture in pictures) {
      _galleryWidget.add(CarouselSlide(item: picture['attributes']['url']));
    }

    return _galleryWidget;
  }
}
