import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:snack_over_vbt/core/init/lang/locale_keys.g.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String? value) onValidator;

  const PasswordInputField({Key? key, this.controller, required this.onValidator}) : super(key: key);
  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  final int _minumumPasswordLenght = 6;
  bool _isSecureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autofillHints: [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      validator: (value) => validateText(value ?? ''),
      obscureText: _isSecureText,
      style: context.textTheme.subtitle1?.copyWith(color: Colors.black),
      decoration: buildInputDecoration(),
    );
  }

  String? validateText(String value) {
    if (widget.onValidator != null) {
      return widget.onValidator(value);
    } else {
      return value.isEmpty && value.length < _minumumPasswordLenght ? LocaleKeys.validation_notSameText.tr() : null;
    }
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      labelText: LocaleKeys.input_password.tr(),
      prefixIcon: Icon(Icons.lock),
      suffixIcon: IconButton(
        icon: buildAnimatedCrossFade,
        onPressed: _changeSecureText,
      ),
    );
  }

  void _changeSecureText() {
    setState(() {
      _isSecureText = !_isSecureText;
    });
  }

  CrossFadeState get isCrossFadeState => _isSecureText ? CrossFadeState.showFirst : CrossFadeState.showSecond;

  AnimatedCrossFade get buildAnimatedCrossFade {
    return AnimatedCrossFade(
      crossFadeState: isCrossFadeState,
      firstCurve: Curves.easeInOut,
      duration: context.durationLow,
      firstChild: Icon(Icons.visibility),
      secondChild: Icon(Icons.visibility_off),
    );
  }
}
