part of '../home_view.dart';

extension AppBarExtension on HomeView {
  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: context.paddingLow,
        child: Container(
          height: context.dynamicHeight(0.1),
          width: context.dynamicWidth(0.18),
          decoration: BoxDecoration(color: Colors.white54, borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.settings),
        ),
      ),
      actions: [
        SizedBox(
          height: context.dynamicHeight(0.1),
          width: context.dynamicWidth(0.18),
          child: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                'https://media.kommunity.com/avatar/059df322-7cda-4157-8e9e-47c4a83426b3_avatar_5f2cf9025e420.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
