import 'package:flutter/material.dart';
import 'package:snack_over_vbt/core/init/lang/locale_keys.g.dart';
import 'package:snack_over_vbt/core/init/theme/color/i_color.dart';
import 'package:kartal/kartal.dart';
import 'package:easy_localization/easy_localization.dart';

part '../view/subView/appbar_view.dart';
part '../view/subView/general_title.dart';
part '../view/subView/title_of_card.dart';
part '../view/subView/text_field.dart';
part '../view/subView/comment_text.dart';
part '../view/subView/comment_icon_number.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textSize = 40;
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: context.paddingNormal,
            child: Column(
              children: [
                generalTitle(textSize),
                Padding(
                  padding: context.verticalPaddingLow,
                  child: searchBar(context),
                ),
                SizedBox(
                  height: context.dynamicHeight(1),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: context.dynamicHeight(0.2),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: context.lowBorderRadius,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: context.paddingLow,
                                child: titleOfTheCard(context),
                              ),
                              commentText(context),
                              SizedBox(
                                height: context.dynamicHeight(0.046),
                                child: Row(
                                  children: [
                                    likeButton(context),
                                    likeNumber(context),
                                    SizedBox(
                                      width: context.dynamicWidth(0.1),
                                    ),
                                    commentIconAndNumber(context)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton likeButton(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.star,
          color: context.colorScheme.primary,
          size: context.dynamicHeight(0.045),
        ));
  }

  Align likeNumber(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        '12k',
        textAlign: TextAlign.center,
        style: context.textTheme.headline6,
      ),
    );
  }

  SizedBox sizedBoxForPadding(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.03),
    );
  }
}
