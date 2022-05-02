part of '../home_view.dart';

extension CommentIcon on HomeView {
  Row commentIconAndNumber(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.messenger_rounded,
              color: context.colorScheme.primary,
              size: context.dynamicHeight(0.045),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            '12k',
            textAlign: TextAlign.center,
            style: context.textTheme.headline6,
          ),
        ),
      ],
    );
  }
}
