part of '../profile_view.dart';

extension CommentText on ProfileView {
  Padding commentText(BuildContext context, String questionContent) {
    return Padding(
      padding: context.paddingNormal,
      child: Text(
        questionContent,
        textAlign: TextAlign.left,
        maxLines: 3, // TODO 3 noktalı yapıcak
        style: context.textTheme.headline5,
      ),
    );
  }
}
