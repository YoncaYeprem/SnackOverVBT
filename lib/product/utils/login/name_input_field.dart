import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/init/lang/locale_keys.g.dart';

class NameInput extends StatelessWidget {
  final TextEditingController? controller;
  final String label;

  const NameInput({Key? key, this.controller, required this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      style: context.textTheme.subtitle1
          ?.copyWith(color: context.colorScheme.onPrimary),
      //validator: (value) => value.isValidEmail ? null : LocaleKeys.validation_notValidEmail.tr(),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: label,
          prefixIcon: Icon(Icons.person)),
    );
  }
}
