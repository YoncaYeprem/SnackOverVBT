part of '../add_question_sheet.dart';

extension TextFormFieldExtension on AddQuestionSheet {
  TextFormField questionTextFormField({required BuildContext context, required String hint,required TextEditingController contoller, required FocusNode node, int? minLine, int? maxLine}) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: contoller,
      focusNode: node,
      style: context.textTheme.labelLarge,
      minLines: minLine ?? 1,
      maxLines: maxLine ?? 3,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle:
            context.textTheme.labelLarge?.copyWith(color: AppColors().darkGrey),
        filled: true,
        fillColor: AppColors().backgroundColor,
        contentPadding: context.paddingLow,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors().lightPinkColor),
          borderRadius: context.lowBorderRadius,
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors().darkGrey),
            borderRadius: context.lowBorderRadius),
      ),
    );
  }
}
