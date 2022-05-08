import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../core/init/theme/color/i_color.dart';
import '../viewmodel/cubit/add_question_cubit.dart';
part './subView/questionTextFormField.dart';
part './subView/category_dropdown.dart';

class AddQuestionSheet extends StatelessWidget {
  const AddQuestionSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddQuestionCubit>(
      create: (context) => AddQuestionCubit(),
      child: BlocConsumer<AddQuestionCubit, AddQuestionState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            physics:
                context.read<AddQuestionCubit>().questionTitleNode.hasFocus ||
                        context
                            .read<AddQuestionCubit>()
                            .questionContentNode
                            .hasFocus ||
                        context
                            .read<AddQuestionCubit>()
                            .questionCategoryNode
                            .hasFocus
                    ? const ScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    closeSheetIcon(context),
                    Padding(
                      padding: context.horizontalPaddingNormal,
                      child: buildBody(context),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Align closeSheetIcon(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.close,
              color: AppColors().darkGrey,
            )));
  }

  Column buildBody(BuildContext context) {
    return Column(
      children: [
        context.read<AddQuestionCubit>().image != null
            ? imageContainer(context)
            : addImageButton(context),
        context.emptySizedHeightBoxLow,
        questionTextFormField(
            context: context,
            hint: 'Question Title',
            contoller: context.read<AddQuestionCubit>().questionTitleContoller,
            node: context.read<AddQuestionCubit>().questionTitleNode),
        context.emptySizedHeightBoxLow,
        questionTextFormField(
            context: context,
            hint: 'Question Content',
            contoller:
                context.read<AddQuestionCubit>().questionContentContoller,
            node: context.read<AddQuestionCubit>().questionContentNode,
            minLine: 6,
            maxLine: 100),
        context.emptySizedHeightBoxLow,
        dropdownContainer(context),
        askQuestionButton(context)
      ],
    );
  }

  ClipRRect imageContainer(BuildContext context) {
    return ClipRRect(
      borderRadius: context.lowBorderRadius,
      child: Image.memory(
        context.read<AddQuestionCubit>().image!,
        fit: BoxFit.fill,
        height: context.dynamicHeight(0.2),
        width: context.dynamicWidth(1),
      ),
    );
  }

  ElevatedButton addImageButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        context.read<AddQuestionCubit>().selectImage();
      },
      style: ElevatedButton.styleFrom(
        primary: context.colorScheme.background,
        onPrimary: AppColors().darkGrey,
      ),
      icon: Icon(
        Icons.photo_camera_rounded,
        color: AppColors().darkGrey,
      ), //icon data for elevated button
      label: Text("Add Image For Question"), //label text
    );
  }

  Container dropdownContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors().backgroundColor,
          borderRadius: context.lowBorderRadius),
      child: Padding(
        padding: context.horizontalPaddingLow,
        child: categoryDropdownButton(context),
      ),
    );
  }

  ElevatedButton askQuestionButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: context.horizontalPaddingNormal),
      onPressed: () {
        context.read<AddQuestionCubit>().saveNewQuestionToFirebase();
      },
      child: Text("Ask Now"), //label text
    );
  }
}