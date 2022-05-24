import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snack_over_vbt/feature/add_question/model/question_model.dart';
import 'package:kartal/kartal.dart';
import 'package:snack_over_vbt/product/utils/extension/capitaliaze_extension.dart';
import '../../login/model/user_model.dart';
import '../model/comment_model.dart';
import '../viewmodel/cubit/question_detail_cubit.dart';

part './subView/star_comment_icon_row.dart';
part './subView/custom_app_bar.dart';
part './subView/comment_input_field.dart';
part './subView/custom_comment_box.dart';

class QuestionDetailView extends StatelessWidget {
  QuestionDetailView({Key? key, required this.question, required this.questionOwner}) : super(key: key);
  QuestionModel question;
  UserModel questionOwner;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuestionDetailCubit>(
        create: (context) => QuestionDetailCubit(question: question, context: context, questionOwner: questionOwner),
        child: BlocConsumer<QuestionDetailCubit, QuestionDetailState>(
          listener: (context, state) {},
          builder: (context, state) {
            var edgeInsets = const EdgeInsets.fromLTRB(10, 5, 10, 3);
            return Scaffold(
              appBar: _appBar(context),
              body: SafeArea(
                  child: context.read<QuestionDetailCubit>().isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          children: [
                            Expanded(
                                flex: 12,
                                child: Padding(
                                    padding: context.horizontalPaddingLow,
                                    child: SingleChildScrollView(
                                        child: Padding(
                                            padding: context.verticalPaddingLow,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                question.questionImage != null
                                                    ? ClipRRect(
                                                        borderRadius: context.lowBorderRadius,
                                                        child: Image.network(
                                                          question.questionImage!,
                                                          fit: BoxFit.fill,
                                                          height: context.dynamicHeight(0.3),
                                                          width: context.dynamicWidth(1),
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                                context.emptySizedHeightBoxLow,
                                                Padding(
                                                  padding: context.horizontalPaddingLow,
                                                  child: Text(
                                                    question.questionTitle ?? "",
                                                    style: context.textTheme.headline4?.copyWith(
                                                        color: context.colorScheme.primary,
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                                context.emptySizedHeightBoxLow,
                                                Padding(
                                                  padding: context.horizontalPaddingLow,
                                                  child: Text(
                                                    question.questionContent ?? "",
                                                    style: context.textTheme.headline5?.copyWith(
                                                      color: context.colorScheme.primary,
                                                    ),
                                                    textAlign: TextAlign.justify,
                                                  ),
                                                ),
                                                starCommentRow(context),
                                                Padding(
                                                  padding: context.horizontalPaddingLow,
                                                  child: Divider(color: context.colorScheme.background),
                                                ),
                                                Padding(
                                                  padding: context.horizontalPaddingLow,
                                                  child: ListView.builder(
                                                    itemCount: context.read<QuestionDetailCubit>().commentsList?.length,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    physics: const NeverScrollableScrollPhysics(),
                                                    itemBuilder: (context, index) {
                                                      var comment =
                                                          context.read<QuestionDetailCubit>().commentsList?[index];
                                                      return commentBox(context, comment);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ))))),
                            Padding(
                              padding: edgeInsets,
                              child: commentInputField(context),
                            ),
                          ],
                        )),
            );
          },
        ));
  }
}
