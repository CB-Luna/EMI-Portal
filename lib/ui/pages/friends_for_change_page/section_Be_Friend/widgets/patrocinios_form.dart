import 'package:flutter/material.dart';

import '../../../../../data/constants.dart';

class PatrociniosForm extends StatefulWidget {
  const PatrociniosForm({
    Key? key,
  }) : super(key: key);

  @override
  State<PatrociniosForm> createState() => _PatrociniosFormState();
}

class _PatrociniosFormState extends State<PatrociniosForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: buildInputDecoration(context,
                    label: "Nombre", placeholder: "Placeholder", icon: ""),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ],
          ),
        ));
  }
}

InputDecoration buildInputDecoration(context,
    {required String label,
    required String placeholder,
    required String icon}) {
  return InputDecoration(
      fillColor: colorsTheme(context).surface.withOpacity(0.05),
      focusColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      border: OutlineInputBorder(
          gapPadding: 05.0,
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(
              color: colorsTheme(context).tertiary.withOpacity(0.25))),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(
              color: colorsTheme(context).surface.withOpacity(0.25))),
      filled: true,
      hintText: placeholder,
      hintStyle: textTheme(context).bodyMedium,
      labelText: label,
      floatingLabelStyle: textTheme(context)
          .bodyLarge
          .copyWith(color: colorsTheme(context).primary),
      labelStyle: textTheme(context)
          .bodyLarge
          .copyWith(color: colorsTheme(context).surface.withOpacity(0.5)));
}
