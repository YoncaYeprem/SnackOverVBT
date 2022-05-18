part of '../profile_view.dart';

extension ProfileNameText on ProfileView {
  Text profileNameText(BuildContext context, String profileName) {
    return Text(
      profileName,
      style: context.textTheme.headline5
          ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      textAlign: TextAlign.center,
    );
  }
}
