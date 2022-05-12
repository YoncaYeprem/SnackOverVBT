part of '../home_view.dart';

extension CommentText on HomeView {
  Padding commentText(BuildContext context, String questionContent) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          questionContent,
          maxLines: 3, // TODO 3 noktalı yapıcak
          style: context.textTheme.headline6,
        ),
      ),
    );
  }
}
