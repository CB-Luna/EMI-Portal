import 'package:flutter/material.dart';

import '../../../../../data/constants.dart';
import '../../../../../services/graphql_config.dart';

class AnimatedCover extends StatefulWidget {
  final String title;
  final dynamic pictures;
  final double cardSize;
  final Color cardColor;

  const AnimatedCover(
      {Key? key,
      required this.title,
      required this.pictures,
      required this.cardSize,
      required this.cardColor})
      : super(key: key);

  @override
  State<AnimatedCover> createState() => _AnimatedCoverState();
}

class _AnimatedCoverState extends State<AnimatedCover> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: Container(
        width: widget.cardSize,
        height: widget.cardSize,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                spreadRadius: -15,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.20),
                offset: const Offset(0, 35),
              )
            ]),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: Alignment.center,
          children: [
            animatedCover(),
            Container(
                decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    isHovered
                        ? Colors.transparent
                        : Colors.white.withOpacity(0.25),
                    isHovered ? colorsTheme(context).surface : widget.cardColor
                  ]),
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    Text(widget.title,
                        style: textTheme(context)
                            .labelLarge
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2),
                    Text(
                      widget.pictures.length > 1
                          ? "${widget.pictures.length} imágenes"
                          : "${widget.pictures.length} imagen",
                      style: textTheme(context)
                          .bodySmall
                          .copyWith(color: Colors.white),
                    )
                  ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });

  Widget animatedCover() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOutCubic,
      height: isHovered ? 400 : 300,
      width: 300,
      child: Container(
        width: 300,
        height: 300,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                colorFilter: isHovered
                    ? const ColorFilter.mode(
                        Colors.transparent, BlendMode.overlay)
                    : greyscale,
                image: NetworkImage(
                  setPath(widget.pictures[0]['attributes']['url']),
                )),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                spreadRadius: -15,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.20),
                offset: const Offset(0, 35),
              )
            ]),
      ),
    );
  }
}
