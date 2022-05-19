part of '../question_detail_view.dart';

extension InputFieldExtension on QuestionDetailView {
  Row commentInputField(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextFormField(
            controller:
                context.read<QuestionDetailCubit>().commentEditingController,
            keyboardType: TextInputType.text,
            style: context.textTheme.headlineSmall
                ?.copyWith(color: context.appTheme.colorScheme.onSurface),
            textAlignVertical: TextAlignVertical.center,
            maxLines: null,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: context.colorScheme.background.withOpacity(0.7),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              prefixIcon: Icon(
                Icons.message_rounded,
                color: context.appTheme.colorScheme.onSurface,
              ),
              hintText: 'Yorumunuzu Yazınız',
              hintStyle: context.textTheme.headlineSmall
                  ?.copyWith(color: context.appTheme.colorScheme.onSurface),
              contentPadding: context.verticalPaddingLow,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: MaterialButton(
          onPressed: () {
            context.read<QuestionDetailCubit>().sendComment();
          },
          color: context.appTheme.colorScheme.background.withOpacity(0.7),
          textColor: Colors.white,
          child: const Icon(
            Icons.send,
          ),
          padding: context.paddingNormal,
          shape: const CircleBorder(),
        ))
      ],
    );
  }
}
