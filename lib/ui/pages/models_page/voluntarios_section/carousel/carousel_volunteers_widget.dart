import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../../data/constants.dart';
import 'volunteer_slide.dart';

class CarouselVolunteers extends StatefulWidget {
  final dynamic voluntario;

  const CarouselVolunteers({Key? key, required this.voluntario})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarouselVolunteersState();
  }
}

class _CarouselVolunteersState extends State<CarouselVolunteers> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CarouselSlider(
        items: getPictures(widget.voluntario),
        carouselController: _controller,
        options: CarouselOptions(
            height: 350,
            autoPlay: true,
            aspectRatio: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: getPictures(widget.voluntario).asMap().entries.map((entry) {
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

  List<Widget> getPictures(voluntarios) {
    final List<Widget> _galleryWidget = [];

    for (var voluntario in voluntarios) {
      _galleryWidget.add(VolunteerSlide(
          item: voluntario['Picture']['data']['attributes']['url']));
    }

    return _galleryWidget;
  }
}
