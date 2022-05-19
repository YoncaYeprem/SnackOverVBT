part of '../profile_view.dart';

extension CommentIcon on ProfileView {
  Row commentIconAndNumber({required BuildContext context, required IconData icon, required String countNumber}) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: context.colorScheme.primary,
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            countNumber,
            textAlign: TextAlign.center,
            style: context.textTheme.headline6,
          ),
        ),
      ],
    );
  }
}
