part of '../profile_view.dart';

extension BackButton on ProfileView {
  Container backButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: context.lowBorderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
