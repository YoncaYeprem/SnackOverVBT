part of '../question_detail_view.dart';

extension AppBarExtension on QuestionDetailView {
  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0,
      leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: context.colorScheme.background,
          )),
      title: Row(children: [
        CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              context.read<QuestionDetailCubit>().questionOwner.photoUrl ??
                  'https://flyclipart.com/thumb2/avatar-contact-person-profile-user-icon-137780.png',
            )),
        Padding(
          padding: context.horizontalPaddingNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${context.read<QuestionDetailCubit>().questionOwner.name} ".capitalize() +
                    "${context.read<QuestionDetailCubit>().questionOwner.surname} ".capitalize(),
                style: context.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                context.read<QuestionDetailCubit>().question.questionCategory?[0] ?? "",
                style: context.textTheme.headline5,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
