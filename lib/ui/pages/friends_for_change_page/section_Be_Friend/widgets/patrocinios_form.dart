import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../../data/constants.dart';
import '../../../../../services/graphql_config.dart';

class PatrociniosForm extends StatefulWidget {
  const PatrociniosForm({Key? key, required this.form}) : super(key: key);

  final dynamic form;

  @override
  State<PatrociniosForm> createState() => _PatrociniosFormState();
}

class _PatrociniosFormState extends State<PatrociniosForm> {
  final _formKey = GlobalKey<FormState>();
  var inputMask = MaskTextInputFormatter(
      mask: '#### #### #### ####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              for (var input in widget.form['Field'])
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: buildInputDecoration(context,
                        label: input['Label'],
                        placeholder: input['Placeholder'],
                        icon: setPath(
                            input['Icon']['data']['attributes']['url'])),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
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
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SvgPicture.network(icon,
            height: 6, color: colorsTheme(context).primary),
      ),
      fillColor: Colors.white,
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
