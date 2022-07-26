import 'package:flutter/material.dart';
import '../../../../data/constants.dart';

class DonationForm extends StatelessWidget {
  final dynamic formData;

  const DonationForm({Key? key, required this.formData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      verticalDirection: VerticalDirection.up,
      children: [
        FractionallySizedBox(
            widthFactor: mobile(context) ? 1.0 : 0.6,
            child: Column(children: const [Text("Aquí va el form wowowowo")]))
      ],
    );
  }
}
