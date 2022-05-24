part of '../question_detail_view.dart';

extension CustomRowExtension on QuestionDetailView {
  Row starCommentRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star_border_rounded,
                  color: context.read<QuestionDetailCubit>().isStared
                      ? Colors.amber
                      : context.colorScheme.background,
                )),
            Text("215 Yıldızlama", style: context.textTheme.labelMedium),
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon:
                    Icon(Icons.message, color: context.colorScheme.background)),
            Text("215 Yorum", style: context.textTheme.labelMedium),
          ],
        ),
      ],
    );
  }
}