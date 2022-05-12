part of '../profile_view.dart';

extension ProfileMoreButton on ProfileView {
  Container profileMoreButton(BuildContext context) {
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
        padding: context.paddingLow,
        child: const Icon(Icons.more_horiz),
      ),
    );
  }

  IconButton commentMoreButton(BuildContext context) {
    return IconButton(
      onPressed: (() {}),
      icon: const Icon(Icons.more_vert),
    );
  }
}
