import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:snack_over_vbt/core/init/router/router_page/router_navigation.gr.dart';
import 'package:snack_over_vbt/feature/profile/view/modules/profile_settings/view/profile_settings_view.dart';

import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/theme/color/i_color.dart';
part '../view/subView/text_field.dart';
part '../view/subView/comment_text.dart';
part '../view/subView/comment_icon_number.dart';
part '../view/subView/general_title.dart';
part '../view/subView/title_of_card.dart';
part '../view/subView/back_button.dart';
part '../view/subView/profile_more_button.dart';
part '../view/subView/profile_image_card.dart';
part '../view/subView/profile_name_text.dart';
part '../view/subView/profile_biography_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            width: context.width,
            height: context.height,
          ),
          Stack(
            children: [
              Container(
                width: context.width,
                height: context.dynamicHeight(0.35),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.appTheme.colorScheme.primaryContainer,
                      context.appTheme.colorScheme.secondaryContainer,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 20,
                child: backButton(context),
              ),
              Positioned.fill(
                child: Padding(
                  padding: context.verticalPaddingMedium,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        profileImageCard(context,
                            "https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png"),
                            "https://yt3.ggpht.com/Ri_-Z2lzJA34shodzbi4eqE2KftIr5pke9E37e8i_iyy_9JlxcQJxPvXkeDZUttqraEfS-FA=s900-c-k-c0x00ffffff-no-rj"),

                        profileNameText(context, "Mert Can Kıyak"),
                        profileBiographyText(
                            context, "Hi I'am Junior Developer"),
                        Container(),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: profileMoreButton(
                    context: context,
                    onTap: () async {
                      await context.router.push(ProfileSettingsViewRoute());
                    }),
                child: profileMoreButton(context),
              ),
            ],
          ),
          //
          Positioned(
            bottom: 0,
            child: Container(
              width: context.width,
              height: context.dynamicHeight(0.60),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: context.colorScheme.onTertiary,
              ),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      padding: context.verticalPaddingLow,
                      labelPadding: const EdgeInsets.all(10),
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(width: 3.0, color: Colors.amber),
                        insets: EdgeInsets.symmetric(horizontal: 64.0),
                      ),
                      tabs: [
                        Text(
                          LocaleKeys.profile_myQuestionTitle.tr(),
                          style: context.textTheme.headline5,
                        ),
                        Text(
                          LocaleKeys.profile_myAnswerTitle.tr(),
                          style: context.textTheme.headline5,
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        //Tabpage 1
                        _myQuestionTabPage(context),
                        //Tabpage2
                        _myAnswerTabpage(context),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _myQuestionTabPage(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: searchQuestionBar(context),
        ),
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: context.lowBorderRadius,
          ),
          child: Column(
            children: [
              commentText(context,
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      likeButton(context),
                      likeNumber(context),
                      commentIconAndNumber(context),
                    ],
                  ),
                  commentMoreButton(context),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Column _myAnswerTabpage(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: searchAnswerBar(context),
        ),
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: context.lowBorderRadius,
          ),
          child: Column(
            children: [
              commentText(context,
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    likeButton(context),
                    likeNumber(context),
                    commentIconAndNumber(context)
                  ]),
                  commentMoreButton(context),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  IconButton likeButton(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.star,
          color: context.colorScheme.primary,
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
}
/**
 * 
 * 
 */