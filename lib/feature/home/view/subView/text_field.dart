part of '../home_view.dart';

extension TextFieldExtension on HomeView {
  TextField searchBar(BuildContext context) {
    return TextField(
      autofocus: false,
      style: context.textTheme.headline4,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: LocaleKeys.home_seacrhText.tr(),
        hintStyle: context.textTheme.headline4,
        filled: true,
        suffixIcon: const Icon(Icons.search),
        suffixIconColor: context.colorScheme.primary,
        fillColor: context.colorScheme.onBackground,
        contentPadding: context.paddingLow,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors().lightPinkColor),
          borderRadius: context.lowBorderRadius,
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors().darkGrey), borderRadius: context.lowBorderRadius),
      ),
    );
  }
}
