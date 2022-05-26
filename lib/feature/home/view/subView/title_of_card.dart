part of '../home_view.dart';

extension TitleCard on HomeView {
  Row titleOfTheCard(BuildContext context, {String? imgUrl, String? name, String? surname}) {
    return Row(
      children: [
        SizedBox(
          height: context.dynamicHeight(0.04),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(imgUrl!),
          ),
        ),
        Expanded(
          child: Padding(
            padding: context.horizontalPaddingLow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$name $surname',
                  style: context.textTheme.headline5,
                ),
                Text(QuestionDummyText.questionTimeHours,
                    style:
                        context.textTheme.headline6?.copyWith(color: context.colorScheme.background.withOpacity(0.8))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
