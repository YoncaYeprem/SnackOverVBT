import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/init/lang/locale_keys.g.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController? controller;

  const EmailInput({Key? key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: const [AutofillHints.email],
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      style: context.textTheme.subtitle1,
      validator: (value) => value.isValidEmail ? null : LocaleKeys.validation_notValidEmail.tr(),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: LocaleKeys.login_email.tr(),
          prefixIcon: const Icon(Icons.mail)),
    );
  }
}
