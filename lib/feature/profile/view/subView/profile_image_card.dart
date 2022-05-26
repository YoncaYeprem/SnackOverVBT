part of '../profile_view.dart';

extension ProfileImageCard on ProfileView {
  Container profileImageCard(BuildContext context, String profileImageURL) {
    return Container(
      width: context.dynamicWidth(0.25),
      height: context.dynamicHeight(0.11),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: context.normalBorderRadius,
      ),
      child: ClipRRect(
        borderRadius: context.normalBorderRadius,
        child: Image.network(
          profileImageURL,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
