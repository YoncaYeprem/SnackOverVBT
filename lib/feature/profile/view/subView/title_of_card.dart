part of '../profile_view.dart';

extension TitleCard on ProfileView {
  Row titleOfTheCard(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: context.dynamicHeight(0.04),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network('https://picsum.photos/250?image=9'),
          ),
        ),
        Padding(
          padding: context.horizontalPaddingLow,
          child: Text(
            'Beyza Karadeniz',
            style: context.textTheme.headline5,
          ),
        ),
        Text('.12H ago',
            style: context.textTheme.headline6
                ?.copyWith(fontWeight: FontWeight.w100)),
      ],
    );
  }
}
