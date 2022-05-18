part of '../profile_view.dart';

extension TextFieldExtension on ProfileView {
  TextField searchQuestionBar(BuildContext context) {
    return TextField(
      autofocus: false,
      style: context.textTheme.headline4,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: LocaleKeys.profile_searchQuestionTitle.tr(),
        hintStyle: context.textTheme.headline4,
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

  TextField searchAnswerBar(BuildContext context) {
    return TextField(
      autofocus: false,
      style: context.textTheme.headline4,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: LocaleKeys.profile_searchAnswerTitle.tr(),
        hintStyle: context.textTheme.headline4,
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
