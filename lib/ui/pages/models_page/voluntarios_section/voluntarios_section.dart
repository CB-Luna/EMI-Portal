import 'package:flutter/material.dart';

import '../../../widgets/icon_title.dart';
import 'carousel/carousel_volunteers_widget.dart';

class VoluntariosSection extends StatelessWidget {
  final dynamic data;

  const VoluntariosSection({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
          IconTitleWidget(title: data['Title'], titleCenter: true),
          CarouselVolunteers(voluntario: data['Voluntarios'])
        ],
      ),
    );
  }
}
