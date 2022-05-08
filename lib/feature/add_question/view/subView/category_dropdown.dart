part of '../add_question_sheet.dart';

extension DropdownbuttonExtension on AddQuestionSheet {
  DropdownButton<String> categoryDropdownButton(BuildContext context) {
    return DropdownButton(
      focusNode: context.read<AddQuestionCubit>().questionCategoryNode,
      isExpanded: true,
      hint: Text("Choose Question Category",
          style: context.textTheme.labelLarge?.copyWith(
            color: AppColors().darkGrey,
          )),
      dropdownColor: AppColors().backgroundColor,
      underline: const SizedBox(),
      style: context.textTheme.labelLarge,
      value: context.read<AddQuestionCubit>().dropdownCategory,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: context.read<AddQuestionCubit>().categories.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? newValue) {
        context.read<AddQuestionCubit>().changeDropdownValue(
            newValue ?? context.read<AddQuestionCubit>().categories[0]);
      },
    );
  }
}
