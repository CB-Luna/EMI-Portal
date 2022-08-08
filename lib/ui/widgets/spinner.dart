import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../data/constants.dart';

class Spinner extends StatelessWidget {
  const Spinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize(context).height * 0.6,
      child: Center(
          child: SpinKitChasingDots(
              size: 80, color: colorsTheme(context).primary)),
    );
  }
}
