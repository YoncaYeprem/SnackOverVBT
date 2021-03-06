part of '../profile_view.dart';

extension ProfileMoreButton on ProfileView {
  Widget profileMoreButton({BuildContext? context, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
          color: Colors.white,
          borderRadius: context?.lowBorderRadius,
        ),
        child: Padding(
          padding: context!.paddingLow,
          child: const Icon(Icons.more_horiz),
        ),
      ),
    );
  }

  IconButton commentMoreButton(BuildContext context) {
    return IconButton(
      onPressed: (() {}),
      icon: Icon(
        Icons.delete_forever,
        color: context.colorScheme.error.withOpacity(0.6),
      ),
    );
  }
}
