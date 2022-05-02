part of '../home_view.dart';

extension CommentText on HomeView {
  Padding commentText(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac risus posuere, dapibus est non, vestibulum ante. Mauris faucibus mi ex, at pharetra massa condimentum sit amet.',
        maxLines: 3,
        style: context.textTheme.headline6,
      ),
    );
  }
}
