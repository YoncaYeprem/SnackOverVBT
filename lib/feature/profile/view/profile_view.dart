import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../core/init/router/router_page/router_navigation.gr.dart';
import '../../../product/utils/extension/capitaliaze_extension.dart';

import '../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/cubit/profile_cubit.dart';
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
    return BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit(context),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: context.read<ProfileCubit>().isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      children: [
                        SizedBox(
                          width: context.width,
                          height: context.height,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: context.width,
                              height: context.dynamicHeight(0.30),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    context
                                        .appTheme.colorScheme.primaryContainer,
                                    context.appTheme.colorScheme
                                        .secondaryContainer,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Padding(
                                padding: context.verticalPaddingMedium,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      profileImageCard(
                                          context,
                                          context
                                                  .read<ProfileCubit>()
                                                  .userModel
                                                  ?.photoUrl ??
                                              "https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png"),
                                      profileNameText(
                                          context,
                                          "${context.read<ProfileCubit>().userModel?.name} "
                                                  .capitalize() +
                                              "${context.read<ProfileCubit>().userModel?.surname}"
                                                  .capitalize()),
                                      profileBiographyText(
                                          context,
                                          context
                                                  .read<ProfileCubit>()
                                                  .userModel
                                                  ?.email ??
                                              ""),
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
                                    await context.router
                                        .push(ProfileSettingsViewRoute());
                                  }),
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
                                    indicator: UnderlineTabIndicator(
                                      borderSide: BorderSide(
                                        width: 3.0,
                                        color: context.colorScheme.error
                                            .withOpacity(0.6),
                                      ),
                                      insets: EdgeInsets.symmetric(
                                          horizontal: 64.0),
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
            ),
          );
        },
      ),
    );
  }

  Column _myQuestionTabPage(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: searchQuestionBar(
              context, LocaleKeys.profile_searchQuestionTitle.tr()),
        ),
        SizedBox(
          height: context.dynamicHeight(0.4),
          child: Padding(
            padding: context.paddingLow,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: context.read<ProfileCubit>().myQuestions?.length,
              itemBuilder: (context, index) {
                var question = context.read<ProfileCubit>().myQuestions?[index];
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: context.lowBorderRadius,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commentText(context, question?.questionContent ?? ""),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // likeButton(context),
                          // likeNumber(context),
                          commentIconAndNumber(
                              context: context,
                              icon: Icons.star,
                              countNumber: "12k"),

                          commentIconAndNumber(
                              context: context,
                              icon: Icons.message_outlined,
                              countNumber: "12k"),
                          commentMoreButton(context)
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Column _myAnswerTabpage(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: searchQuestionBar(
              context, LocaleKeys.profile_searchAnswerTitle.tr()),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // likeButton(context),
                  // likeNumber(context),
                  commentIconAndNumber(
                      context: context, icon: Icons.star, countNumber: "12k"),

                  commentMoreButton(context)
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