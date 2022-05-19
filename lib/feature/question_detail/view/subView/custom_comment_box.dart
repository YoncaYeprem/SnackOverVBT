part of '../question_detail_view.dart';

extension CommentBoxExtension on QuestionDetailView {
  Row commentBox(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              user?.photoUrl ??
                  'https://flyclipart.com/thumb2/avatar-contact-person-profile-user-icon-137780.png',
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
                    "${user?.name} ".capitalize() +
                        "${user?.surname}".capitalize(),
                    style: context.textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "This is a answer comment example. " * 9,
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
