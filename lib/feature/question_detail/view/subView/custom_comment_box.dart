part of '../question_detail_view.dart';

extension CommentBoxExtension on QuestionDetailView {
  Row commentBox(BuildContext context, CommentModel? comment) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              comment?.ownerImageUrl == null || (comment?.ownerImageUrl?.isEmpty ?? false)
                  ? ImageNetworkUrl.profileImageHome
                  : comment?.ownerImageUrl ?? "",
            )),
        Expanded(
          child: Card(
            elevation: 2,
            child: Padding(
              padding: context.paddingNormal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment?.ownerFullName ?? "",
                    style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    comment?.commentContent ?? "",
                    maxLines: null,
                    textAlign: TextAlign.justify,
                    style: context.textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
