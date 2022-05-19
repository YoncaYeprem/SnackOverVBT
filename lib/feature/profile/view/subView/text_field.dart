part of '../profile_view.dart';

extension TextFieldExtension on ProfileView {
  TextField searchQuestionBar(BuildContext context, String hint) {
    return TextField(
      autofocus: false,
      style: context.textTheme.headline5,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: context.textTheme.headline5,
        filled: true,
        suffixIcon: const Icon(Icons.search),
        suffixIconColor: context.colorScheme.primary,
        fillColor: context.colorScheme.outline,
        contentPadding: context.paddingLow,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.colorScheme.onPrimary),
          borderRadius: context.lowBorderRadius,
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colorScheme.background),
            borderRadius: context.lowBorderRadius),
      ),
    );
  }
}
