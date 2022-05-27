import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:snack_over_vbt/feature/question_detail/view/question_detail_view.dart';

import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/theme/color/i_color.dart';
import '../../../product/utils/extension/capitaliaze_extension.dart';
import '../../../product/utils/image_network_url.dart';
import '../../../product/utils/question_example_text.dart';
import '../viewmodel/cubit/home_cubit.dart';

part '../view/subView/comment_icon_number.dart';
part '../view/subView/comment_text.dart';
part '../view/subView/general_title.dart';
part '../view/subView/text_field.dart';
part '../view/subView/title_of_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textSize = 40;
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(context),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var questionData = context.read<HomeCubit>().questionsList;
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _appbar(context),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    generalTitle(textSize),
                    searchBar(context),
                  ],
                ),
              ),
              context.read<HomeCubit>().isLoading
                  ? const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                      context.read<HomeCubit>().getQuestionQwnerImage(userId: questionData?[index].questionOwnerId);
                      return InkWell(
                        onTap: () {
                          context.navigateToPage(QuestionDetailView(
                            question: context.read<HomeCubit>().questionsList![index],
                            questionOwner: context.read<HomeCubit>().questionImage!,
                          ));
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: context.lowBorderRadius,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: context.paddingLow,
                                child: titleOfTheCard(context,
                                    imgUrl: context.read<HomeCubit>().questionImage?.photoUrl ??
                                        ImageNetworkUrl.profileImageHome,
                                    surname: "${context.read<HomeCubit>().questionImage?.surname}".capitalize(),
                                    name: "${context.read<HomeCubit>().questionImage?.name}".capitalize()),
                              ),
                              commentText(context, questionData?[index].questionContent.toString().capitalize() ?? 'a'),
                              Row(
                                children: [likeButton(context), likeNumber(context), commentIconAndNumber(context)],
                              )
                            ],
                          ),
                        ),
                      );
                    }, childCount: questionData?.length))
            ],
          );
        },
      ),
    );
  }

  SliverAppBar _appbar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: context.paddingLow,
        child: Container(
          height: context.dynamicHeight(0.1),
          width: context.dynamicWidth(0.2),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Icon(Icons.notification_add, color: context.appTheme.colorScheme.onSecondary),
        ),
      ),
      actions: [
        SizedBox(
          height: context.dynamicHeight(0.15),
          width: context.dynamicWidth(0.18),
          child: CircleAvatar(
              backgroundImage: NetworkImage(
            context.read<HomeCubit>().userImage?.photoUrl ?? ImageNetworkUrl.profileImageHome,
          )),
        )
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
        QuestionDummyText.questionHomePageComment,
        textAlign: TextAlign.center,
        style: context.textTheme.headline6,
      ),
    );
  }
}
