part of '../home_view.dart';

extension GeneralTitle on HomeView {
  Align generalTitle(double textSize) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        LocaleKeys.home_discover.tr(),
        style: TextStyle(fontSize: textSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}
