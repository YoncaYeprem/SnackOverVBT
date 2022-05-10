part of '../login.dart';

extension SignInEmaiilForm on LoginView {
  Padding signinForm(BuildContext context, LoginState state) {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: NameInput(
                  controller: context.read<LoginCubit>().nameController,
                  label: 'Name',
                ),
              ),
              Expanded(
                child: NameInput(
                  controller: context.read<LoginCubit>().surnameController,
                  label: 'Surname',
                ),
              ),
            ],
          ),
          EmailInput(controller: context.read<LoginCubit>().emailController),
          SizedBox(height: context.dynamicHeight(0.01)),
          PasswordInputField(
            controller: context.read<LoginCubit>().passwordController,
            onValidator: (value) =>
                context.read<LoginCubit>().passwordController.text == value
                    ? null
                    : LocaleKeys.validation_notSameText.tr(),
          ),
          SizedBox(height: context.dynamicHeight(0.01)),
          SizedBox(
            width: context.dynamicWidth(0.9),
            child: ElevatedButton(
                onPressed: () {
                  context.read<LoginCubit>().signUpWithEmailPassword();
                },
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    shadowColor: Colors.pink,
                    primary: (Colors.pink)),
                child: Text(LocaleKeys.login_title.tr())),
          ),
          SizedBox(height: context.dynamicHeight(0.04)),
        ],
      ),
    );
  }
}
