part of '../profile_view.dart';

extension ProfileBiographyText on ProfileView {
  Text profileBiographyText(BuildContext context, String profileBiography) {
    return Text(
      profileBiography,
      style: context.textTheme.headline6
          ?.copyWith(fontWeight: FontWeight.w100, color: Colors.white),
      textAlign: TextAlign.center,
    );
  }
}
