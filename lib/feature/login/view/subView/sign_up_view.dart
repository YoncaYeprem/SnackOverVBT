part of '../login.dart';

extension SignUpEmaiilForm on LoginView {
  Padding signupForm(BuildContext context, LoginState state) {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: NameInput(
                  controller: context.read<LoginCubit>().nameController,
                  label: LocaleKeys.login_name.tr(),
                ),
              ),
              context.emptySizedWidthBoxLow3x,
              Expanded(
                child: NameInput(
                  controller: context.read<LoginCubit>().surnameController,
                  label: LocaleKeys.login_surName.tr(),
                ),
              ),
            ],
          ),
          context.emptySizedHeightBoxLow3x,
          EmailInput(controller: context.read<LoginCubit>().emailRegisterController),
          context.emptySizedHeightBoxLow3x,
          PasswordInputField(
            controller: context.read<LoginCubit>().passwordRegisterController,
            onValidator: (value) => context.read<LoginCubit>().passwordRegisterController.text == value
                ? null
                : LocaleKeys.validation_notSameText.tr(),
          ),
          context.emptySizedHeightBoxLow3x,
          SizedBox(
            width: context.dynamicWidth(0.9),
            child: ElevatedButton(
                onPressed: () {
                  context.read<LoginCubit>().signUpWithEmailPassword();
                },
                style: ElevatedButton.styleFrom(
                    elevation: 10, shadowColor: context.colorScheme.surface, primary: (context.colorScheme.surface)),
                child: Text(LocaleKeys.login_title.tr())),
          ),
          SizedBox(height: context.dynamicHeight(0.04)),
        ],
      ),
    );
  }
}
