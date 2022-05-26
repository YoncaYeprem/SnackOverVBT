part of '../login.dart';

extension SignUpEmaiilForm on LoginView {
  Padding signupForm(BuildContext context, LoginState state) {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        children: [
          EmailInput(controller: context.read<LoginCubit>().emailController),
          SizedBox(height: context.dynamicHeight(0.01)),
          PasswordInputField(
            controller: context.read<LoginCubit>().passwordController,
            onValidator: (value) => context.read<LoginCubit>().passwordController.text == value
                ? null
                : LocaleKeys.validation_notSameText.tr(),
          ),
          SizedBox(height: context.dynamicHeight(0.01)),
          SizedBox(
            width: context.dynamicWidth(0.9),
            child: ElevatedButton(
                onPressed: () {
                  context.read<LoginCubit>().signInWithEmailPassword();
                },
                style: ElevatedButton.styleFrom(elevation: 10, shadowColor: Colors.pink, primary: (Colors.pink)),
                child: Text(LocaleKeys.login_title.tr())),
          ),
          SizedBox(height: context.dynamicHeight(0.04)),
          Text(LocaleKeys.login_orLogin.tr()),
          SizedBox(height: context.dynamicHeight(0.04)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleIconButton(
                color: context.colorScheme.error,
                icon: FontAwesomeIcons.google,
                height: context.dynamicHeight(0.08),
                onPressed: () async {
                  context.read<LoginCubit>().signInWithGoogle();
                },
              ),
              CircleIconButton(
                color: context.colorScheme.onError,
                icon: FontAwesomeIcons.apple,
                height: context.dynamicHeight(0.08),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
